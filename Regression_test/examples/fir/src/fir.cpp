#include "fir.h"
//------------------------------------------------------------------------
// FIR
//------------------------------------------------------------------------

//SEPARATOR_FOR_MAIN

#include <stdlib.h>
#include "fir.h"

#define AMOUNT_OF_TEST 1

int fir (in_int_t a) {
	int sum = 0;
	//for(int i = 0; i < 50; i++) {
		for(int j = 0; j < 10; j++) {
			sum += j;
		}
	//}
	
	return sum+a;
}

int main(void){
	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
   	 fir(i*2);
    }
}



