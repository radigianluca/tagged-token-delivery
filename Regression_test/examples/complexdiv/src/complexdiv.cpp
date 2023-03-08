#include "complexdiv.h"
#include <math.h>

#include <stdlib.h>


#define AMOUNT_OF_TEST 1

int complexdiv (in_int_t A[20]) {
	int sum_1 = 0;
	//int sum_2 = 0;
	for(int i = 0; i < 10; i++) {	
		for(int j = 0; j < 10; j++) {
			sum_1 += A[i];
		}
	}

	return sum_1;// + x;

	/*
	in_int_t i;
	for (i=0;i<1000;i++) {
		in_int_t bi = b_i[i];
		in_int_t br = b_r[i];
		in_int_t ai = a_i[i];
		in_int_t ar = a_r[i];
in_int_t cr, ci;
		if (abs(br) >= abs(bi)) {
		        in_int_t r=bi/br;
		        in_int_t den=br+r*bi;
		        cr=(ar+r*ai)/den;
		        ci=(ai-r*ar)/den;
		    } else {
		        in_int_t r=br/bi;
		        in_int_t den=bi+r*br;
		        cr=(ar*r+ai)/den;
		        ci=(ai*r-ar)/den;
		    }
		c_r[i]=cr;
		c_i[i]=ci;
	}*/

}

int main(void){
	in_int_t a_i[20];

	for(int i = 0; i < 20; i++) {
		a_i[i] = i;
	} 

	complexdiv(a_i);
	

    //in_int_t a_i[AMOUNT_OF_TEST][1000];
    /*in_int_t a_r[AMOUNT_OF_TEST][1000];
    in_int_t b_i[AMOUNT_OF_TEST][1000];
    in_int_t b_r[AMOUNT_OF_TEST][1000];
    out_int_t c_i[AMOUNT_OF_TEST][1000];
    out_int_t c_r[AMOUNT_OF_TEST][1000];
    
    srand(13);

    for(int i = 0; i < AMOUNT_OF_TEST; ++i){
        for(int j = 0; j < 1000; ++j){
            a_i[i][j] = 1;//rand()% 1;
            a_r[i][j] = 1;//rand()% 1;
            b_i[i][j] = 1;//rand()% 1;
            b_r[i][j] = 1;//rand()% 1;
        }
    }

	//for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    int i = 0; 
    complexdiv(a_i[0], a_r[0], b_i[0], b_r[0], c_i[0], c_r[0]);
	//}
	*/
}

