#include <stdio.h>

extern int serieFibonacci(int a); 

int main(int argc, char const *argv[]) {
    
    int n, resultado; 

    printf("Ingrese el numero: "); 
    scanf("%d", &n); 

    resultado = serieFibonacci(n); 

    printf("El numero %d en su fibonacci es: %d\n", n, resultado); 
}