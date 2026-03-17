#include <stdio.h>
#include <stdlib.h>

extern long procesar_arreglo_simd(float *a, float *b, float *res, long n); 

int main(int argc, char const *argv[]) {
    
    int n; 

    float *a = (float *) malloc(n * sizeof(float));
    float *b = (float *) malloc(n * sizeof(float)); 
    float *r = (float *) malloc(n * sizeof(float)); 

    if(a == NULL || b == NULL || r == NULL) {
        perror("No hubo memoria disponible"); 
        exit(1); 
    }

    for(int i; i<n; ++i) {
        a[i] = 1.0f;
        b[i] = 1.0f; 
    }

    procesar_arreglo_simd(a, b, r, n); 

    printf("Resultado [   0]: %1f\n", r[0]);
    printf("Resultado [4999]: %1f\n", r[4999]);
    printf("Resultado [9999]: %1f\n", r[9999]);

    free(r);
    free(b);
    free(a);
    
    return 0;
}
