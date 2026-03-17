section .data
    ; Mensajes y cálculo de longitudes
    mensaje1 db "Leonardo", 0x0a
    longitud1 equ $ - mensaje1

    mensaje2 db "Emanuel", 0x0a
    longitud2 equ $ - mensaje2
    
    mensaje3 db "Lorenzano", 0x0a
    longitud3 equ $ - mensaje3
    
    mensaje4 db "Sánchez", 0x0a
    longitud4 equ $ - mensaje4

section .text
    global _start

_start:
    ; 1. Imprimir "Leonardo"
    mov rax, 1
    mov rdi, 1
    mov rsi, mensaje1
    mov rdx, longitud1
    syscall

    ; 2. Imprimir "Emanuel"
    mov rax, 1
    mov rdi, 1
    mov rsi, mensaje2
    mov rdx, longitud2
    syscall

    ; 3. Imprimir "Lorenzano"
    mov rax, 1
    mov rdi, 1
    mov rsi, mensaje3
    mov rdx, longitud3
    syscall

    ; 4. Imprimir "Sánchez"
    mov rax, 1
    mov rdi, 1
    mov rsi, mensaje4
    mov rdx, longitud4
    syscall

    ; 5. Finalizar programa
    mov rax, 60
    mov rdi, 0
    syscall