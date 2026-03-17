#include <stdio.h>

extern long fibonacci(long n);

int main() {
    long n;
    
    printf("Ingrese la posicion de Fibonacci: ");
    scanf("%ld", &n);
    
    long resultado = fibonacci(n);
    printf("Fibonacci(%ld) = %ld\n", n, resultado);
    
    return 0;
}
