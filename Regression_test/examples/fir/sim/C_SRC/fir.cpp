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

#define AMOUNT_OF_TEST 1

/*int fir (in_int_t arg_1, in_int_t A[N]) {

	int acc = 1;
	for(int i = 0; i < N-1; i++)
	{
		for(int j = 0; j < N-1; j++)
		{
			arg_1 += A[i+1];
			arg_1 *= A[j+1];
		}
	}

	return arg_1;

}

int main(void){
	in_int_t A[N];
    
	for(int i = 0; i < N; i++) {
		A[i] = i;
	} 
	
	for(int i = 0; i  < AMOUNT_OF_TEST; i++)
		fir(i, A);
}*/

int fir(in_int_t arg_1) {

	int acc = 5;
	for(int i = 0; i < 3; i++) {
		//for(int j = 0; j < 3; j++)
		//{
			//acc *= arg_1;
			arg_1 *= 5;
		//}
	}
    return arg_1;
}

int main() {

    for(int i = 0; i < AMOUNT_OF_TEST; ++i){	
   	 	fir(i);
    }
}



