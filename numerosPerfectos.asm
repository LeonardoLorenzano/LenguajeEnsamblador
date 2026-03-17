section .text
    global numerosPerfectos

numerosPerfectos: 
    cmp rdi, 0                    ; ¿ n <= 0 ? 
    jle .cero

    xor rax, rax                  ; RAX es igual a la suma acumulada
    


.cero: 
    xor rax, rax
    ret