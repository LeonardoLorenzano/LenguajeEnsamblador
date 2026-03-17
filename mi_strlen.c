#include <stdio.h>
#include <string.h>

extern size_t mi_strlen(char *cadena); 

int main() {
    char cadena[100];
    size_t resultado; 

    printf("Escribe una palabra: ");
    fgets(cadena, sizeof(cadena), stdin);

    cadena[strcspn(cadena, "\n")] = '\0'; 

    resultado = mi_strlen(cadena);
    
    printf("La longitud es: %zu\n", resultado);

    return 0;
}