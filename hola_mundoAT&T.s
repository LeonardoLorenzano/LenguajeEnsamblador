.section .data
    msg:
        .asciz "Hola mundo!\n"  # Define la cadena ASCII terminada en nulo
len = 12                        # Longitud de la cadena
   
.section .text
.global _start
    
_start:
    # 1. llamada al sistema sys_write (RAX = 1)
    movq $1, %rax           # sys_write (1)
    movq $1, %rdi           # Arg 1: file descriptor 1 (stdout)
    movq $msg, %rsi         # Arg 2: direccion del mensaje (label)
    movq $len, %rdx         # Arg 3: longitud del mensaje
    syscall                 # Ejecuta la llamada al sistema
    
    # 2. Llamada al sistema sys_exit (RAX = 60)
    
    movq $60, %rax          # sys_exit (60)
    movq $0, %rdi           # Arg 1: Codigo de retorno 0
    syscall              