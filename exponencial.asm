; Función exponencial: calcula base-exponente
; Parámetros:
;   rdi = base
;   rsi = exponente
; Retorna:
;   rax = resultado

section .text
global exponencial

exponencial:
    ; rdi = base
    ; rsi = exponente
    
    ; Inicializamos resultado = 1
    mov rax, 1          ; rax = resultado = 1
    
    ; Validar exponente
    cmp rsi, 0
    jl .error           ; Si es negativo, error
    je .fin             ; Si es 0, retorna 1
    
    ; Guardamos la base en rbx
    mov rbx, rdi        ; rbx = base
    
    ; rcx será nuestro contador del exponente
    mov rcx, rsi        ; rcx = exponente
    
.loop:
    ; Multiplicamos rax por la base
    imul rax, rbx       ; rax = rax * base
    
    ; Decrementamos el contador
    dec rcx              ; rcx--
    
    ; Si rcx != 0, volvemos al loop
    cmp rcx, 0
    jne .loop
    
    jmp .fin
    
.error:
    mov rax, 0          ; Error: retornamos 0
    
.fin:
    ret