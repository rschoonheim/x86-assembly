# X86 - Hello World

## Syntax

### Sections

Assembly files are divided into sections. Those sections are:

- `.data`: Contains initialized data.
- `.bss`: Contains uninitialized data.
- `.text`: Contains the code.

#### .data

The `.data` section contains initialized data. This means that the data is given a value at the time of declaration. The
data is stored in the `.data` section of the object file. The `.data` section is used to store global and static
variables.

```assembly
section .data
    message db 'Hello, World!', 0
```

#### .bss

The `.bss` section contains uninitialized data. This means that the data is not given a value at the time of
declaration.

```assembly
    section .bss
        buffer resb 64
```

#### .text

The `.text` section contains the code. This is where the instructions are stored.

```assembly
section .text
    global _start
```