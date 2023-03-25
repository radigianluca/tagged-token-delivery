#include "fir.h"
//------------------------------------------------------------------------
// FIR
//------------------------------------------------------------------------

//SEPARATOR_FOR_MAIN

#include <stdlib.h>
#include "fir.h"

#define AMOUNT_OF_TEST 10

/*int fir (in_int_t d_i[1000], in_int_t idx[1000] ) {
	int i;
	int tmp=0;

	For_Loop: for (i=0;i<1000;i++) {
		tmp += idx [i] * d_i[999-i];

	}

        //out [0] = tmp;
	return tmp;
}


int main(void){
	  in_int_t d_i[AMOUNT_OF_TEST][1000];
	  in_int_t idx[AMOUNT_OF_TEST][1000];
 	  inout_int_t out[AMOUNT_OF_TEST][1000];	
    
	srand(13);
	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    	for(int j = 0; j < 1000; ++j){
			d_i[0][j] = rand() % 100;
			idx[0][j] = rand() % 100;
		}
	}

	for(int i = 0; i < 1; ++i){
		fir(d_i[0], idx[0] );
	}
}*/

/*int fir(in_int_t arg_1) {
    int sum = 0;
    for(int i = 0; i < 10; i++) {
        sum += arg_1;   // II = 3
    }
    return sum;
}*/

int fir(in_int_t arg_1) {
    for(int i = 0; i < 2; i++) 
    {
    	arg_1 = arg_1 * 5;
    }
    return arg_1;
}

int main(void) {
    for(int i = 0; i < AMOUNT_OF_TEST; ++i){
   	 fir(i+1);
    }
}

//SEPARATOR_FOR_MAIN


