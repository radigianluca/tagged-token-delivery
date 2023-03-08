/**
 * covariance.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */

#include "covariance.h"
#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define AMOUNT_OF_TEST 1

int covariance(inout_int_t data[_N], out_int_t symmat [_N], out_int_t mean[N])
{
  int i, j, j1, j2;
  int float_n = N_float;

  /* Determine mean of column vectors of input data matrix */
     for (j = 0; j < N; j++)
    {
      int x = 0;//0.0;
      for (i = 0; i < N; i++)
         x += data[(i<<N_shift) + j];
      mean[j] = x / float_n;
    }

  /* Center the column vectors. */
  for (i = 0; i < N; i++)
    for (j = 0; j < N; j++)
      data[(i<<N_shift) + j] -= mean[j];

  /* Calculate the m * m covariance matrix. */
  for (j1 = 0; j1 < N; j1++)
    for (j2 = j1; j2 < N; j2++)
      {
        int x = 0;//0.0;
        for (i = 0; i < N; i++)
           x += data[(i<<N_shift) + j1] * data[(i<<N_shift) + j2];

        symmat[(j1<<N_shift) + j2] = x;
        symmat[(j2<<N_shift) + j1] = x;
      }

    return j1;

}

int main(void){
   inout_int_t data[AMOUNT_OF_TEST][_N];
    out_int_t symmat[AMOUNT_OF_TEST][_N];
    out_int_t mean[AMOUNT_OF_TEST][N];

  for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    for(int y = 0; y < N; ++y){
      for(int x = 0; x < N; ++x){
        data[i][y*N + x] = rand()%100;
      }
    }
  }

  int i = 0;
  covariance(data[i], symmat[i], mean[i]);
}
