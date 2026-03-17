#include <stdio.h>

extern long multiplicacionSumasSucesivas(long a, long b); 

int main () {
    long num1, num2;
    
    printf("Ingrese el primer numero: ");
    scanf("%ld", &num1);

    printf("Ingrese el segundo numero: ");
    scanf("%ld", &num2);

    long resultado = multiplicacionSumasSucesivas(num1, num2);
    
    printf("La multiplicacion de %ld x %ld es: %ld\n", num1, num2, resultado);

    return 0; 
}