#include "polynMult.h"
//------------------------------------------------------------------------
// polynMult
//------------------------------------------------------------------------

//SEPARATOR_FOR_MAIN

#include <stdlib.h>

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>


#define AMOUNT_OF_TEST 1

int polynMult (out_int_t r[NTRU_N], in_int_t a[NTRU_N], in_int_t b[NTRU_N]) {
	int k,i,p;

	for(k=0; k<NTRU_N; k++)
	{
		r[k] = 0;
		for(i=1; i<NTRU_N-k; i++)
			r[k] += a[k+i] * b[NTRU_N-i];
		for(i=0; i<k+1; i++)
			r[k] += a[k-i] * b[i];
		//r[k] = x;
		p = i+k;
	}

	return p;
}

#define AMOUNT_OF_TEST 1

int main(void){
	out_int_t r[NTRU_N];
	in_int_t a[NTRU_N];
	in_int_t b[NTRU_N];

	for(int i = 0; i < NTRU_N; i++) {
  	r[i] = 0;
  	a[i] = i % 10;
  	b[i] = (NTRU_N - i) % 10;
  }

	polynMult(r, a, b);

}



