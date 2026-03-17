section .dta
    ; Mensaje a imprimir y su longitud
    mensaje db "Hola mundo!", 0x0a  ; 0x0a es el caracter de nueva linea
    longitud equ $ - mensaje 
    
section .text
    global _start  ; El enlazador (ld) busca esta etiqueta como punto de entrada 
    
_start:
    ; 1. Llamada al sistema sys_write (RAX = 1)
    mov rax, 1         ; sys_write (escribir)
    mov rdi, 1         ; Arg 1: file descriptor 1 (stdout - salida estándar)
    mov rsi, mensaje   ; Arg 2: direccion del mensaje
    mov rdx, longitud  ; Arg 3: longitud del mensaje 
    syscall            ; Ejecuta la llamada al sistema 
    
    ; 2. Llamada al sistema sys_exit (RAX = 60)
    mov rax, 60        ; sys_exit (salir)
    mov rdi, 0         ; Arg 1: Código de retorno 0 (terminación exitosa)
    syscall            ; Ejecuta la llamada al sistema
    
