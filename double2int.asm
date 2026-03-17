section .text
    global productos_posibles

productos_posibles: 
    ; *** CONVENCION: *** 
    ; XMM0 <- dinero
    ; XMM1 <- coste

    ; 1. Dividir dinero / costo
    divsd xmm0, xmm1               ; XMM0 = dinero / coste (resultado decimal)

    ; 2. Convertir el resultado a entero (truncando decimales)
    cvttsd2si rax, xmm0            ; RAX = (int)resultado

    ; El resultado entero se devuelve en RAX
    ret