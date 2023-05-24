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

#define AMOUNT_OF_TEST 10

int binary_search (in_int_t arg_1, in_int_t A[N]) {
	/*int idx_1 = -1;
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

	return done;*/

	for(int i = 0; i < 5; i++)
	{
		if(A[arg_1] % 2)
			arg_1 *= A[i+1];
		else
			arg_1 += A[i];
	}

	return arg_1;

	//return idx;
	/*int pos = 0;
	int add = 1;
	while (first <= last) {
		if(A[pos] == searchVal)
			return pos; 

		if(A[pos] < searchVal) {
			first = pos + 1;
			//if(pos + add < last) {
				pos = pos + add;
			//} else {
			//	pos = last;
			//}
			add += add;
		} else {
			last = pos - 1;
			pos = first;
			add = 1;
		} 
	}	

	return 0; */
}

int main(void){
	in_int_t A[N];
    
	for(int i = 0; i < N; i++) {
		A[i] = i;
	} 
	
	for(int i = 0; i  < AMOUNT_OF_TEST; i++)
		binary_search(i, A);
}



