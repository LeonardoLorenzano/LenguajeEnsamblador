#include <stdio.h>

extern long suma_Quince_N_Impares(long n); 

int main(int argc, char const *argv[]) {
    
    int num = 15;

    scanf("%d", &num); 

    long resultado = suma_Quince_N_Impares(num);

    printf("La suma de los primeros 15 impares es: %ld\n", resultado);

    return 0;
}