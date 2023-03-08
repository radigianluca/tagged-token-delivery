#include "fir.h"
//------------------------------------------------------------------------
// FIR
//------------------------------------------------------------------------

//SEPARATOR_FOR_MAIN

#include <stdlib.h>
#include "fir.h"

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

#define N 30

#define AMOUNT_OF_TEST 1



int fir(in_int_t arg_1) {
    int sum = 0;
    //for(int j = 0; j < 2; j++) {
		for(int i = 0; i < 2; i++) {
			sum += arg_1;   // II = 3
		}
    //}
	   
    return sum; 
}
int main() {
    for(int i = 0; i < AMOUNT_OF_TEST; ++i){
   	 fir(i*2);
    }
}
