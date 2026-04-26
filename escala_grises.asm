section .data
    ; Coeficientes para escala de grises (red, green. blue, alpha)
    ; El alpha lo dejamos en 0.0 porque no afecta al gris
    coefs dd 0.299, 0.578, 0.114, 0.0

section .text
    global aplicar_grises

aplicar_grises: 
    ; RDI = Apuntador a la imagen (char *pixeles)
    ; RSI = Numero de pixeles (long total_pixeles)

    ; Cargamos los coeficientes en un registro XMM
    movups xmm1, [rel coefs]

.bucle:
    cmp rsi, 0
    je .fin

    ; 1. Extraer los 4 bytes del pixel actual (R, G, B, A)
    ; Necesitamos convertirlos a float para multiplicar
    movzx eax, byte [rdi]               ; EAX = R
    movzx ebx, byte [rdi + 1]           ; EBX = G
    movzx ecx, byte [rdi + 2]           ; ECX = B

    ; 2. Convertir a float y poner en un registro XMM temporal
    cvtsi2ss xmm2, eax                  ; xmm2[0] = R
    cvtsi2ss xmm3, ebx                  ; xmm3[0] = G
    cvtsi2ss xmm4, ecx                  ; xmm4[0] = B

    ; 3. Aplicar pesos (Multiplicar cada uno por su coeficiente)
    mulss xmm2, [rel coefs]             ; R * 0.299
    mulss xmm3, [rel coefs + 4]         ; R * 0.587
    mulss xmm4, [rel coefs + 8]         ; R * 0.114

    ; 4. Sumar los resultados: Gris: R' + G' + B'
    addss xmm2, xmm3                    
    addss xmm2, xmm4                    ; xmm2 tiene el valor de gris al final (float)

    ; 5. Convertir de vuelta a entero (0.255)
    cvttss2si eax, xmm2                 ; Truncar float a int 

    ; 6. Escribir el mismo valor en R, G y B para que se vea gris
    mov [rdi], al                       ; R = Gris
    mov [rdi + 1], al                   ; G = Gris
    mov [rdi + 2], al                   ; B = Gris
    ; Alpha (rdi + 3) se qued igual

    ; 7. Avanzar al siguiente pixel (4 bytes)
    add rdi, 4
    dec rsi
    jmp .bucle

.fin:
    ret 