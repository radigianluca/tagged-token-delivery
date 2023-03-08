#include <stdlib.h>
#include "fixed.h"

#define AMOUNT_OF_TEST 1

int fixed(in_float_t y){

	int c = 1000;//1000.0;
	int x1;
	int x0 = 1;//1.0;
	int a = 0;//0.00000001;

	while (c >= a) {
		x1 = x0*y;
		c = x0-x1;
		x0 = x1;
	}

	return x1;
}

int main(void){
    int y = 8;//0.8;
	fixed(y);
}
