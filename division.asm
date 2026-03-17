section .text
    global _start

_start:
    ; --- 1. Configuración del Dividendo (123) ---
    ; La instrucción IDIV asume que el dividendo 128 bits está en RDX:RAX.
    ; Para divisiones simples de 64 bits, RDX debe de ser 0.
    mov rdx, 0              ; RDX = 0 (Parte alta del dividendo)
    mov rax, 123            ; RAX = 123 (Dividendo)

    ; --- 2. Configuración del Divisor (10) ---
    mov rbx, 10             ; RBX = 10 (Divisor)

    ; --- 3. Ejecutar División IDIV --- 
    idiv rbx                ; Divide RDX:RAX entre RBX

    ; --- 4. Resultados ---
    ; Cociente (12) queda automáticamente en RAX
    ; Residuo (3) queda automáticamente en RDX

    ; Si queremos usar el residuo, lo movemos a un registro temporal (como RCX).
    mov rcx, rdx            ; RCX = RDX (Residuo/Módulo = 3)

    ; El Cociente (12) permanece en RAX.

    ; 5. Salida del programa
    mov rax, 60             ; sys_exit