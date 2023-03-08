
#include "goto_challenge.h"

#define NX 30
#define NY 30
#define N 30

#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

int goto_challenge(in_int_t n, inout_int_t A[1000], inout_int_t B[1000])
{
   /* int x = A[n];
    int j = n;

    if (A[j-1] > B[j-1]) {
        B[j] = A[j-1];
        --j;

        if(j < 0) {
        goto label;
        } else {
        goto rdone;
        }
    }

    label:
    j++;
rdone:
    return j;*/

   int sum = 2;
    //int x = A[0];
    for(int j = 0; j < 10; j++) {
        for(int i = 1; i < 10; i++) {
            sum += i;
        } 
    }
      
    return n + sum;
    

    //if (n <= 1) return;
   //int i = n; //1;
    /*int x, y, j;
   for (int i = 1; i < 3; ++i) {
        x = A[i];
        j = i;
        y = A[i+1];
        while (j > 0 && A[j] > x) {
            A[j] = B[j-1];
            --j;
        }
        A[j] = x * y;
  }

    return j + n;*/

}


#define AMOUNT_OF_TEST 1

int main(void){
    int B[1000];
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
                    
    goto_challenge(3, C, B);
    //goto_challenge(3);
}





