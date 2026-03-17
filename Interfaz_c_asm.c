/* Interfaz C - ensamblador 
Este programa solicita a la funcion dos numeros enteros desde la entrada estandar 
e invoca a la funcion "sumar_numeros", escrita en ensamblador, que se 
encarga de sumarlos y regresar el resultado a su invocador.
*/

#include <stdio.h>

//Declaracion externa de la funcion de Ensamblador
// El compilador de C asume aque esta funcion sigue la Convencion System V AMD64 ABI
extern long sumar_numeros(long, long);
extern long restar_numeros(long, long);
extern long multiplicar_numeros(long, long);
extern long dividir_numeros(long, long);

int main () {
    long num1, num2;
    long resultado = 0;
    
    printf("Ingrese dos enteros: ");
    if (scanf("%ld%ld", &num1, &num2) != 2) {
        return 1;
    }

    resultado = sumar_numeros(num1, num2);
    printf("Suma: %ld\n", resultado);

    resultado = restar_numeros(num1, num2);
    printf("Resta: %ld\n", resultado);

    resultado = multiplicar_numeros(num1, num2);
    printf("Multiplicacion: %ld\n", resultado);

    if (num2 == 0) {
        printf("Division: Error (division entre cero)\n");
        return 1;
    }
    resultado = dividir_numeros(num1, num2);
    printf("Division: %ld\n", resultado);

    return 0;
}