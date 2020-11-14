Xphosian-MicroProcessor (XMP)

Introduction:
The XMP is an 8-bit microprocessor that supports 10 instructions.
The XMP is an approximation of a simple single-data path MIPS processor
It has room for supporting up 13 instructions and may be extended in the future

XMP features 4 general register, branch and jump instructions, as well as a 
basic code complier. Its program memory is 256 bytes i.e 256 instructions which
is a fair amount allowing for interesting programs like fibonacci sequence. The
short comings of this processor is that its access memory on every call this
can be extended and removed but has not been yet. Another issue
is that this process is made in logism so you cannot just port it to hardware
1-1 you'll need to add power and a working clock schematic but I am not a 
electrical engineer and I don't know where to start on that path. If you make
a neat program send it here lquinn@vt.edu


rd denotes the destination register
Imm2 denotes 2 bit immediate values

Instructions syntax for complier
add: tested
	add rd rs
	Calculates rs + rd and stores the result in rd
	Example: add r0 r1

and: untested
	and rd rs
	Calculates rs & rd and stores the result in rd
	Example: and r0 r1

or: untested
	or rd rs
	Calculates rs | rd and stores the result in rd
	Example: or r0 r1

sub: untested
	sub rd rs
	Calculates rd - rs and stores the result in rd
	Example: sub r0 r1

slt: untested
	slt rd rs
	If  rd < rs than rd = 1
	Example: slt r0 r1

beq: untested
	beq rd rs
	Branches to address in rd if rs == 0 else nop
	Example: beq r0 r1

lw: untested
	lw rd rs
	Loads memory stored at rs in rd. rd = *rs
	Example: lw r0 r1

sw: tested
	sw rd rs
	Stores rd into memory address rs  *rs = rd
	Example: sw r0 r1

li: tested
	li rd Imm2
	Loads a 2-bit zero-extended immediate value into rd
	Example: li r1 0x2

J: tested
	J Imm6
	Set Pc to ZE(Imm6) << 2


A python complier has been provided it should allow for labels
and will place label address at save offsets using nops. Note
we do skip the nops with a jump call if we can. I also include a
function fibonacci program.
