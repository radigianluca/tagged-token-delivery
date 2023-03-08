
#include <stdlib.h>
#include "mergeOper.h"

#define AMOUNT_OF_TEST 1

// https://www.geeksforgeeks.org/merge-sort/

int mergeOper (in_int_t left, in_int_t mid, in_int_t right, in_int_t array_in[N], inout_int_t half_one[HALF], inout_int_t half_two[HALF]) {
	//int subArrayOne = mid - left + 1;
   // int subArrayTwo = right - mid;
  
    // Create temp arrays
    //auto *leftArray = new int[subArrayOne],
    //   *rightArray = new int[subArrayTwo];
  
	//int leftArray[HALF];
	//int rightArray[HALF];
    // Copy data to temp arrays leftArray[] and rightArray[]
    for (auto i = 0; i < HALF; i++)
        half_one[i] = array_in[left + i];
    for (auto j = 0; j < HALF; j++)
        half_two[j] = array_in[mid + 1 + j];
  
    //int indexOfSubArrayOne = 0, // Initial index of first sub-array
    int indexOfSubArrayTwo = 0; // Initial index of second sub-array
    int indexOfMergedArray = left; // Initial index of merged array
  
    // Merge the temp arrays back into array[left..right]
   /* while (indexOfSubArrayOne < subArrayOne && indexOfSubArrayTwo < subArrayTwo) {
        if (leftArray[indexOfSubArrayOne] <= rightArray[indexOfSubArrayTwo]) {
            array[indexOfMergedArray] = leftArray[indexOfSubArrayOne];
            indexOfSubArrayOne++;
        }
        else {
            array[indexOfMergedArray] = rightArray[indexOfSubArrayTwo];
            indexOfSubArrayTwo++;
        }
        indexOfMergedArray++;
    }
    // Copy the remaining elements of
    // left[], if there are any
    while (indexOfSubArrayOne < subArrayOne) {
        array[indexOfMergedArray] = leftArray[indexOfSubArrayOne];
        indexOfSubArrayOne++;
        indexOfMergedArray++;
    }*/
    // Copy the remaining elements of
    // right[], if there are any
    while (indexOfSubArrayTwo < subArrayTwo) {
        //array_out[indexOfMergedArray] = rightArray[indexOfSubArrayTwo];
        indexOfSubArrayTwo++;
        indexOfMergedArray++;
    } 

	return indexOfMergedArray;
}

int main(void){
	in_int_t array[N];
	inout_int_t array_1[N];
	inout_int_t array_2[N];
	for(int i = 0; i < N; i++) {
		array[i] = i;
		array_1[i] = i;
		array_2[i] = i;
	} 
	mergeOper (0, 4, 8, array, array_1, array_2);
}
