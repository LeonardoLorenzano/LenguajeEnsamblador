; Función división segura
; Entrada: RDI (dividendo), RSI (divisor)
; Salida: RAX (cociente), RDX (error: 1 su hubo div por cero , 0 si no)

global division_segura

division_segura:
    ; --- 1. Validacion
    cmp rsi, 0                  
    je .error_div_0

    ; --- 2. Procesamiento normal
    mov rdx, 0
    mov rax, rdi
    idiv rsi

    mov rdx, 0
    jmp .fin 

.error_div_0
    ; 3. Manejo de error
    mov rax, 0
    mov rdx, 1

.fin: 
    ret 