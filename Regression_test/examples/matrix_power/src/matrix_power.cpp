
//========================================================================
// Matrix Power
//========================================================================


#include <stdlib.h>
#include "matrix_power.h"

int matrix_power( inout_float_t x[20][20], in_int_t row[20], in_int_t col[20], in_float_t a[20] )
{
  int k;
  for (k=1; k<20; k++) {
    for (int p=0; p<20; p++) {
      x[k][row[p]] += a[p]*x[k-1][col[p]];
    }
  }
  return k;
}

#define AMOUNT_OF_TEST 1

int main(void){
	inout_float_t mat[AMOUNT_OF_TEST][20][20];
	in_int_t row[AMOUNT_OF_TEST][20];
	in_int_t col[AMOUNT_OF_TEST][20];
	in_float_t a[AMOUNT_OF_TEST][20];
    
	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    for(int y = 0; y < 20; ++y){
      col[i][y] = rand() % 20;
      row[i][y] = rand() % 20;
      a[i][y] = rand();
      for(int x = 0; x < 20; ++x){
        mat[i][y][x] = rand() % 5;

      }
    }
  }

	//for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    int i = 0;
	matrix_power(mat[i], row[i], col[i], a[i]);
	//}
}





