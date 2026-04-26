; Definicion de la macro para imprimir 
; %1 es primer parametro (apuntador), %2 es el segundo (longitud)
%macro imprimir 2
    mov rax, 1
    mov rdi, 1
    mov rsi, %1
    mov rdx, %2 
    syscall 
%endmacro

; Mcro para salir 
%macro finalizar 0
    mov rax, 60
    xor rdi, rdi
    syscall
%endmacro

section .data
    ; Mensaje a imprimir y su longitud 
    mensaje db "¡Hola mundo con macros!", 0x0a  ; 0x00a es el caracter de nuevo
    longitud equ $ - mensaje 