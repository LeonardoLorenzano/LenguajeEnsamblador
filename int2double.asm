section .data
    iva dq 1.16

section .text
    global calcular_total

calcular_total: 
    ; ** CONVENCION ***
    ; RDI <- cantidad (int)
    ; XMM0 <- precio_unitario (double)

    ; 1. Convertir la cantidad (entero) a double
    ; Usamos XMM1 como registro temporal
    cvtsi2sd xmm1, rdi                   ; XMM1 = (double)cantidad

    ; 2. Multiplicar cantidad * precio_unitario
    mulsd xmm0, xmm1                     ; XMM0 = precio * cantidad

    ; 3. Aplicar el IVA (1.16)
    movsd xmm1, [rel iva]                ; Carguemos 1.16 en XMM1
    mulsd xmm0, xmm1                     ; XMM0 = total * 1.16

    ; El resultado final se devuelve en XMM0
    ret