#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <assert.h>

#define SIZE 9000000

// ¿Es necesario explicar? 
void llena_arreglo(long *, long ); 

// Declaracion de la funcion externa 
extern double analizar_datos(long *arreglo, long n, long *suma, long *maximo); 

int main(int argc, char const *argv[]) {
    
    long n = SIZE; 
    long *mis_datos; 
    long suma_total = 0; 
    long valor_maximo = 0;
    double promedio = 0.0; 
    
    mis_datos = (long *) malloc(n * sizeof(long)); 

    if (!mis_datos) {
        exit(EXIT_FAILURE); 
    }

    llena_arreglo(mis_datos, n);
    printf("--- Analizador de Arreglos (C + ASM) ---\n"); 

    // Llamada a ensamblador
    // Pasamos las direcciones de suma_total y valor_maximo con '&'
    promedio = analizar_datos(mis_datos, n, &suma_total, &valor_maximo); 

    // Mostrar ressultados 
    printf("Elementos procesados: %ld\n", n); 
    printf("Suma total:           %ld\n", suma_total); 
    printf("Valor maximo:         %ld\n", valor_maximo); 
    printf("Promedio:             %.2f\n", promedio); 

    return 0;
}

void llena_arreglo(long *arreglo, long n) {
    unsigned long i; 

    srand(time(NULL)); 
    
    for (i = 0; i < n; ++i) {
        arreglo[i] = rand(); 
    }
}