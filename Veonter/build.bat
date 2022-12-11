@cls
@echo [ O S   B U I L D   S T A R T S . . . ]
@echo ===========================================================
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c gdt.s -o gdt.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c kernel.c -o kernel.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c terminal.c -o terminal.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c gdtc.c -o gdtc.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c common.c -o common.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c boot.s -o boot.o
@i686-elf-gcc -ffreestanding -nostdlib -g -T link.ld gdt.o boot.o common.o gdtc.o terminal.o kernel.o -o Veonter.elf -lgcc
@move Veonter.elf isoroot/boot
@del Veonter.iso
@wsl grub-mkrescue isoroot -o Veonter.iso
@cd ..
@start rufus-3.21.exe
@echo ===========================================================
@echo [ D O N E ]