#include <stdio.h>

extern long factorialRecursivo(long n); 

int main(int argc, char const *argv[]) {
    
    int numero; 
    long resultado; 

    printf("Ingrese un numero: "); 
    scanf("%d", &numero); 

    resultado = factorialRecursivo(numero);
    
    printf("El numero %d en su factorial es: %ld", numero, resultado); 

    return 0;
}