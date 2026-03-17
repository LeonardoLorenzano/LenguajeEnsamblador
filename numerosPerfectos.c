#include <stdio.h>

extern long numerosPerfectos(long a); 

int main () {

    long num1, resultado; 

    printf("Ingrese el numero: "); 
    scanf("%ld", &num1);

    long resultado = numerosPerfectos(num1); 

    printf("El numero %ld es un numero perfecto"); 
}