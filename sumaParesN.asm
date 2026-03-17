suma_pares:
    mov rax, rdi
    cmp rax, 0
    jle .cero

    xor rdx, rdx            ; Limpiamos RDX
    mov rcx, 2              ; Usamos RCX temporalmente como divisor
    div rcx                 ; RAX = RAX / 2  (El cociente queda en RAX)

    mov rcx, rax            ; rcx = k
    inc rcx                 ; rcx = k + 1
    imul rax, rcx           ; rax = k * (k + 1)
    ret

.cero:
    xor rax, rax
    ret