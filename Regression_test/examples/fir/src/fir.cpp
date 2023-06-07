#include "fir.h"
//------------------------------------------------------------------------
// fir
//------------------------------------------------------------------------

//SEPARATOR_FOR_MAIN

#include <stdlib.h>

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

#define AMOUNT_OF_TEST 100

/*int fir (in_int_t arg_1, in_int_t A[N]) {

	int i;
 	int d;
	int s= 1;//0.0;

	for (i=0; i<10; i++){
        //#pragma HLS PIPELINE
        d = A[i] + arg_1;
	      if (d >= 0)
	      	// An if condition in the loop causes irregular computation.
	      	// Static scheduler reserves time slot for each iteration
	      	// causing unnecessary pipeline stalls.
	        s *= (((((d+1)*d+1)*d+1)*d+1)*d+1)*d+1;//(((((d+(float)0.64)*d+(float)0.7)*d+(float)0.21)*d+(float)0.33)*d+(float)0.25)*d+(float)0.125;
    }
return s;

}

int main(void){
	in_int_t A[N];
    
	for(int i = 0; i < N; i++) {
		A[i] = i;
	} 
	
	for(int i = 0; i < AMOUNT_OF_TEST; i++)
		fir(i, A);
}*/

int fir(in_int_t arg_1) {


	int fact = 1;
	do{
		fact *= arg_1;
		arg_1--;
	} while ( arg_1 > 0 );

	return fact;

}

int main() {

    for(int i = 10; i < AMOUNT_OF_TEST+10; ++i){	
   	 	fir(i);
    }
}



