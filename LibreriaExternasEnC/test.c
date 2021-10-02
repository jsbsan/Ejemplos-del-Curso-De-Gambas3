#include "test.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/*
 http://www.esdebian.org/foro/19755/regresar-cadena-funcion
$ $ gcc -Wl,-soname=test.so -o test.so -std=c99 -fpic -shared -shared-libgcc test.c

como root:
#  cp test.so /usr/lib/test.so
# ldconfig /usr/lib

*/

double sumar(double a, double b){
	double valor;
	valor=a+b;
	return valor;
}


void duplica(int dimension, double *Datos, double *Solucion){
	
	for ( int i=0 ; i<dimension ; i++ ) 
		{ 
			Solucion[i]=Datos[i]*2;
		} 
	
}


double ValorarTablero(double *Tablero,int ancho){
	double valor=0;
	 for(long i=0;i<ancho;i++)
    {
        long c1=i*ancho;
        for(long j=0;j<ancho;j++){
            valor += Tablero[j+c1];
		}
    }
	return valor;
	
}
	
