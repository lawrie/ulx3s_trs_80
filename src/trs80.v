`default_nettype none
module trs80 (
  input         clk25_mhz,
  // Buttons
  input [6:0]   btn,
  // HDMI
  output [3:0]  gpdi_dp,
  output [3:0]  gpdi_dn,
  // Keyboard
  output        usb_fpga_pu_dp,
  output        usb_fpga_pu_dn,
  inout         ps2Clk,
  inout         ps2Data,
  // Audio
  output [3:0]  audio_l,
  output [3:0]  audio_r,
  // ESP32 passthru
  input         ftdi_txd,
  output        ftdi_rxd,
  input         wifi_txd,
  output        wifi_rxd,  // SPI from ESP32
  input         wifi_gpio16,
  input         wifi_gpio5,
  output        wifi_gpio0,

  inout  sd_clk, sd_cmd,
  inout   [3:0] sd_d,

  inout  [27:0] gp,gn,
  // Leds
  output [7:0]  leds
);

  // VGA (should be assigned to some gp/gn outputs
  wire   [3:0]  red;
  wire   [3:0]  green;
  wire   [3:0]  blue;
  wire          hSync;
  wire          vSync;
  
  generate
    genvar i;
    for(i = 0; i < 4; i = i+1)
    begin
      assign gp[24-i-14] = red[i];
      assign gn[17-i-14] = green[i];
      assign gn[24-i-14] = blue[i];
    end
  endgenerate
  assign gp[16-14] = vSync;
  assign gp[17-14] = hSync;

  wire          n_WR;
  wire          n_RD;
  wire          n_INT;
  wire [15:0]   cpuAddress;
  wire [7:0]    cpuDataOut;
  wire [7:0]    cpuDataIn;
  wire          n_memWR;
  wire          n_memRD;
  wire          n_ioWR;
  wire          n_ioRD;
  wire          n_MREQ;
  wire          n_IORQ;
  wire          n_M1;
  wire          n_kbdCS;
  
  reg           sound = 0;

  reg [3:0]     cpuClockCount;
  wire          cpuClock;
  wire          cpuClockEnable;
  wire [7:0]    ramOut;

  // passthru to ESP32 micropython serial console
  assign wifi_rxd = ftdi_txd;
  assign ftdi_rxd = wifi_txd;

  // ===============================================================
  // System Clock generation
  // ===============================================================
  wire clk125, clk;

  pll pll_i (
    .clkin(clk25_mhz),
    .clkout0(clk125),
    .clkout1(clk),
    .clkout2(cpuClock)
  );

  // ===============================================================
  // Reset generation
  // ===============================================================
  reg [15:0] pwr_up_reset_counter = 0;
  wire       pwr_up_reset_n = &pwr_up_reset_counter;

  always @(posedge clk) begin
     if (!pwr_up_reset_n)
       pwr_up_reset_counter <= pwr_up_reset_counter + 1;
  end

  // ===============================================================
  // CPU
  // ===============================================================
  wire [15:0] pc;
  
  wire n_hard_reset = pwr_up_reset_n & btn[0];

  tv80n cpu1 (
    .reset_n(n_hard_reset),
    //.clk(cpuClock), // turbo mode 28MHz
    .clk(cpuClockEnable), // normal mode 3.5MHz
    .wait_n(1'b1),
    .int_n(1'b1),
    .nmi_n(1'b1),
    .busrq_n(1'b1),
    .mreq_n(n_MREQ),
    .m1_n(n_M1),
    .iorq_n(n_IORQ),
    .wr_n(n_WR),
    .A(cpuAddress),
    .di(cpuDataIn),
    .do(cpuDataOut),
    .pc(pc)
  );

  assign audio_l = {4{sound}};
  assign audio_r = {4{sound}};

  // ===============================================================
  // RAM
  // ===============================================================
  wire [7:0] vidOut;
  wire [9:0] vga_addr;

  dpram
  #(
    .MEM_INIT_FILE("../roms/trs80.mem")
  )
  ram48 (
    .clk_a(cpuClock),
    .we_a(!n_memWR),
    .addr_a(cpuAddress),
    .din_a(cpuDataOut),
    .dout_a(ramOut),
    .clk_b(clk_vga),
    .addr_b(16'h3c00 + {6'b0, vga_addr}),
    .dout_b(vidOut)
  );

  // ===============================================================
  // Keyboard
  // ===============================================================
  wire [7:0]  key_data;
  wire [10:0] ps2_key;

    // Get PS/2 keyboard events
  ps2 ps2_kbd (
     .clk(clk),
     .ps2_clk(ps2Clk),
     .ps2_data(ps2Data),
     .ps2_key(ps2_key)
  );

  // Keyboard matrix
  keyboard the_keyboard (
    .reset(~n_hard_reset),
    .clk_sys(clk),
    .ps2_key(ps2_key),
    .addr(cpuAddress[7:0]),
    .key_data(key_data),
    .kblayout(1'b1)
  );

  // pull-ups for us2 connector 
  assign usb_fpga_pu_dp = 1;
  assign usb_fpga_pu_dn = 1;
  

  // ===============================================================
  // VGA
  // ===============================================================
  wire clk_vga = clk;
  wire clk_hdmi = clk125;
  wire vga_de;

  video vga (
    .clk(clk_vga),
    .vga_r(red),
    .vga_g(green),
    .vga_b(blue),
    .vga_de(vga_de),
    .vga_hs(hSync),
    .vga_vs(vSync),
    .vga_addr(vga_addr),
    .vga_data(vidOut)
  );

  // Convert VGA to HDMI
  HDMI_out vga2dvid (
    .pixclk(clk_vga),
    .pixclk_x5(clk_hdmi),
    .red  ({red, {4{red[0]}}}),
    .green({green, {4{green[0]}}}),
    .blue ({blue, {4{blue[0]}}}),
    .vde(vga_de),
    .hSync(hSync),
    .vSync(vSync),
    .gpdi_dp(gpdi_dp),
    .gpdi_dn(gpdi_dn)
  );

  // ===============================================================
  // MEMORY READ/WRITE LOGIC
  // ===============================================================

  assign n_ioWR = n_WR | n_IORQ;
  assign n_memWR = n_WR | n_MREQ;
  assign n_ioRD = n_RD | n_IORQ;
  assign n_memRD = n_RD | n_MREQ;

  // ===============================================================
  // Chip selects
  // ===============================================================

  assign n_kbdCS = !(cpuAddress[15:8] == 8'h38);

  // ===============================================================
  // Memory decoding
  // ===============================================================

  assign cpuDataIn =  n_kbdCS == 1'b0 ? key_data :
                      ramOut;

  // ===============================================================
  // CPU clock enable
  // ===============================================================
   
  always @(posedge cpuClock) begin
    cpuClockCount <= cpuClockCount + 1;
  end

  assign cpuClockEnable = cpuClockCount[3]; // 1.75Mhz

  // ===============================================================
  // Leds
  // ===============================================================
  wire led1 = 0;
  wire led2 = 0;
  wire led3 = 0;
  wire led4 = !n_hard_reset;

  assign leds = {led4, led3, led2, led1};

endmodule
