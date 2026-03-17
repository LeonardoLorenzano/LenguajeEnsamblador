; fortuna.asume

section .text
    ; La funcion debe ser global para que el enlazador de C la encuentre
    global sumar_numeros
    global restar_numeros
    global multiplicar_numeros
    global dividir_numeros

; *** CONVENCION DE ENTRADA (System V AMD64) ***
; RDI = a
; RSI = b
; *** CONVENCION DE SALIDA ***
; RAX = c

sumar:
    mov rax, rdi         ; RAX = c
    add rax, rsi         ; RAX = a + b
    ret

restar_numeros:
    mov rax, rdi         ; RAX = 
    sub rax, rsi         ; RAX = num1 - num2
    ret

multiplicar_numeros:
    mov rax, rdi         ; RAX = num1
    imul rax, rsi        ; RAX = num1 * num2
    ret

dividir_numeros:
    mov rax, rdi         ; RAX = num1
    cqo                  ; Extiende el signo de RAX a RDX:RAX
    idiv rsi             ; RAX = num1 / num2 (cociente)
    ret