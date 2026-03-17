#include <stdio.h>
#include <string.h>
#include <ctype.h>

extern int es_palindromo(const char *cadena);

void limpiarCadena(char *entrada, char *salida) {
    int j = 0, i; 
    for (i = 0; entrada[i] != '\0'; i++) {
        // isalnum: verifica si es letra o número
        if (isalnum((unsigned char)entrada[i])) {
            // tolower: convierte a minuscula
            salida[j++] = tolower((unsigned char)entrada[i]); 
        }
    }
    salida[j] = '\0';
}

int main(int argc, char const *argv[]) {
    
    char cadena[100]; 
    char limpia[100];
    int resultado; 

    printf("Ingrese la palabra: "); 
    fgets(cadena, 100, stdin); 

    limpiarCadena(cadena, limpia); 

    resultado = es_palindromo(limpia); 

    if(resultado == 1) {
        printf("Es palindromo\n"); 
    } else {
        printf("No es palindromo\n"); 
    }
    return 0;
}