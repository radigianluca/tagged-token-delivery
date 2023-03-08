
//------------------------------------------------------------------------
// Histogram
//------------------------------------------------------------------------


#include <stdlib.h>
#include "histogram.h"

#define AMOUNT_OF_TEST 1

int histogram( in_int_t feature[1000], in_int_t weight[1000], inout_int_t hist[1000], in_int_t n ) 
{
  int m;
  for(int i = 0; i < n; i++) {
  	m = feature[i];
  	int  wt = weight[i];
    int  x = hist[m];
  	hist[m] = x + wt;
  }
  return  m;
}


int main(void){
	  in_int_t feature[AMOUNT_OF_TEST][1000];
	  in_int_t weight[AMOUNT_OF_TEST][1000];
	  inout_int_t hist[AMOUNT_OF_TEST][1000];
	  in_int_t n[AMOUNT_OF_TEST];
    
	srand(13);
	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    n[i] = 1000;
    for(int j = 0; j < 1000; ++j){
      feature[i][j] = (j*2)%1000; //rand()%1000;
      weight[i][j] = (j+2)%100;//rand()%100;
      hist[i][j] = (j+4)%100;//rand()%100;
    }
	}

	//for(int i = 0; i < AMOUNT_OF_TEST; ++i){
		int i = 0; 
		histogram(feature[i], weight[i],hist[i], 1000);
		//histogram(3);
	//}
}

