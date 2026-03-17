; Funcion simple para verificar si un numero es par

section .text

global numero_Par

numero_Par:
    ; Dividir el numero entre 2
    mov rax, rdi            ; Copiar el numero a RAX
    mov rdx, 0              ; Limpiar RDX (parte alta de la division)
    mov rcx, 2              ; Divisor = 2
    div rcx                 ; RAX = RAX / 2, RDX = residuo
    
    ; Verificar el residuo
    cmp rdx, 0              ; ¿El residuo es 0?
    je es_par               ; Si es 0, es par
    
    ; Es impar
    mov rax, 0              ; Retornar 0 (impar)
    ret
    
es_par:
    mov rax, 1              ; Retornar 1 (par)
    ret