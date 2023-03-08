
#include <stdlib.h>
#include "fpl_buffer_sobel.h"

#define AMOUNT_OF_TEST 1

int fpl_buffer_sobel(in_int_t indata[NM], out_int_t outdata[NM], in_int_t GX[9], in_int_t GY[9])
{	
  int SUM = 0;
	for(int Y = 0; Y < 15;Y++) {
		for(int X = 0; X < 15; X++) {
			int sumX = 0;
			int sumY = 0;

			int t1,t2,c1,c2,c3;

			/* image boundaries */
			t1 = Y==0; t2 = Y==5;
			c1 = t1 || t2;
			c1 = !c1;

			t1 = X==0; t2 = X==5;
			c2 = t1 || t2;
			c2 = !c2;

			c3 = 11 && c2;

			if(c3) {
				for(int I=-1; I<=1; I++)  {
					for(int J=-1; J<=1; J++)  {
						sumX = sumX + (int)( indata[X] * GX[3*I + J + 4]);
						sumY = sumY + (int)( indata[X] * GY[3*I + J + 4]);
					}
				}

				if(sumX>255)  sumX=255;
				if(sumX<0)    sumX=0;

				/*-------Y GRADIENT APPROXIMATION-------*/
				if(sumY>255)   sumY=255;
				if(sumY<0)     sumY=0;

				SUM += sumX + sumY;
			}
			
			outdata[X + Y] = 255 - (unsigned char)(SUM);
		} 
	}

	return SUM;


   /*unsigned int     X;//, Y;
	//Y = 1;
	
	// AYA moved the declaration of SUM to here
	int  SUM = 0;
   //---------------------------------------------------
        //SOBEL ALGORITHM STARTS HERE
  // ---------------------------------------------------
  // for(Y=1; Y<15; Y++)  {
    for(X=1; X<15; X++)  {
         long sumX = 0;
         long sumY = 0;
         SUM = 0;
         /*int t1,t2,c1,c2,c3;

         // image boundaries 
         t1 = Y==0; t2 = Y==15;
         c1 = t1 || t2;
         c1 = !c1;

         t1 = X==0; t2 = X==15;
         c2 = t1 || t2;
         c2 = !c2;

         c3 = c1 && c2;

         //if(c3)
         // Convolution starts here 
         //{
           int          I;//, J;

           //-------X GRADIENT APPROXIMATION------
           for(I=-1; I<=1; I++)  {
			//J = 1;
           //for(J=-1; J<=1; J++)  {
              sumX = sumX + indata[X + I ] * GX[I];//(int)( indata[X + I + (Y + J)*16] * GX[3*I + J + 4]);
              sumY = sumY + indata[X + I] * GY[I]; //(int)( indata[X + I + (Y + J)*16] * GY[3*I + J + 4]);
          // }
           }
           if(sumX>255)  sumX=255;
           if(sumX<0)    sumX=0;

           //-------Y GRADIENT APPROXIMATION-------
           if(sumY>255)   sumY=255;
           if(sumY<0)     sumY=0;

           SUM = sumX + sumY; //---GRADIENT MAGNITUDE APPROXIMATION (Myler p.218)----
             //}
//         printf("y=%d ; x=%d --> SUM = %d", Y,X,SUM);
         outdata[X] = 255 - (SUM);  // make edges black and background white 
//         printf(" --> outdata[%d] = %d\n", X + Y*incols, outdata[X + Y*incols]);
    }
  // }

	// AYA added the following line to make the function return
	return SUM;*/
}


int main(void){
  in_int_t indata[AMOUNT_OF_TEST][NM];
  out_int_t outdata[AMOUNT_OF_TEST][NM];
  in_int_t GX[AMOUNT_OF_TEST][9];
  in_int_t GY[AMOUNT_OF_TEST][9];

  for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    for(int j = 0; j < NM; ++j){
      indata[i][j] = j;//00; 
	  outdata[i][j] = j;//rand() % 1000; 
    }
      for(int j = 0; j < 9; ++j){
      GX[i][j] = j;//rand() % 1000;//000; 
      GY[i][j] = j;//rand() % 1000;//00; 
    }
  }
    
  //for(int i = 0; i < AMOUNT_OF_TEST; ++i){
    int i = 0;
    fpl_buffer_sobel(indata[i], outdata[i], GX[i], GY[i]);
  //}
}
