#include <stdio.h>
#include <string.h>

extern size_t cadenaAlReves(char *cadena);

int main() {
    char cadena[100];
    size_t resultado;

    printf("Escribe una palabra: ");
    fgets(cadena, sizeof(cadena), stdin);

    cadena[strcspn(cadena, "\n")] = '\0'; 

    resultado = cadenaAlReves(cadena);
    
    printf("La palabra al reves es: %s\n", cadena);

    return 0;
}