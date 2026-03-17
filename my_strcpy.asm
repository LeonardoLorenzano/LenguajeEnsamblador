section .text
    global mi_strcpy

mi_strcpy: 
    ; RDI = Destino (donde copiar)
    ; RSI = Origen (de dode leer)
    mov al, 0

.bucle: 
    movsb                           ; Copia byte de [RSI] a [RDI] y avanza ambos

    ; ¿Acabamos de copiar el caracter nulo? 
    ; Miramos el byte que acaba de quedar en el destino [RDI-1]
    ; cmp byte [rdi-1], 0
    cmp [rdi-1], al
    jne .bucle                      ; Si no es cero, seguimos copiando

    ret