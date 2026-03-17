#include <stdio.h>

extern long suma_pares(long n);

int main() {
    long numero;

    printf("Ingrese el numero: ");
    scanf("%ld", &numero);

    long resultado = suma_pares(numero);
    printf("La suma de los pares entre 1 y %ld es: %ld\n", numero, resultado);

    return 0;
}
