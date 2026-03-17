section .text
    global sumatoria

sumatoria: 
    ; --- 1. INICIALIZACION ---
    mov rax, 0

.bucle:
    ; --- 2. CUERPO DEL BUCLE --- 
    add rax, rdi

    ; --- 3. ACTUALIZACION ---
    dec rdi

    ; --- 4. CONDICION DE SALIDA 
    jnz .bucle
a .bucle

.fin: 
    ret 