#include <stdio.h>

extern long suma_siete(long a, long b, long c, long d, long e, long f, long g); 
// Los primeros seis son1, el septimo es 10. Total: 16.
int main(int argc, char const *argv[]) {
    
    long resultado = suma_siete(1,1,1,1,1,1,10);
    
    printf("Resultado: %ld\n", resultado); 

    return 0;
}