/**
 * covariance.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */

#include "covariance_float.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define AMOUNT_OF_TEST 1

void covariance_float(inout_float_t data[30][30], out_float_t symmat [30][30], out_float_t mean[30])
{
  int i, j, j1, j2;
  float float_n = 30;

  /* Determine mean of column vectors of input data matrix */
     for (j = 0; j < 30; j++)
    {
      float x = 0;
      for (i = 0; i < 30; i++)
         x += data[i][j];
      mean[j] = x/float_n;
    }

  /* Center the column vectors. */
  for (i = 0; i < 30; i++)
    for (j = 0; j < 30; j++)
      data[i][j] -= mean[j];

  /* Calculate the m * m covariance matrix. */
  for (j1 = 0; j1 < 30; j1++)
    for (j2 = j1; j2 < 30; j2++)
      {
        float  x = 0;
        for (i = 0; i < 30; i++)
	         x += data[i][j1] * data[i][j2];

        symmat[j1][j2] = x;
        symmat[j2][j1] = x;
      }
}

int main(void){
	  inout_float_t data[AMOUNT_OF_TEST][30][30];
	  out_float_t symmat[AMOUNT_OF_TEST][30][30];
	  out_float_t mean[AMOUNT_OF_TEST][30];
    
	srand(13);
	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    for(int y = 0; y < 30; ++y){
      for(int x = 0; x < 30; ++x){
        data[i][y][x] = rand()%100;
      }
    }
	}

	//or(int i = 0; i < AMOUNT_OF_TEST; ++i){
	int i = 0;
	covariance_float(data[i], symmat[i], mean[i]);
	//}
}






