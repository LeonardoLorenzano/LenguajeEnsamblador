section .data
    ; Definimos la constante PI como un qiad_word (64 bits para double)
    pi dq 3.141592653589793

section .text
    global calcular_area

calcular_area: 
    ; *** CONVENCION: El radio (double) llega en XMM0 ***

    ; 1. Calculamos radio * radio (r²)
    ; Multiplicamos XMM0 por si mismo 
    mulsd xmm0, xmm0            ; XMM0 = radio * radio

    ; 2. Cargamos Pi en otro registro XMM0
    ; Usamos movsd para mover desde la memoria a un registro
    movsd xmm1, [rel pi]        ; XMM1 = 3.1415...

    ; 3. Multiplicamos el resultado anterior por PI
    mulsd xmm0, xmm1            ; XMM0 = (radio²) * PI

    ; *** CONVECION: El resultado se devuelve en XMM0 ***
    ret