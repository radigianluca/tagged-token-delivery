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
			sum = j;
		}
	//}
	
	return sum+a;

	/*int sum = 0;
	if(a < b) {
		sum = b * 2;
	} else {
		if(a > b)
			sum = a * 4;

		else
			sum = a * 3;
	}

	return sum;	*/

	/*int sum_1 = 0;
	int sum_2 = 0;
	int sum_3 = 0;

	for(int i = 0; i < 50; i++) {
		for(int j = 0; j < 3; j++) {
			sum_1 += i*j;
		}
	}

	for(int k = 0; k < 1000; k++) {
		sum_2 += k;
	}

	if(a > 3) {
		sum_3 = sum_1;
	} else {
		sum_3 = sum_2;
	}

	return sum_3; */
}

int main(void){
	fir(5);
}



