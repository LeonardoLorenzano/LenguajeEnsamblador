; Estre programa hace 10 - 20 y almacena  el resultado en RAX.
; usamos 64-bit (qword) para los registros (RAX, RBX, etc.)

section .text
    global _start

_start: 
    ; 1. Inicializar el segundo número (20) en un registro.
    ; Se usa RBX (Registro Base) para el valor a restar.
    mov rbx, 20             ; RBX = 20

    ; 2. Restar el segundo número (20) del primer número (10).
    ; Se usa RAX (Registro Acumulador) para la operación.
    mov rax, 10             ; RAX = 10
    sub rax, rbx            ; RAX = RAX - RBX (RAX = 10 - 20 = -10)

    ; En este punto, el resultado final (-10) está en RAX.

    ; 3. Salida del programa (sys_exit)
    ; El sistema operativo usa el valor de RDI para el código de retorno.
    ; Usaremos RDI como código de retorno.

    ; La resta (-10) está en RAX. Si quisiéramos usar el resultado como código de salida,
    ; moveríamos RAX a RDI, pero para una salida limpia, usamos 0.

    mov rax, 60             ; sys_exit (código de llamada al sistema)
    mov rdi, 0              ; Código de retorno (0 = éxito)
    syscall                 ; Ejecuta la salida