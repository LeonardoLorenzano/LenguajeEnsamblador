section .text 
    global sumar_vectores

sumar_vectores:
    ; *** Convencion ***

    ; 1. Cargar 4 floats del arreglo
    movups xmm0[rdi]             

    ; 2. Cargar 4 floats del arreglo 8 
    movups xmm1, [rsi]

    ; 3. SUMA VECTORIAL: Una sola instrccion para los catro elementos
    addps xmm0, xmm1  

    ; 4. Guardar el resultado de vuelta en memoria ¿
    movups [rdx], xmm0

    ret