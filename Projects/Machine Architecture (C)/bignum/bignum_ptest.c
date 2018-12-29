#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bignum_math.h"

int bignum_length(int* num) {
	int len = 0;
	while(num[len] >= 0) { len++; }
	return len;
}

void bignum_print(int* num) {	 /* prints the base representation of the numbers in the array */
  int i;
  int total = 0;
  int count = 1;
  char result;
  if(num == NULL) { return; }

  i = bignum_length(num);

  int checker = 0;
  while(num[checker]==0){
    checker++;
  }

  if(num[i]== (-36)){
    printf("%s ", " - ");
  }

  for(int j=checker; j<i; j++){ /* iterates through int list */


  if(num[j]<10){ /* if the int at num[j] is less than 10, just print it out */
    printf("%d ",num[j]);
    }
  else{ /* since it's greater than 9 a letter will be returned */
    total=num[j]-10;
    result = total+'a';
    printf("%c ",result);
     }
   }
   printf("\n");
}

int main(){
  int a[] = {0,0,12,23,25,-36};
	bignum_print(a);
}
