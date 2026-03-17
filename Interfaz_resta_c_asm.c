/* Interfaz C - ensamblador 
Este programa solicita a la funcion dos numeros enteros desde la entrada estandar 
e invoca a la funcion "sumar_numeros", escrita en ensamblador, que se 
encarga de sumarlos y regresar el resultado a su invocador.
*/

#include <stdio.h>

//Declaracion externa de la funcion de Ensamblador
// El compilador de C asume aque esta funcion sigue la Convencion System V AMD64 ABI
extern long restar_numeros(long, long); 

int main () {
    long num1, num2;
    long resultado; 

    //1. Leer datos en C (Interfaz amigable)
    printf("\n");
    scanf("%ld%ld", &num1, &num2);

    resultado = restar_numeros(num1, num2);

    printf("%ld\n", resultado); 

    return 0; 

}