#include "matrix.h"

#define A_ROWS 32
#define A_COLS 32
#define B_ROWS 32
#define B_COLS 32

#include <stdlib.h>

#define TOT_DIM 1024

#define N_SHIFT 5

// matrix multiplication of a A*B matrix
int matrix (in_int_t in_a[TOT_DIM], in_int_t in_b[TOT_DIM], out_int_t out_c[TOT_DIM])
{
    int i,j,k;
    for (i = 0; i < A_ROWS; i++)
    {
        for (j = 0; j < B_COLS; j++)
        {
            int sum_mult = 0;
            for (k = 0; k < A_COLS; k++)
            {
                sum_mult += in_a[(i<<N_SHIFT)+k] * in_b[(k<<N_SHIFT)+j];
            }
            out_c[(i<<N_SHIFT)+j] = sum_mult;
        }
    }
    return i;
}


#define AMOUNT_OF_TEST 1

int main(void){
    in_int_t in_a[AMOUNT_OF_TEST][TOT_DIM];
    in_int_t in_b[AMOUNT_OF_TEST][TOT_DIM];
    in_int_t out_c[AMOUNT_OF_TEST][TOT_DIM];
    
    srand(13);
    for(int i = 0; i < AMOUNT_OF_TEST; ++i){
        for(int y = 0; y < A_ROWS; ++y){
            for(int x = 0; x < A_ROWS; ++x){
                in_a[i][y * A_COLS+x] = rand()%10;
                in_b[i][y * A_COLS+x] = rand()%10;
            }
        }
    }

    int i = 0;
    matrix(in_a[i], in_b[i], out_c[i]);
}




