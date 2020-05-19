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

  def store_rom(self,length=32):
    self.stored_code=bytearray(length)
    self.cs.on()
    self.spi.write(bytearray([1, 0,0,(self.code_addr>>8)&0xFF,self.code_addr&0xFF, 0]))
    self.spi.readinto(self.stored_code)
    self.cs.off()
    self.stored_vector=bytearray(2)
    self.cs.on()
    self.spi.write(bytearray([1, 0,0,(self.vector_addr>>8)&0xFF,self.vector_addr&0xFF, 0]))
    self.spi.readinto(self.stored_vector)
    self.cs.off()

  def restore_rom(self):
    self.cs.on()
    self.spi.write(bytearray([0, 0,0,(self.code_addr>>8)&0xFF,self.code_addr&0xFF]))
    self.spi.write(self.stored_code)
    self.cs.off()
    self.cs.on()
    self.spi.write(bytearray([0, 0,0,(self.vector_addr>>8)&0xFF,self.vector_addr&0xFF]))
    self.spi.write(self.stored_vector)
    self.cs.off()
    del self.stored_code
    del self.stored_vector

  def patch_rom(self,regs):
    self.cs.on()
    self.cs.off()

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
            print("Starting address: %04X" % addr)
            print("> SYSTEM")
            print("*? /%d" % addr)
            self.poke(0x40DF,word)
            break
    self.cpu_continue()

  def defunct(self,f):
    self.cpu_halt()
    start_addr = 0
    self.poke(0x40DF,bytearray([start_addr&0xFF,(start_addr>>8)&0xFF]))
    self.cpu_continue()

  def loadcas(self,filename):
    return self.loadcas_stream(open(filename,"rb"))
