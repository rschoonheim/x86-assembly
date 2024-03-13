nasm -f elf32 main.asm -o ./binary/main.o
ld -m elf_i386 ./binary/main.o -o ./binary/main
