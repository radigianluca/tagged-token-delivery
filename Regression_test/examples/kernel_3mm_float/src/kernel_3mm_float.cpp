/**
 * 3mm.c: This file is part of the PolyBench/C 3.2 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */

#include <stdio.h>
#include <stdlib.h>
#include "kernel_3mm_float.h"

void kernel_3mm_float(in_float_t A[N][N], in_float_t B[N][N], in_float_t C[N][N], in_float_t D[N][N], inout_float_t E[N][N], inout_float_t F[N][N], inout_float_t G[N][N])


{
  int i, j, k;

  for (i = 0; i < NI; i++)
    for (j = 0; j < NJ; j++)
      {
    	float tmp = E[i][j];
    	for (k = 0; k < NK; ++k)
    	  tmp += A[i][k] * B[k][j];
      E[i][j] = tmp;
      }

  for (i = 0; i < NJ; i++)
    for (j = 0; j < NL; j++)
      {
    	float tmp = F[i][j];
    	for (k = 0; k < NM; ++k)
    	  tmp += C[i][k] * D[k][j];
      F[i][j] = tmp;
      }
  for (i = 0; i < NI; i++)
    for (j = 0; j < NL; j++)
      {
    	float tmp = G[i][j];
    	for (k = 0; k < NJ; ++k)
    	  tmp += E[i][k] * F[k][j];
      G[i][j] = tmp;
      }

}


#define AMOUNT_OF_TEST 1

int main(void){
    in_float_t A[AMOUNT_OF_TEST][N][N];
    in_float_t B[AMOUNT_OF_TEST][N][N];
    in_float_t C[AMOUNT_OF_TEST][N][N];
    in_float_t D[AMOUNT_OF_TEST][N][N];
    inout_float_t E[AMOUNT_OF_TEST][N][N];
    inout_float_t F[AMOUNT_OF_TEST][N][N];
    inout_float_t G[AMOUNT_OF_TEST][N][N];
    
    for(int i = 0; i < AMOUNT_OF_TEST; ++i){
        for(int y = 0; y < N; ++y){
            for(int x = 0; x < N; ++x){
                A[i][y][x] = rand() % 2;
                B[i][y][x] = rand() % 2;
                C[i][y][x] = rand() % 2;
                D[i][y][x] = rand() % 2;
                E[i][y][x] = rand() % 2;
                F[i][y][x] = rand() % 2;
                G[i][y][x] = rand() % 2;
            }
        }
    }

	//for(int i = 0; i < AMOUNT_OF_TEST; ++i){

    kernel_3mm_float(A[0], B[0], C[0], D[0], E[0], F[0], G[0]);
	//}
	
}





