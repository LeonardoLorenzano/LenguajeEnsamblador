#include <stdio.h>

extern long factorial(long n);

int main() {
    int numero;
    long resultado;

    printf("Ingrese un numero: ");
    scanf("%d", &numero);

    resultado = factorial(numero);
    printf("El factorial de %d es: %ld\n", numero, resultado);

    return 0;
}