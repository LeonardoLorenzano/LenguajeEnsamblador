section .text
    global es_palindromo

es_palindromo:
    ; RDI contiene el puntero a la cadena (inicio)
    mov rsi, rdi          ; RSI será nuestro puntero de inicio
    mov rax, rdi          ; RAX lo usaremos para buscar el final

.busca_final: 
    cmp byte [rax], 0     ; ¿Es el fin de cadena?
    je .prepara_punteros  ; Si es 0, ya encontramos el final
    inc rax               ; Avanzamos RAX
    jmp .busca_final

.prepara_punteros: 
    dec rax               ; Retrocedemos uno para no apuntar al '\0'
    ; Ahora: RSI apunta al inicio, RAX apunta al último carácter real

.comparacion: 
    cmp rsi, rax          ; ¿Se cruzaron o son el mismo puntero?
    jge .es_palindromo_si ; Si se cruzaron, terminamos con éxito

    mov cl, [rsi]         ; Carga carácter de la izquierda
    mov dl, [rax]         ; Carga carácter de la derecha

    cmp cl, dl            ; ¿Son diferentes?
    jne .no_es_palindromo ; Si son distintos, no es palíndromo

    inc rsi               ; Movemos inicio hacia la derecha
    dec rax               ; Movemos final hacia la izquierda
    jmp .comparacion 

.no_es_palindromo: 
    mov rax, 0            ; Retorna 0 (falso)
    ret 

.es_palindromo_si:
    mov rax, 1            ; Retorna 1 (verdadero)
    ret