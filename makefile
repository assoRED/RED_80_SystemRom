ASSEMBLER=z80asm


all: system_rom.bin


system_rom.bin: boot.asm
	z80asm -o system_rom.bin boot.asm -lsystem_rom.label
