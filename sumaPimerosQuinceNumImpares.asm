section .text
    global suma_Quince_N_Impares

suma_Quince_N_Impares: 
    num dq 15
    sum dq 0

    mov rcx, num
    mov rax, 1

sum_loop: 
    add rcx, rax
    add rax, 2
    dec rcx 
    cmp rcx, 0 
    jne sum_loop