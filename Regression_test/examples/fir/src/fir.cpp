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

/* GOAL: 
		- Do a simple accumulation of sum loop with no memory for not
		- Make sure in your simple example that the resulting circuit does not need to regenerate START (i.e., no constant is triggered inside a loop)
			- The purpose of the previous point is that I will try to experiment the idea of sequential execution of invocations by passing START
						Just once to prevent activating the 2 inputs of INIT!!

						IN FACT, I can't avoid having constants inside the loop, so I will just trigger them with source instead for now (instead of with START!!)
*/


int fir(in_int_t arg_1) {
    int sum = 0;
    //for(int k = 0; k < 2; k++)
    for(int j = 0; j < 2; j++) {
    	//sum = 3;
		for(int i = 0; i < 2; i++) {
			sum += arg_1;   // II = 3
		}
    }
	   
    return sum; 
}
int main() {
    for(int i = 0; i < AMOUNT_OF_TEST; ++i){
   	 fir(i*2);
    }
}


/*int fir (in_int_t d_i[1000], in_int_t idx[1000] ) {
	int i;
	int tmp=0;

	For_Loop: for (i=0;i<1000;i++) {
		tmp += idx [i] * d_i[999-i];

	}

        //out [0] = tmp;
	return tmp;
}

int main(void){
	  in_int_t d_i[AMOUNT_OF_TEST][1000];
	  in_int_t idx[AMOUNT_OF_TEST][1000];
 	  inout_int_t out[AMOUNT_OF_TEST][1000];	
    
	srand(13);
	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    	for(int j = 0; j < 1000; ++j){
			d_i[0][j] = rand() % 100;
			idx[0][j] = rand() % 100;
		}
	}

	for(int i = 0; i < 1; ++i){
		fir(d_i[0], idx[0] );
	}
}*/

/*int fir (in_int_t arg_1) {
	int sum = 0;
	//for(int a = 0; a < 3; a++) {
		//arg_1 = arg_1 + 1;
		//for(int u = 0; u < 2; u++) {
			for(int j = 0; j < 3; j++)
				for (int i=0; i<5; ++i) {
					sum+= arg_1;  // arg_1 has a token count mismatch
				}
		//}
	//}
	

	return sum;
	*/
  	
	/*int sum_2 = 0;
	for(int i = 0; i < 2; i++) {
		for(int j = 0; j < 2; j++) {
			for(int a = 0; a < 5; a++) {
				A[a] = sum_2;
			}

			for(int a = 0; a < 5; a++) {
				sum_2 = a;
			}
		}
	}
	return sum_2 + x;*/
	/*int sum = 0;
	for(int i = 0; i < 10; i++) {
		A[i+2] = i;
		for(int j = 0; j < 10; j++) {
			sum += A[j];
		}
		// try loading it using something else too!!!
		B[i] = A[i+3];
	}
	return sum + x;*/
	/*int i;
	int tmp=0;

	For_Loop: for (i=0;i<1000;i++) {
		tmp += idx [i] * d_i[999-i];

	}

        //out [0] = tmp;
	return tmp;*/
	/*int sum = 0;
	for(int i = 0; i < 5; i++) {
		for(int j = 0; j < 2; j++) {	
			sum += A[i];
		}
	} 
	return sum;*/
	// getTanh
	/*int result, beta;
	for(int i = 0; i < 1000; i++) {
		int address = addr[i];
		beta = A[address];

		if(beta >= 1)
			result = 1;
		else
			result = beta * beta + 3 * beta * beta + 5 * beta;

		A[address] = result;

	}

	return result;*/

	// SpMV
	// in_int_t n, inout_int_t row[10], inout_int_t col[10], inout_int_t val[10], inout_int_t vec[10], inout_int_t out[10]
	/*int s = 0;
	int e = 0;
	int tmp, cid;
	for(int i = 0; i < n; i++) {
		tmp = 0;
		s = row[i];
		e = row[i + 1];
		for(int c = s; c < e; c++) {
			cid = col[c];
			tmp += val[c] * vec[cid];
		}

		out[i] = tmp;
	}

	return s;*/
	/*int sum = 0;
	
	for(int i = 100; i >= sum; i--)
		sum += c;

	return sum + c;
	*/
	/*int j = 1;
	for(int kk = 0; kk < 2; kk++) {
		//int x = A[n];
		//j = j + n;
		if (j > 0) {
			//B[j] = A[j-1];
			--j;
			
			if(j < 0) {
				//goto label_1;
				j++;
			} //else {
				//goto label_2;
			//}
		}

		label_1:
			j++;

		label_2:
			j+= 2;

	} */
	

//	label:
//		j++;

	//rdone:
		//return j + n;
	


	/*int b = A[0];

	if(b > 0) {
		B[0] = -1;
	} else {
		B[0] = 0;
	}

	return b + c;
	*/
	
	/*int sum = 0;
	
	for(int i = 0; i < c; i++)
		sum += 1;

	return sum + c;
	*/

	/*for(int i = 1; i < 5; i++)
		A[i] += i;
	return A[4] + c;
	*/
	

	/*int i;
	int z;
	for(i = 0; i < 1000; i++) {
		if(i % 2) {
			z = x *i;
			B[i] = z;
		} else {
			z = x + i;
			C[i] = z;
		}
		A[i] = z;
	}

	return i+x; */
	
	
	/*int sum_1 = 0;
	
		for(int i = 0; i < 1000; i++) {
			if(i % 2)
				sum_1 = i;
			else {
				for(int k = 0; k < 500; k++) {
					//if(i > 10)
						sum_1 = k;

					//else
						//sum_1 *= A[k]*20;
				}
			}

			A[i] = sum_1;
		}


	return sum_1 + x; */
	/*int sum = 0;
	for(int i = 0; i < 5; i++)
		sum = i;

	return sum + x;
	*/
	/*int sum_1 =5;
	int sum_2 = 0;
	int sum_3 = 0;

	for(int i = 0; i < 10; i++)
		for(int k = 0; k < 50; k++)
			sum_1 = i*k;

	for(int j = 0; j < 20; j++)
		for(int z = 0; z < 30; z++)
			sum_2+=j*z;

	for(int i = 0; i < 10; i++)
		for(int k = 0; k < 50; k++)
			sum_3 = i+k;
	

	return sum_1 + sum_2 + sum_3 + x;
	*/
	
	/*int i = 0;
	int gg;
	do {
		if(cond > 1) {
			gg = x;
		} else {
			gg = 0;
		}
		A[i] = gg;
		i++;
	} while(i < 10);
	*/
	/*int sum = 0;
	for(int i = 0; i < 10; i++) {
		sum += A[i];
	}
	return sum;*/

	/*int i;
	for(i = 0; i < 10; i++) {
		if(A[i] > 10)
			break;
	}
	return i; 
	*/

	/*//int x = 3;
	int y = 4;
	for(int i = 0; i < 10; i++) {
		if(cond > i) {
			A[i] = x;
		} else {
			A[i] = y;
		}
		//x++;
		y++;
	}*/
	//return x + y;
	/*int sum  = 3;
	int x;
	for(int i = 0; i < 5; i++) {
		x = B[i];
		//for(int j = 0; j < 10; j++) {
			//for(int k = 0; k < 3; k++)
				sum += x*x*x;
		//}
	}
	return sum+a;
	*/

	/*int sum = 0;
	for(int i = 0; i < 2; i++) {
		for(int j = 0; j < 5; j++) {
			if(a < 3)
				sum +=1;
			else{
				if(a > 0)
					sum += 3;
			}
		}
	}
	return sum+a;		
	*/
//}

//#define AMOUNT_OF_TEST 1

/*int main(void){	
	 in_int_t feature[AMOUNT_OF_TEST][N];
	  in_int_t weight[AMOUNT_OF_TEST][N];
	  inout_int_t hist[AMOUNT_OF_TEST][N];
	  in_int_t n[AMOUNT_OF_TEST];

	  in_int_t arg_1[AMOUNT_OF_TEST];
	  in_int_t arg_2[AMOUNT_OF_TEST];
    
	srand(13);
	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    n[i] = N;
    arg_1[i] = i+5;
    arg_2[i] = i+1;
    for(int j = 0; j < N; ++j){
      feature[i][j] = rand()%1000;//(j*2)%S; //
      weight[i][j] = rand()%100;//(j+2)%S;//
      hist[i][j] = rand()%100;//(j+4)%S;//
    }
	}


	inout_int_t A[AMOUNT_OF_TEST][10];

	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
		fir(arg_1[i]);
	} */
	/* in_int_t d_i[AMOUNT_OF_TEST][1000];
	  in_int_t idx[AMOUNT_OF_TEST][1000];
 	  inout_int_t out[AMOUNT_OF_TEST][1000];	
    
	srand(13);
	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    	for(int j = 0; j < 1000; ++j){
			d_i[0][j] = rand() % 100;
			idx[0][j] = rand() % 100;
		}
	}

	in_int_t a[AMOUNT_OF_TEST][1000];
	inout_int_t b[AMOUNT_OF_TEST][10];
	for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    	for(int j = 0; j < 1000; ++j){
			a[0][j] = rand() % 100;
		}

		for(int j = 0; j < 10; ++j){
			b[0][j] = rand() % 100;
		}
	}
	for(int i = 0; i < 1; ++i){
		fir(a[0],3);
	}
	*/

	/*int row[10];
	int col[10];
	int val[1000];
	int vec[10];
	int out[10];
	//int A[10];

	for(int i = 0; i < 10; i++) {
		row[i] = rand() % 3;
		col[i] = rand() % 3;
		//val[i] = rand() % 10;
		vec[i] = rand() % 10;
		out[i] = rand() % 10;
		//A[i] = rand() % 10;
	}
	for(int i = 0; i < 1000; i++) {
		val[i] = rand() % 100;
	}

	int A[5];
	int addr[1000];
	for(int i = 0; i < 1000; i++) {
		//A[i] = i % 100;
		addr[i] = (2 * i) % 100;
	} 

	for(int i = 0; i < 5; i++) {
		A[i] = i % 10;
	} 

	fir(A); */
	//fir(0, 10, 4, A);

	/*int B[1000];
	int A[3];
	int C[1000];
	for(int i = 0; i < 1000; i++) {
		//A[i] = rand() % 20;
		B[i] = rand() % 20;
		C[i] = rand() % 20;
	}

	for(int i = 0; i < 2; i++) {
		//B[i] = rand() % 20;
		A[i] = rand() % 20;
	}
					
	fir(3, B, C); */
	
	//fir(4, 1);

		/*in_int_t A[1][30];
    inout_int_t s[1][30];
    inout_int_t q[1][30];
    in_int_t p[1][30];
    in_int_t r[1][30];
    
    for(int i = 0; i < 1; ++i){
        for(int y = 0; y < 30; ++y){
            s[i][y] = rand()%100;
            q[i][y] = rand()%100;
            p[i][y] = rand()%100;
            r[i][y] = rand()%100;
            //for(int x = 0; x < 30; ++x){
                A[i][y] = rand()%100;
            //}
        }
    }
    int i = 0;
    fir(A[i], s[i], q[i], p[i], r[i]);
	*/

//}



