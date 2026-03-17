#include <stdio.h>

extern int productos_posibles(double dinero, double coste);

int main() {

    double dinero, coste;

    printf("Ingresa el dinero disponible (double): ");
    scanf("%lf", &dinero);

    printf("Ingresa el costo unitario (double): ");
    scanf("%lf", &coste);

    int cantidad = productos_posibles(dinero, coste);
    printf("Cantidad de productos posible: %d\n", cantidad);

    return 0;
}
