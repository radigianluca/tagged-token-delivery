#include <stdlib.h>
#include "loop_path.h"

#define AMOUNT_OF_TEST 1

int loop_path (int a[1000], int b[1000], int c[1000]) {
	int i = 0;
	int x = 5;
	int temp;

	while(i < 1000) {

		temp = a[i] + b[i];
		
		c[i] = temp;
		if ((1000 - temp) <= x*temp){
			break;
		}
		i++;

	}

	return i;
}

int main(void){
	in_int_t a[AMOUNT_OF_TEST][1000];
	in_int_t b[AMOUNT_OF_TEST][1000];
	out_int_t c[AMOUNT_OF_TEST][1000];

	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
		for(int j = 0; j < 1000; ++j){
			a[i][j] = rand() % 6;
			b[i][j] = rand() % 3;
			c[i][j] = 0;
	    }
		a[i][900] = 2;
		b[i][900] = 400;
    }
    
    int i = 0;
	loop_path(a[i], b[i], c[i]);
}





