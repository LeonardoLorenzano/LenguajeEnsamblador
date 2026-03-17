#include <stdio.h>

extern int numero_Par(int numero);

int main(void) {

    int numero;

    printf("Ingrese el numero: ");
    scanf("%d", &numero);

    if (numero_Par(numero)) {
        printf("El numero es par\n");
    } else {
        printf("El numero es impar\n");

    }
    return 0;
}