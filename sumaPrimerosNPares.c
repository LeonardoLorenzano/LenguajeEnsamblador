#include <stdio.h>

extern long suma_primeros_pares(long n);

int main() {
    long numero;

    printf("Ingrese el numero: ");
    scanf("%ld", &numero);

    long resultado = suma_primeros_pares(numero);
    printf("La suma de los primeros %ld pares es: %ld\n", numero, resultado);

    return 0;
}