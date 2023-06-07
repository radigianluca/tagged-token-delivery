#include "binary_search.h"
//------------------------------------------------------------------------
// binary_search
//------------------------------------------------------------------------

//SEPARATOR_FOR_MAIN

#include <stdlib.h>

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

#define AMOUNT_OF_TEST 100

int binary_search (in_int_t searchVal, in_int_t A[N]) {
	int idx_1 = -1;
	int idx_2 = -1;

	for(int i = 0; i < N; i+=2) {
		if(A[i] == searchVal) {
			idx_1 = i;
			//break;
		}
	} 

	for(int i = 1; i < N; i+=2) {
		if(A[i] == searchVal) {
			idx_2 = i;
			//break;
		}
	} 

	int done = -1;
	if(idx_1 != -1)
		done = idx_1;
	else if(idx_2 != -1)
		done = idx_2;

	return done;
}

int main(void){
	in_int_t A[N];
    
	for(int i = 0; i < N; i++) {
		A[i] = i;
	} 
	
	for(int i = 0; i  < AMOUNT_OF_TEST; i++)
		binary_search(i, A);
}



