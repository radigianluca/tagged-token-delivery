#include <stdlib.h>
#include "subdiag.h"


#define AMOUNT_OF_TEST 1

int subdiag (in_float_t d[1000], in_float_t e[1000]) {
	int i = 0;
	//float dd;
	//float x;
	int dd;
	int x;

	for (i=0; i<999; i++) {
		dd = d[i] + d[i+1] ;
		x = 2;//0.001;
		if ((e[i]) <= x*(dd)) break;
	}
	return i;

}

int main(void){
	//float d[AMOUNT_OF_TEST][1000];
	//float e[AMOUNT_OF_TEST][1000];
	int d[AMOUNT_OF_TEST][1000];
	int e[AMOUNT_OF_TEST][1000];

	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
		for(int j = 0; j < 1000; ++j){
			d[i][j] = (j+10);//(float)(j+10);
			e[i][j] = ((30+j));//(float)((30+j));
	    }
		e[i][900] = 1;//(float)0.0001;
    }
    
    int i = 0;
	subdiag(d[i], e[i]);
}
