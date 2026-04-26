section .text
    global analizar_datos

analizar_datos:
    ; RDI = Arreglo, RSI = N, RDX = &suma, RCX = &maximo

    ; --- 1. INICIALIZACION --- 
    pxor xmm0, xmm0             ; XMM0 = [0, 0] (Acumulador de suma) 

    ; Inicializamos XMM1 (maximo) con lo dos primeros elementos
    movdqu xmm1, [rdi]          ;  XMM1 = [arr[1], arr[0]]

    mov r8, rsi                 ; Copiamos N para el contador
    mov r9, rdi                 ; Copiamos el apuntador del areglo

.bucle_simd: 
    cmp r8, 2                   
    jl .limpieza                ; Si quedan menos de dos elementos, ir a limpieza

    movdqu xmm2, [r9]           ; Cargar 2 longs: [arr[i+1], arr[i]]

    ; Suma vectorial: XMM0 = [sum_high + arr[i+1], sum_low + arr[i]]
    paddq xmm0, xmm2

    ; Maximo vectorial: XMM1 = [max(mas_h, arr[i+1]), max(max_l, arr[i])]
    pmaxsq xmm1, xmm2           ; Requiere (SSE 4.1)

    add r9, 16                  ; Avanzar 16 bytes(2 longs * 8 bytes)
    sub r8, 2                   ; Restar 2 al contador
    jmp .bucle_simd             

.limpieza: 
    ; Extraer resultados parciales de los registros SIMD
    ; Suma: sumar las dos mitades de XMM0
    pextrq r10, xmm0, 0         ; R10 = sum_low
    pextrq r11, xmm0, 1         ; R11 = suma_high
    add r10, r11                ; R10 = Suma total parcial

    ; Maximo: Comparar las dos mitades de XMM1
    pextrq r12, xmm1, 0         ; R12 = max_low
    pextrq r13, xmm1, 1         ; R13 = max_high
    cmp r13, r12
    cmovg r12, r13              ; R12 = max(max_low, max_high)

    ; Procesar el elemento sobrante si N era impar
    cmp r8, 1 
    jne .final  
    mov r11, [r9]               ; Caragar el ultimo elemento
    add r10, r11                ; Sumarlo
    cmp r11, r12                
    cmovg r12, r11              ; Actualizar maximo si es necesario 

.final:
    ; --- GUARDAR RESULTADOS --- 
    mov [rdx], r10              ; Guardar suma
    mov [rcx], r12              ; Guarfar maximo

    ; --- PROMEDIO --- 
    cvtsi2sd xmm0, r10          ; Convertir suma a double
    cvtsi2sd xmm1, rsi          ; Convertir N a double
    divsd xmm0, xmm1            ; Promedio en XMM0

    ret  