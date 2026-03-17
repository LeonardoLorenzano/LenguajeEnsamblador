section .text
    global _start

_start:
    ; --- 1. Sustracción (40 - 15) --- 
    mov rax, 40              ; RAX = 40 (Minuendo)
    mov rbx, 15              ; RBX = 15 (Sustraendo)
    sub rax, rbx             ; RAX = RAX - RBX (RAX = 25)

    ; --- 2. Multiplicación (25 * 2) ---
    ; La instrucción IMUL con un solo operando (2) asume: 
    ; RAX = RAX * operando
    mov rbx, 2               ; RBX = 2 (El Multiplicador)
    imul rbx                 ; RAX = RAX * RBX (RAX = 25 * 2 = 50)

    ; El resultado final (50) está en RAX

    ; 3. Salida del programa
    mov rax, 60              ; sys_exit
    mov rdi, 0               ; Código de retorno (0 = éxito)
    syscall
     