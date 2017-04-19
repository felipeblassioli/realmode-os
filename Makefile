ASM=nasm  
ASMFLAG=-f bin
OS_DISK=disk_images/os.flp

build/%.bin: src/%.asm
	$(ASM) $(ASMFLAG) $< -o $@

floppy: build/kernel.bin
	rm -f $(OS_DISK)
	mkdosfs -C disk_images/os.flp 1440
	dd status=noxfer conv=notrunc if=build/kernel.bin of=$(OS_DISK)

all: floppy
