@cls
@echo [ S T A R T . . . ]
@echo =========================================================== 
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c kernel/kernel/kernel.c -o kernel.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c kernel/arch/i386/tty.c -o tty.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c kernel/arch/i386/boot.S -o boot.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c kernel/arch/i386/crti.S -o crti.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c kernel/arch/i386/crtn.S -o crtn.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c libc/stdio/printf.c -o printf.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c libc/stdio/putchar.c -o putchar.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c libc/stdio/puts.c -o puts.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c libc/stdlib/abort.c -o abort.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c libc/string/memcmp.c -o memcmp.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c libc/string/memcpy.c -o memcpy.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c libc/string/memmove.c -o memmove.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c libc/string/memset.c -o memset.o
@i686-elf-gcc -std=gnu99 -ffreestanding -g -c libc/string/strlen.c -o strlen.o
@i686-elf-gcc -ffreestanding -nostdlib -g -T kernel/arch/i386/linker.ld boot.o crti.o crtn.o printf.o putchar.o puts.o abort.o memcmp.o memcpy.o memmove.o memset.o strlen.o tty.o kernel.o -o Veonter.elf -lgcc
@qemu-system-i386 -kernel Veonter.elf
@echo ===========================================================
@echo [ D O N E ]