sction .text
    global suma_siete

suma_siete:
    xorrax, rax
    mov rax, rdi          ; rdi, rsi, rdx, r8, r9 ya tienen los primeros seis '1'
    add rax, rsi
    add rax, rdx
    add rax, rcx
    add rax, r8
    add rax, r9           ; RAX ahora vale 6

    ; El septimo parametro (10) esta en la pila.
    ; Como no hemos movido RSP ni RBP, esta rn [rsp + 8]
    
    add rax, [rsp + 8]    ; RAX = 6 + 10 = 16
    ret