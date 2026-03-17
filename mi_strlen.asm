section .text
    global mi_strlen

mi_strlen: 
    ; RDI contiene el apuntador a la cadena (desde C)

    mov rsi, rdi               ; Guardamos la direccion inicial
    mov al, 0                  ; Buscamos el caracter nulo (0)
    mov rcx, -1                ; Ponemos el contador al maximo valor posible

    cld                        ; Clear Direction Flag; procesar izquierda

    ; RPNZ SCASB: Repetir mientras el byte en [RDI] != AL
    ; En cada paso: compara [RDI] con AL, incrementa RDI y decrementa
    repnz scasb
    
    ; Al terminar, RDI apunta al byte DESPUES del cero
    ; La longitud es: (Posicion final - 1) - Posicion incial
    sub rdi, rsi
    mov rax, rdi               ; RAX = rdi - rbx 
    dec rax                    ; Restamos 1 para no contar el caracter nulo

    ret