; Paltilla Ensanblador  NASM (Sintaxis Intel)

section .data
    ; [DEFINICIÓN DE DATOS INICIALIZADOS AQUÍ]
    msg db "Mi primer programa.", 0xA
    len equ $ - msg

section .bss
    ; [RESERVA DE ESPACIO DE MEMORIA AQUÍ]
    ; buffer resb 1024

section .text
    global _start

_start: 
    ; *** LÓGICA DEL PROGRAMA AQUÍ ***

    ; [Llamada al sistema sys_write, etc.] 

    ; *** LLAMADA OBLIGATORIA DE SALIDA ***
    mov rax, 60     ; sys_exit
    mov rdi, 0      ; Código de retorno 0
    syscall
