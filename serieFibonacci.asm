section .text
    global serieFibonacci

serieFibonacci: 
    ; --- CASO BASE --- 
    cmp rdi, 1                ; ¿Es n <= 1?
    jle .base                 ; Si es asi, saltamos a devolver n

    ; --- PROLOGO (Guardamos lo que necesitamos despues) 
    push rbp                  ; Guardamos apuntador de base 
    mov rbp, rsp 
    push rbx                  ; Guardamos RBX (es un "preserved register")
    push rdi                  ; Guardamos el valor actual de 'n'

    ; --- LLAMADA 1: fib(n-1) --- 
    dec rdi                   ; RDI = n - 1
    call serieFibonacci       ; Llamada recursiva 
    mov rbx, rax              ; Guardamos el resultado de fib(n-1) en RBX

    ; --- LLAMADA 2: fib(n-2)
    ; Recuperamos el 'n' original que guardamos en la pila 
    pop rdi                   ; Recuperamos el 'n' original
    push rdi                  ; Volvemos a guardarlo (para mantener la pila equilibrada)

    sub rdi, 2                ; RDI = n - 2
    call serieFibonacci       ; Llamada recursiva 

    ; --- SUMA FINAL --- 
    add rax, rbx              ; RAX = fib(n-2) + fib(n-1)

    ; --- EPILOGO ---
    pop rdi                   ; Limpiamos la pila 
    pop rbx                   ; Restauramos el RBX oiginal
    pop rbp                   ; Restauramos el RBP 
    ret 

.base: 
    mov rax, rdi              ; Si no es 0 o 1,el resultado es el mismo n
    ret          