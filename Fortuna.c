#include <stdio.h>

extern long sumar(long, long); 
extern long restar(long, long); 
extern long multiplicar(long, long);
extern long dividir(long, long);

int main () {

    long a, b; 
    long c = 0, d = 0, e = 0, f = 0;

    printf("Ingrese dos numeros: "); 
    scanf("%ld%ld", &a, &b);

    c = sumar(a,b); 
    printf("Suma: %ld\n", &c);

    d = multiplicar(b,c);
    printf("Multiplicar: %ld\n", &d);

    e = restar(d,a);
    printf("Resta: %ld\n", &e); 

    f = dividir(c, b); 
    printf("Division: %ld\n", &f); 
    
    return 0; 
}
