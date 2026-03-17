#include <stdio.h>

extern long formula_general(long a, long b, long c); 

int main(int argc, char const *argv[]) {

    long a, b, c;

    printf("Ingrese el valor de a: ");
    scanf("%ld", &a);

    printf("Ingrese el valor de b: ");
    scanf("%ld", &b);

    printf("Ingrese el valor de c: ");
    scanf("%ld", &c);

    long result = formula_general(a, b, c);

    printf("El resultado de la fórmula general es: %ld\n", result);

    return 0;
}