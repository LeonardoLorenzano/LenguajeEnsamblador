#include <stdio.h>

extern long sumar_vectores(float *a, float *b, float *res);

int main() {

    long vecA[] = {1.1f, 2.2f, 3.3f, 4.4f};
    long vecB[] = {0.0f, 20.0f, 30.0f, 40.0f};
    long resultado[4];

    sumar_vectores(vecA, vecB, resultado);

    printf("Resultado SIMD: [%.1ld, %.1ld, %.1ld, %.1ld]\n",
        resultado[0], resultado[1], resultado[2], resultado[3]); 

    return 0;
}