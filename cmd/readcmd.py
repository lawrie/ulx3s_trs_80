#!/usr/bin/env python3

# https://lawlessguy.wordpress.com/2016/12/04/understanding-trs-80-cmd-files/
# converted from C to python by EMARD

class readcmd:
  def readcmd(self,f):
    byte=bytearray(1)
    word=bytearray(2)
    block=bytearray(256)
    while True:
      if f.readinto(byte):
        pass
      else:
        return
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
        print("Reading 01 block, addr %04X, length = %d" % (address,l-2))
        if len(block) != l-2:
          block = bytearray(l-2)
        f.readinto(block)
        continue
      if byte[0]==2:
        # record type 2 is "entry address"
        f.readinto(byte)
        l=byte[0]
        print("Reading 02 block length = %d" % l)
        if l != 2:
          print("unsupported 02 block length")
          return
        entry_address=bytearray(l)
        f.readinto(entry_address)
        jmp_address=(entry_address[1]<<8)+entry_address[0]
        print("Entry point is %d = 0x%04X" % (jmp_address,jmp_address))
        break
      if byte[0]==5:
        # record type 5 is "load module header"
        f.readinto(byte)
        header=bytearray(byte[0])
        f.readinto(header)
        printf("Reading 05 block length = %d" % len(header));
        continue
      print("unknown record type %02X" % byte[0])
      return


c=readcmd()
c.readcmd(open("zaxxon1.cmd","rb"))
