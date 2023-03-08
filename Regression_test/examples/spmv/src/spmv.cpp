#include "spmv.h"
//------------------------------------------------------------------------
// spmv
//------------------------------------------------------------------------

//SEPARATOR_FOR_MAIN

#include <stdlib.h>

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>


int spmv (in_int_t n, inout_int_t row[NM], inout_int_t col[NM], inout_int_t val[NM], inout_int_t vec[NM], inout_int_t out[NM]) {
	int s = 0;
	int e = 0;
	int tmp, cid;
	for(int i = 0; i < n; i++) {
		tmp = 0;
		s = row[i];
		e = row[i + 1];
		for(int c = s; c < e; c++) {
			cid = col[c];
			tmp += val[c] * vec[cid];
		}

		out[i] = tmp;
	}

	return s;
}

#define AMOUNT_OF_TEST 1

int main(void){
	in_int_t n = NM - 2;
	inout_int_t row[NM];
    inout_int_t col[NM]; 
	inout_int_t val[NM]; 
    inout_int_t vec[NM];
    inout_int_t out[NM];

	for(int i = 0; i < NM; i++) {
		row[i] = rand() % 3;
		col[i] = rand() % 3;
		val[i] = rand() % 3;
		vec[i] = rand() % 3;
		out[i] = rand() % 3;
		//A[i] = rand() % 10;
	} 

	spmv(n, row, col, val, vec, out);

}



