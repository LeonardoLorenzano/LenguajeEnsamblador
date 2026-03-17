#include <stdio.h>

extern double calcular_total(int cantidad, double precio_unitario);

int main() {

    int cantidad;
    double precio_unitario;

    printf("Ingresa la cantidad (entero): "); 
    scanf("%d", &cantidad); 

    printf("Ingresa el precio unitario (double): "); 
    scanf("%lf", &precio_unitario);

    double total = calcular_total(cantidad, precio_unitario);

    printf("El total con IVA es: %f\n", total);

    return 0;
}