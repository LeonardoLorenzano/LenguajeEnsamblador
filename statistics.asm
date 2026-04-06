section .text
    global analizar_datos

analizar_datos: 
    ; --- PROLOGO --- 
    push rbp 
    mov rbp, rsp 

    ; --- INICIALIZACION --- 
    xor r8, r8                  ; R8 = Actumulador de la SUMA 
    mov r9, rdi                 ; R9 = Valor MAXIMO (inicializamos con el primer elemto). 
    xor r10, r10                ; R10 = Indice (i = 0) 

.bucle: 
    cmp r10, rsi                ; ¿i == 0?
    je .terminar                ; Si terminamos de recorrer, ir a calculos finales.

    mov r11, [rdi + r10 * 8]    ; Leer el elemnto actual: arreglo[i]

    ; 1. Sumar
    add r8, r11

    ; 2. ¿Es el nuev el maximo? (El "IF")
    cmp r11, r9 
    jle .siguiente              ; Si el actual <= max, saltar 
    mov r9, r11                 ; Si no, actualizar maximo: R9 = R11

.siguiente: 
    inc r10                     ; i++
    jmp .bucle 

.terminar: 
    ; --- GUARDAR RESULTADOS POR APUNTADOR --- 
    ; RDX tiene la direccion de 'suma' en C
    ; RCX tiene la direccion de 'maximo' en C 
    mov [rdx], r8               ; Guardar suma total en memoria de C
    mov [rcx], r9               ; Guardar maximo en memoria dE c


    ; --- CALCULAR PROMEDIO (Punto flotante) ---
    ; Promedio = Suma / n
    cvtsi2sd xmm0, r8           ; Convertir SUMA (R8) a double en XMM0
    cvtsi2sd xmm1, rsi          ; Convertir N (RSI) a double en XMM1
    divsd xmm0, xmm1            ; XMM0 = XMM0 / XMM1

    ; --- EPILOGO --- 
    pop rbp                     
    ret                         ; Reornamos XMM0 ya tiene el promedio    