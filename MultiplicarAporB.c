#include <stdio.h>

extern long MultiplicarPorB(long a, long b); 

int main(int argc, char const *argv[]) {

    int num1, num2; 

    printf("Ingrese el primer numero: "); 
    scanf("%ld", &num1); 

    printf("Ingrese el segundo numero: "); 
    scanf("%ld", &num2); 

    return 0;
}