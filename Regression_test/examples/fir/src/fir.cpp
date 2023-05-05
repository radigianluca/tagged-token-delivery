#include "fir.h"
//------------------------------------------------------------------------
// FIR
//------------------------------------------------------------------------

//SEPARATOR_FOR_MAIN

#include <stdlib.h>
#include "fir.h"

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

#define AMOUNT_OF_TEST 10

int fir(in_int_t arg_1, inout_int_t A[N]) {  
	int acc = 1; 
	for(int i = 2; i < N;i++) {
		if(arg_1 % 2) {
			acc *= A[i];  
		} else {
			acc += A[i-1];
			arg_1++;
		}
	}


    return acc;
}

int main() {
	int A[N];
	for(int j = 0; j < N; j++) {  // play here so that A of every thread has different values
			A[j] = j;
		}

    for(int i = 0; i < AMOUNT_OF_TEST; ++i){	
   	 	fir(i, A);
    }
}

/*int fir(in_int_t arg_1)
{
	for(int i = 0; i < 5; i++)
	{
		if(arg_1 % 2)
			arg_1 = arg_1 * 5; 
		else
			arg_1 += 1;
	}
	return arg_1;
}

int main()
{
	for(int i = 0; i < AMOUNT_OF_TEST; i++)
	{
		fir(i);
	}
}*/


