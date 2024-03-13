section .data
    hello db 'Hello, World!',0

section .text
    global _start

_start:
    ; System call number 4 corresponds to `write` in
    ; the Linux kernel
    mov eax, 4
    ; File descriptor 1 corresponds to `stdout` in
    ; the Linux kernel
    mov ebx, 1
    ; Sets the source of the data to be written. In
    ; this case, it's the `hello` string defined in
    ; the `.data` section
    mov ecx, hello
    ; Sets the amount of bytes to be written to the
    ; file descriptor.
    mov edx, 13
    ; Triggers the system call, meaning that the kernel
    ; will take over and execute previously specified
    ; instructions
    int 0x80

    ; System call number 1 corresponds to `exit` in
    ; the Linux kernel
    mov eax, 1
    ; Sets the exit code to 0
    mov ebx, 0
    ; Triggers the system call, linux kernel will take over.
    int 0x80


