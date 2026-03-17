section .text
    global procesar_arreglo_asm

procesar_arreglo_asm: 

    ; Dividimos la cantidad de elementos
    shr rcx, 2

.loop:
    cmp rcx, 0 
    jle .fin

    ; 1. Cargar 4 elementos de A y 4 de B
    movups xmm0, [rdi]
    movups xmm1, [rsi]

    ; 2. Operación VECTORIAL
    addps xmm0, xmm1

    ; 3. Guardar los 4 resultados
    movups [rdx], xmm0

    ; 4. AVANZAR LOS APUNDTADORES 16 BYTES
    add rdi, 16
    add rsi, 16
    add rdx, 16 

    ; 5. Decrecementar contador
    dec rcx
    jnz .loop

.fin:
    ret
