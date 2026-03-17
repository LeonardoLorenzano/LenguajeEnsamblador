; Función Fibonacci: calcula el n-ésimo número de Fibonacci
; Parámetro:
;   rdi = n (posicion)
; Retorna:
;   rax = F(n)

section .text
global fibonacci

fibonacci:
    ; rdi = n
    
    ; Si n = 0, retornamos 0
    cmp rdi, 0
    je .retorna_cero
    
    ; Si n = 1, retornamos 1
    cmp rdi, 1
    je .retorna_uno
    
    ; Para n >= 2, calculamos iterativamente
    ; rax = F(n-2) = 0
    xor rax, rax        ; rax = 0
    
    ; rbx = F(n-1) = 1
    mov rbx, 1          ; rbx = 1
    
    ; rcx = contador (empezamos desde 2)
    mov rcx, 2          ; rcx = 2
    
.loop:
    ; Calculamos F(n) = F(n-1) + F(n-2)
    ; rdx = rax + rbx
    mov rdx, rax        ; rdx = F(n-2)
    add rdx, rbx        ; rdx = F(n-2) + F(n-1) = F(n)
    
    ; Desplazamos para siguiente iteración
    ; F(n-2) = F(n-1)
    mov rax, rbx        ; rax = F(n-1)
    
    ; F(n-1) = F(n)
    mov rbx, rdx        ; rbx = F(n)
    
    ; Incrementamos contador
    inc rcx              ; rcx++
    
    ; Si rcx <= rdi, continuamos
    cmp rcx, rdi
    jle .loop
    
    ; El resultado está en rbx
    mov rax, rbx        ; rax = F(n)
    ret
    
.retorna_cero:
    xor rax, rax        ; rax = 0
    ret
    
.retorna_uno:
    mov rax, 1          ; rax = 1
    ret
