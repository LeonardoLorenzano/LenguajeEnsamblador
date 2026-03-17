section .text
    global promedio

promedio:
    mov rax, rdi
    cmp rax, 0
    jle .cero

    inc rax                 ; rax = n + 1
    xor rdx, rdx
    mov rcx, 2
    div rcx                 ; rax = (n + 1) / 2
    ret

.cero:
    xor rax, rax
    ret