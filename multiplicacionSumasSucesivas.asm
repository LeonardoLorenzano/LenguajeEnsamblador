section .text
    global multiplicacionSumasSucesivas

multiplicacionSumasSucesivas:
    xor rax, rax        ; Resultado = 0
    
    ; --- DECIDIR EL ORDEN ---
    cmp rdi, rsi        ; Comparamos A con B
    jbe .A_es_menor     ; Si A <= B, saltamos al camino A

.B_es_menor:            ; --- CAMINO B: B es el mas chico ---
    mov rcx, rsi        ; El contador sera B
    mov rdx, rdi        ; El numero a sumar sera A
    jmp .validar        ; Validamos si es cero

.A_es_menor:            ; --- CAMINO A: A es el mas chico ---
mov rcx, rdi            ; El contador sera A
mov rdx, rsi            ; El numero a sumar sera B

.validar:
    ; RCX tiene el pequeño, RDX tiene el grande
    cmp rcx, 0          ; ¿El numero pequeño es cero?
    je .final           ; Si es cero, terminamos

.loop:
    add rax, rdx        ; Sumamos el numero GRANDE al resultado
    sub rcx, 1          ; Bajamos 1 al contador
    jnz .loop           ; Si no hemos llegado a cero, repetir

.final:
    ret                 ; El resultado siempre vuelve en RAX