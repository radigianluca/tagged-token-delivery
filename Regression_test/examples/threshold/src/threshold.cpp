
#include <stdlib.h>
#include "threshold.h"


int threshold(/*inout_int_t red[N], inout_int_t green[N], */inout_int_t blue[N], in_int_t th) {
	int sum = th;
	int i = 0;
	/*for( i = 0; i < 2; i++) {
		for(int k = 0; k < N; k++) {
			blue[k] = k + th;
		}

		for(int j = 0; j < N; j++) {
			sum += blue[j];
		}
	}*/
	for (i = 0; i < N; i++) {
		sum = /*red[i] + green [i] +*/ blue [i];

		if (sum <= th) {
			//red[i] = 0;
			//green [i] = 0;
			blue[i] = 0;

		}

	}
	return sum;

}

#define AMOUNT_OF_TEST 1

int main(void){
	inout_int_t red[AMOUNT_OF_TEST][N];
	inout_int_t green[AMOUNT_OF_TEST][N];
	inout_int_t blue[AMOUNT_OF_TEST][N];
	inout_int_t th[AMOUNT_OF_TEST];

	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
		th[i] = (rand() % 100);
		for(int j = 0; j < N; ++j){
			red[i][j] = (rand() % 100);
			green[i][j] = (rand() % 100);
			blue[i][j] = (rand() % 100);
		}
	}
    
	//for(int i = 0; i < AMOUNT_OF_TEST; ++i){
		int i = 0;
		threshold(/*red[i], green[i],*/ blue[i], th[i]);
	//}
}


