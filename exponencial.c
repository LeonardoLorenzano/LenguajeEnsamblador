#include <stdio.h>

extern long exponencial(long base, long exponente);

int main() {
    long base, exponente;
    
    printf("Ingrese la base: ");
    scanf("%ld", &base);
    
    printf("Ingrese el exponente: ");
    scanf("%ld", &exponente);
    
    long resultado = exponencial(base, exponente);
    printf("%ld elevado a %ld = %ld\n", base, exponente, resultado);
    
    return 0;
}
