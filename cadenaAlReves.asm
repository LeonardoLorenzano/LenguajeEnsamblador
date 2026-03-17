section .text
    global cadenaAlReves

cadenaAlReves:
    ; Entrada: RDI = dirección de la cadena (char *cadena)
    
    push rbx                ; Preservar RBX (convención de llamada)
    mov rsi, rdi            ; RSI será nuestro puntero "derecho" (final)

buscar_final:
    cmp byte [rsi], 0       ; ¿Es el fin de la cadena?
    je preparar_punteros    ; Si sí, vamos a invertir
    inc rsi                 ; Si no, siguiente carácter
    jmp buscar_final

preparar_punteros:
    dec rsi                 ; Retroceder una posición (para no apuntar al '\0')
    ; RDI apunta al inicio, RSI apunta al último carácter

invertir:
    cmp rdi, rsi            ; Si los punteros se cruzan o son iguales, terminamos
    jae fin
    
    ; Intercambio usando un registro temporal (AL)
    mov al, [rdi]           ; AL = carácter inicio
    mov bl, [rsi]           ; BL = carácter final
    mov [rdi], bl           ; Guardar final en el inicio
    mov [rsi], al           ; Guardar inicio en el final
    
    inc rdi                 ; Mover inicio a la derecha
    dec rsi                 ; Mover final a la izquierda
    jmp invertir

fin:
    pop rbx                 ; Restaurar RBX
    ret                     ; Volver a C