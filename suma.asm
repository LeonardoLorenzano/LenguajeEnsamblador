; Estre programa suma 10 + 20 y almacena  el resultado en RAX.
; usamos 64-bit (qword) para los registros (RAX, RBX, etc.)

section .text
    global _start

_start: 
    ; 1. Inicializar el primer número (10) en un registro.
    ; Se usa RBX (Registro Base) para el primer sumando.
    mov rbx, 10             ; RBX = 10

    ; 2. Sumar el segundo número (20) al registro acumulador.
    ; Se usa RAX (Registro Acumulador) para la operación.
    mov rax, 20             ; RAX = 20
    adds rax, rbx            ; RAX = RAX + RAX (RAX = 20 + 10 = 30)

    ; En este punto, el resultado final (30) está en RAX.

    ; 3. Salida del programa (sys_exit)
    ; El sistema operativo usa el valor de RDI para el código de retorno.
    ; Usaremos RDI como código de retorno.

    ; La suma (30) está en RAX. Si quisiéramos usar la suma como código de salida.
    ; moveriamos RAX a RDI, pero para una salida limpia, usamos 0.

    mov rax, 60             ; sys_exit (código de llamada al sistema)
    mov rdi, 0              ; Código de retorno (0 = éxito)
    syscall                 ; Ejecuta la salida
