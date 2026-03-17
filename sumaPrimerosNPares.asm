section .text
global suma_primeros_pares

suma_primeros_pares:
    cmp rdi, 0              ; ¿n <= 0?
    jle .cero
    
    xor rax, rax            ; rax = suma acumulada (usamos rax directo)
    mov r9, 2               ; Empezamos directamente en el primer par (2)

.loop:
    cmp r9, rdi             ; ¿El numero actual es mayor que n?
    jg .fin                 ; Si r9 > n, terminamos
    
    add rax, r9             ; Sumamos el numero par
    add r9, 2               ; Saltamos al siguiente par
    jmp .loop

.fin:
    ret                     ; El resultado ya esta en rax

.cero:
    xor rax, rax
    ret