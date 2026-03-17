section .text
global factorial

factorial:
    test rdi, rdi
    js .negativo               

    mov rax, 1
    mov rcx, rdi

.loop:
    cmp rcx, 1
    jle .fin
    imul rax, rcx
    dec rcx
    jmp .loop

.fin:
    ret

.negativo:                     
    mov rax, -1                