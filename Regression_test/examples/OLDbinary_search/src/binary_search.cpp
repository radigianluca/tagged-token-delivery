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

#define AMOUNT_OF_TEST 1

int binary_search (in_int_t first, in_int_t last, in_int_t searchVal, inout_int_t A[5]) {
	while(first <= last) {
		int middle = first + (last - first) / 2;
		
		if(A[middle] == searchVal)
			return middle; 

		if(A[middle] < searchVal)
			first = middle + 1;

		else 
			last = middle - 1;

	}

	return -1;
}

int main(void){
	inout_int_t A[5];
    
	for(int i = 0; i < 5; i++) {
		A[i] = i;
	} 
	
	binary_search(0, 4, 0, A);
}



