#include <stdio.h>

extern long promedio(long numero);

int main () {

    long numero;
    printf("Ingrese el numero: ");
    scanf("%ld", &numero);

    long resultado = promedio(numero);
    printf("El promedio del numero ingresado es: %ld\n", resultado);

    return 0;
}