section .text
    global MultiplicarPorB

MultiplicarPorB: 
    ; RDI = Tiene el primer elemento 
    ; RSI = Tiemne el segundo elemento

    xor rax, rax 
    
    mov rax, rdi
    imul rdi