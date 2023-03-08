
#include <stdlib.h>
#include "insertion_sort.h"

#define AMOUNT_OF_TEST 1

int insertion_sort(inout_int_t A[1000], in_int_t n)
{
	/*int sum = A[0];
	for(int i = 0; i < 4; i++) {
		if(i > 2)
			break;
		else {
			if(A[i] > 0) {
				sum++;
				//break;
			}
			else {
				sum = sum + 2;
				break;
			}
		}
	}
	return sum + n;*/
	//if (n <= 1) return n;
  int j = 0;
  int i = 1;
 // for (int i = 1; i < n; ++i) {
  	 int x = A[i];
  	 j = i;
  	 while (A[j] > 0/* && A[j-1] > x*/) {
  	 	A[j] = A[j-1];
  	 	--j;
  	 }
  	 A[j] = x;
  //}

  return n + j;

}

int main(void){
	inout_int_t a[AMOUNT_OF_TEST][S], b[AMOUNT_OF_TEST][S];
	in_int_t n[AMOUNT_OF_TEST];
    
	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
		n[i] = S;
		for(int j = 0; j < S; ++j){
    			a[i][j] = rand()%10;
    			b[i][j] = rand()%10;
			}
		}

	//for(int i = 0; i < AMOUNT_OF_TEST; ++i){
		int i = 0;
		insertion_sort(b[i], n[i]);
	//}
}



