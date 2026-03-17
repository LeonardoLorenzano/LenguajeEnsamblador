section .data
    ; Mensaje a imprimir y su longitud
    mensaje db "Leonardo Emanuel Lorenzano Sánchez", 0x0a  ;0x0a es el caracter de una nueva linea 
    longitud equ $ - mensaje
   
   
section .text
    global _start  ; el enlasador (id) busca esta eqtiqueta como punto de entrada
    
_start:
    ; 1. llamada al sistema sys_write (RAX = 1)
    mov rax, 1         ; sys_write (escribir)
    mov rdi, 1           ; Arg 1: file description 1 (stdout - salida standar)
    mov rsi, mensaje     ;arg 2: direccion del mensaje
    mov rdx, longitud
    syscall              ; Ejecuta la llamada al sistema
    
    ; 2. llamada al sistema sys_exit (RAX = 60)
    
    mov rax, 60
    mov rdi, 0
    syscall               ;ejecuta la llamada
