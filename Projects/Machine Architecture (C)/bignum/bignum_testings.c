#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bignum_math.h"

int bignum_length(int* num) {
	int len = 0;
	while(num[len] >= 0) { len++; }
	return len;
}

void reverse(int* num) {
	int i, len = bignum_length(num);
	for(i = 0; i < len/2; i++) {
		int temp = num[i];
		num[i] = num[len-i-1];
		num[len-i-1] = temp;
	}
}
int* perform_math(int* input1, int* input2, char op, int base) {

	/*
	 * this code initializes result to be large enough to hold all necessary digits.
	 * if you don't use all of its digits, just put a -1 at the end of the number.
	 * you may omit this result array and create your own.
     */

    int len1 = bignum_length(input1);
    int len2 = bignum_length(input2);
	int resultlength = ((len1 > len2)? len1 : len2) + 1;
	int* result = (int*) malloc (sizeof(int) * resultlength);

  if(op == '-') {
		return subtract(input1, input2, base);
	}

if(op == '<'){					/* do we need '<=' or '>=' ? */
  if(input1 == input2){
    return false;
  }
  if(bignum_length(input1) < bignum_length(input2)){
    return true;
  }
  if(bignum_length(input1) > bignum_length(input2)){
    return false;
  }
  if(bignum_length(input1) == bignum_length(input2)){
    int len1 = bignum_length(input1);
    int len2 = bignum_length(input2);
    int sign = input1[len1];
    int num1, num2;
    len1--;
    len2--;

    for(int i = 0; i<len1; i++){
      if(input1[i]<input2[i]){
        return true;
      }
      if(input1[i]>input2[i]){
        return false;
      }
    }
  }
}
if(op == '>'){
  if(input1 == input2){
    return false;
  }
  if(bignum_length(input1) > bignum_length(input2)){
    return true;
  }
  if(bignum_length(input1) < bignum_length(input2)){
    return false;
  }
  if(bignum_length(input1) == bignum_length(input2)){
    int len1 = bignum_length(input1);
    int len2 = bignum_length(input2);
    int sign = input1[len1];
    int num1, num2;
    len1--;
    len2--;

    for(int i = 0; i<len1; i++){
      if(input1[i]>input2[i]){
        return true;
      }
      if(input1[i]<input2[i]){
        return false;
      }
    }
  }
}
if(op == '='){
  if(input1 == input2){
    return true;
  }
  if(bignum_length(input1) < bignum_length(input2)){
    return false;
  }
  if(bignum_length(input1) > bignum_length(input2)){
    return false;
  }
  if(bignum_length(input1) == bignum_length(input2)){
    int len1 = bignum_length(input1);
    int len2 = bignum_length(input2);
    int sign = input1[len1];
    int num1, num2;
    len1--;
    len2--;

    for(int i = 0; i<len1; i++){
      if(input1[i]<input2[i]){
        return false;
      }
      if(input1[i]>input2[i]){
        return false;
      }
    }
    return true;
  }
}
}


int* subtract(int* input1, int* input2, int base) {
	int len1 = bignum_length(input1);
	int len2 = bignum_length(input2);
	int resultlength = ((len1 > len2)? len1 : len2) + 2;
	int* result = (int*) malloc (sizeof(int) * resultlength);
	int r = 0;
	int carry = 0;
	int sign = input1[len1];
  int num1, num2;
	bool swapped = false;

	len1--;
	len2--;

	if(perform_math(input1,input2,'<',base) == true){
		swapped = true;
	}

	while (len1 >= 0 || len2 >= 0) {
        if (len1 >= 0) {
            num1 = input1[len1];
        } else {
            num1 = 0;
        }

        if (len2 >= 0) {
            num2 = input2[len2];
        } else {
            num2 = 0;
        }
		result[r] = abs((num1 - num2 - carry) % base);
		carry = abs((num1 - num2 - carry) / base);
		len1--;
		len2--;
		r++;
	}
	if (carry > 0) {
        result[r] = carry;
        r++;
    }
	result[r] = sign;
	if(swapped==true){
		reverse(result);
    printf("%c",'-');
    return result;
	}
	reverse(result);
	return result;
}

int main(){
  int a[] = {6,6,5,-1};
  int b[] = {2,0,0,-1};
  int c = 10;
	int* answer = perform_math(a,b,'-',c); /* why: error: conflicting types for 'subtract' */
  for(int i = 0; i <bignum_length(answer); i++){
		printf("%d",answer[i]);
	}
  printf("\n");
  exit (0);
}
