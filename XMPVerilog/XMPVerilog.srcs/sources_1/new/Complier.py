
import sys,os

translation = {"add":   0b0000, "and":  0b0001, "or":   0b0010, "sub":  0b0011,
               "slt":   0b0100, "beq":  0b0101, "lsh":  0b0110, "rsh":  0b0111,
               "sw":    0b1000, "lw":   0b1001,  "li":  0b1010, "out":  0b1011,
               "J":     0b1100,
               "r0": 0b00, "r1": 0b01, "r2": 0b10, "r3": 0b11,
               "0x0": 0b00, "0x1": 0b01, "0z2": 0b10, "0z3": 0b11}

f = open(sys.argv[1], 'rb')

entry_points = {}

address = 0
assembly = f.read().decode().split("\n")
f.close()
machine_code = ""

for line in assembly:
    line = line.split(";")[0]  # remove comments

    labels = line.split(":")
    if len(labels) > 1:
        assert(labels[0] not in entry_points)
        if address % 4 != 0:
            spaces = 4- address % 4
            address += spaces
            entry_points[labels[0]] = address
            machine_code += hex(0b1100 << 4 | address >> 2)[2:] + " "
            for x in range(spaces-1):
                machine_code += "20 "
        else:
            entry_points[labels[0]] = address

        line = labels[1]

    p = line.strip(' ').split()
    if len(p) == 2:
        instruction = translation[p[0]] << 4 | entry_points[p[1][1:]] >> 2
        machine_code += "%02x" % instruction + " "
    elif len(p) == 3:
        instruction = translation[p[0]] << 4 | translation[p[1]] << 2 | translation[p[2]]
        machine_code += "%02x" % instruction + " "
    else:
        break

    print("%x" % address + " %s" % machine_code[-3:])
    address += 1

print(machine_code)
fpga_clone = machine_code
machine_code = "v2.0 raw\n" + machine_code[:-1] + "\n"
f = open(sys.argv[1][:-2] + "h-logisim", "wb")
f.write(machine_code.encode())
f.close()

f = open (sys.argv[1][:-2] + "h-fpga", "wb")

for x in fpga_clone.split(" "):
    y = x + "\n"

    f.write(y.encode())

f.close()











