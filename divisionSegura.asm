section.data
    ; Mensaje de error con salto de linea (0xA)
    msg_error db "Error: intento de division por cero", 0xA
    len_error equ $ - msg_error

section .text
    global division_segura

division_segura: 
    ; --- 1. Validacion ---
    cmp rsi, 0              ; ¿Es el divisor igual a cero?
    je .abortar            ; 

    ; --- 2. DIVISION NORMAL ---
    mov rdx, 0
    mov rax, rdi
    idiv rsi
    ret

.abortar:
    ; --- 3. IMPRIMIR MENSAJE --- 
    mov rax, 1
    mov rdi, 1
    mov rsi, msg_error
    mov rdx len_error
    syscall

    ; --- 4. TERMINAR PROGRAMA ---
    mov rax, 60
    mov rdi, 1
    syscall