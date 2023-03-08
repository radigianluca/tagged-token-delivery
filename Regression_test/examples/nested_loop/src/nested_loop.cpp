#include <stdlib.h>
#include "nested_loop.h"

#define AMOUNT_OF_TEST 1

int nested_loop (in_int_t a[1000], in_int_t b[1000], out_int_t c[1000]) {
	int sum = 0;
	int i,j;
	int bound = 1000;

	for(j = 0; j < 2; j++){

		i = 0;
		sum = 0;

		while (sum < bound) {

			sum = a[i] * b[i];
			c[i + j] = sum;
			i++;
		
		}
	}
	return sum;
	
}

int main(void){
	in_int_t a[AMOUNT_OF_TEST][1000];
	in_int_t b[AMOUNT_OF_TEST][1000];
	out_int_t c[AMOUNT_OF_TEST][1000];


	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
		for(int j = 0; j < 1000; ++j){
			a[i][j] = rand() % 10;
			b[i][j] = rand() % 10;
            c[i][j] = 0;
	    }
		a[i][900] = 50;
		b[i][900] = 60;
    }
    
    int i = 0;
	nested_loop(a[i], b[i], c[i]);
}





