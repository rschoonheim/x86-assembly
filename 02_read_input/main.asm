section .data
    exit db 'exit', 0

section .bss
    res resb 150

section .text
    global _start

_start:
    ; Loop to read and print input until 'exit' is entered
loop:
    ; Initialize counter
    mov edi, 0

    ; Loop to read input one character at a time
read_loop:
    ; Wait for input from user
    mov eax, 3 ; sys_read
    mov ebx, 0 ; stdin
    lea ecx, [res + edi] ; buffer
    mov edx, 1 ; length
    int 0x80 ; call kernel

    ; Check for newline character
    cmp byte [res + edi], 10
    je end_read_loop

    ; Increment counter
    inc edi

    ; Continue reading
    jmp read_loop

end_read_loop:
    ; Null-terminate the input
    mov byte [res + edi], 0

    ; Compare input to 'exit'
    mov eax, [res]
    cmp eax, dword [exit]
    je exit_program

    ; Print the input
    mov eax, 4 ; sys_write
    mov ebx, 1 ; stdout
    mov ecx, res ; buffer
    mov edx, edi ; length
    int 0x80 ; call kernel

    jmp loop

exit_program:
    ; Exit
    mov eax, 1 ; sys_exit
    mov ebx, 0 ; exit code
    int 0x80 ; call kernel