with open("galaxy.cas", "rb") as f:
    # Skip to a5
    byte = f.read(1)
    while ord(byte) == 0x00:
        byte = f.read(1)
    if ord(byte) != 0xa5:
        print("No sync byte")
    byte = f.read(1)
    if ord(byte) != 0x55:
        print("No leader byte")
    byte = f.read(1)
    print("Filename: ", end='')
    while ord(byte) != 0x3c:
        print(byte.decode("utf-8"), end='')
        byte = f.read(1)
    print()
    while True:
        byte = f.read(1)
        print("Length: ", end='')
        l = ord(byte)
        if l == 0:
            l = 256
        print(l, end='')
        byte1 = f.read(1)
        byte = f.read(1)
        checksum = ord(byte1) + ord(byte)
        addr = (ord(byte) << 8) + ord(byte1)
        print(", address: ", addr)
        i = 0
        while i < l:
            byte = f.read(1)
            checksum += ord(byte)
            i += 1
        byte = f.read(1)
        checksum = checksum & 0xff
        #print("Checksum: ", checksum, ", byte: ", ord(byte))
        if checksum != ord(byte):
            print("Checksum error")
        byte = f.read(1)
        if ord(byte) == 0x78:
            byte1 = f.read(1)
            byte = f.read(1)
            addr = (ord(byte) << 8) + ord(byte1)
            print("Starting address: ", addr)
            break
    f.close()
