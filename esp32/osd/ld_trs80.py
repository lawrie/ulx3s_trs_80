# micropython ESP32
# ORAO RAM/ROM snapshot image loader

# AUTHOR=EMARD
# LICENSE=BSD

from struct import pack,unpack
from time import sleep_ms

class ld_trs80:
  def __init__(self,spi,cs):
    self.spi=spi
    self.cs=cs
    self.cs.off()
    self.autostart=1

  # LOAD/SAVE and CPU control

  # read from file -> write to SPI RAM
  def load_stream(self, filedata, addr=0, maxlen=0x10000, blocksize=1024):
    block = bytearray(blocksize)
    # Request load
    self.cs.on()
    self.spi.write(bytearray([0,(addr >> 24) & 0xFF, (addr >> 16) & 0xFF, (addr >> 8) & 0xFF, addr & 0xFF]))
    bytes_loaded = 0
    while bytes_loaded < maxlen:
      if filedata.readinto(block):
        self.spi.write(block)
        bytes_loaded += blocksize
      else:
        break
    self.cs.off()
    return bytes_loaded

  # read from SPI RAM -> write to file
  def save_stream(self, filedata, addr=0, length=1024, blocksize=1024):
    bytes_saved = 0
    block = bytearray(blocksize)
    # Request save
    self.cs.on()
    self.spi.write(bytearray([1,(addr >> 24) & 0xFF, (addr >> 16) & 0xFF, (addr >> 8) & 0xFF, addr & 0xFF, 0]))
    while bytes_saved < length:
      self.spi.readinto(block)
      filedata.write(block)
      bytes_saved += len(block)
    self.cs.off()

  def ctrl(self,i):
    self.cs.on()
    self.spi.write(bytearray([0, 0xFF, 0xFF, 0xFF, 0xFF, i]))
    self.cs.off()

  def cpu_halt(self):
    self.ctrl(2)

  def cpu_reset_halt(self):
    self.ctrl(3)

  def cpu_continue(self):
    self.ctrl(0)

  def poke(self,addr,data):
    self.cs.on()
    self.spi.write(bytearray([0,(addr>>24)&0xFF,(addr>>16)&0xFF,(addr>>8)&0xFF,addr&0xFF]))
    self.spi.write(data)
    self.cs.off()

  def peek(self,addr,buffer):
    self.cs.on()
    self.spi.write(bytearray([1,(addr>>24)&0xFF,(addr>>16)&0xFF,(addr>>8)&0xFF,addr&0xFF,0]))
    self.spi.readinto(buffer)
    self.cs.off()

  # call this while CPU is HALTed
  def reset_jmp(self,addr):
    stored_rom = bytearray(3)
    self.peek(0,stored_rom)
    self.poke(0,bytearray([0xC3, addr&0xFF, (addr>>8)&0xFF])) # JMP addr
    self.cpu_reset_halt()
    self.cpu_halt()
    self.cpu_continue()
    sleep_ms(10)
    self.cpu_halt()
    self.poke(0,stored_rom)
    

  # "intelligent" CAS loader
  def loadcas_stream(self,f):
    byte = bytearray(1)
    word = bytearray(2)
    # read 0 until not 0
    while f.readinto(byte):
        if byte[0]:
            break
    if byte[0] != 0xA5:
        print("No sync byte")
        return
    f.readinto(byte)
    if byte[0] != 0x55:
        print("No leader byte")
        return
    filename = bytearray(0)
    while f.readinto(byte) and len(filename) < 64:
        if byte[0] == 0x3C:
            break;
        filename += byte[0:1]
    print("Filename %s" % filename)
    block = bytearray(256)
    self.cpu_halt()
    while True:
        f.readinto(byte)
        l = byte[0]
        if l == 0:
          l = 256
        #print("Length: %d" % l, end="")
        f.readinto(word)
        checksum = word[0] + word[1]
        addr = (word[1] << 8) + word[0]
        #print(", address: %04X" % addr)
        if len(block) != l:
            block = bytearray(l)
        if f.readinto(block):
          for b in block:
              checksum += b
        else:
          print("File too short")
          return
        f.readinto(byte)
        if (checksum & 0xFF) != byte[0]:
            print("Checksum error")
            return
        self.poke(addr,block)
        f.readinto(byte)
        if byte[0] == 0x78:
          f.readinto(word)
          addr = (word[1] << 8) + word[0]
          print("Starting address: 0x%04X" % addr)
          print("> SYSTEM")
          print("*? /%d or just /" % addr)
          self.poke(0x40DF,word)
          if self.autostart:
            self.reset_jmp(addr)
            #stored_rom = bytearray(3)
            #self.peek(0,stored_rom)
            #self.poke(0,bytearray([0xC3])) # JMP ...
            #self.poke(1,word)
            #self.cpu_reset_halt()
            #self.cpu_halt()
            #self.cpu_continue()
            #sleep_ms(10)
            #self.cpu_halt()
            #self.poke(0,stored_rom)
          break
    self.cpu_continue()

  def loadcas(self,filename):
    return self.loadcas_stream(open(filename,"rb"))

  def loadcmd_stream(self,f):
    byte=bytearray(1)
    word=bytearray(2)
    block=bytearray(256)
    self.cpu_halt()
    while f.readinto(byte):
      if byte[0]==1:
        # record type 1 is "load block"
        f.readinto(byte)
        l=byte[0]
        # compensate for special values 0,1, and 2.
        if l<3:
          l+=256
        # read 16-bit load-address
        f.readinto(word)
        address=(word[1]<<8) + word[0]
        #print("Reading 01 block, addr %04X, length = %d" % (address,l-2))
        if len(block) != l-2:
          block = bytearray(l-2)
        f.readinto(block)
        self.poke(address,block)
        continue
      if byte[0]==2:
        # record type 2 is "entry address"
        f.readinto(byte)
        l=byte[0]
        #print("Reading 02 block length = %d" % l)
        if l != 2:
          print("unsupported 02 block length")
          break
        entry_address=bytearray(l)
        f.readinto(entry_address)
        jmp_address=(entry_address[1]<<8)+entry_address[0]
        print("Entry point is %d = 0x%04X" % (jmp_address,jmp_address))
        self.reset_jmp(jmp_address)
        break
      if byte[0]==5:
        # record type 5 is "load module header"
        f.readinto(byte)
        header=bytearray(byte[0])
        f.readinto(header)
        print("Reading 05 block length = %d %s" % (len(header), header.decode()));
        continue
      print("unknown record type %02X" % byte[0])
      break
    self.cpu_continue()

  def loadcmd(self,filename):
    return self.loadcmd_stream(open(filename,"rb"))
