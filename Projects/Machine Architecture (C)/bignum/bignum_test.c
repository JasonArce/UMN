#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bignum_math.h"

int* perform_math(int* input1, int* input2, char op, int base);

int* subtract(int* input1, int* input2, int base) ;
int* add(int* input1, int* input2, int base);

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
/*
*	Helper for reversing the result that we built backward.
*  see add(...) below
*/


/*
* used to add two numbers with the same sign
* GIVEN FOR GUIDANCE
*/



/*
* TODO
* This function is where you will write the code that performs the heavy lifting,
* actually performing the calculations on input1 and input2.
* Return your result as an array of integers.
* HINT: For better code structure, use helper functions.
*/
int* perform_math(int* input1, int* input2, char op, int base) { /* perform_math performs math/uses operators for two numbers */

	/*
	 * this code initializes result to be large enough to hold all necessary digits.
	 * if you don't use all of its digits, just put a -1 at the end of the number.
	 * you may omit this result array and create your own.
     */

    int len1 = bignum_length(input1);
    int len2 = bignum_length(input2);
	int resultlength = ((len1 > len2)? len1 : len2) + 1;
	int* result = (int*) malloc (sizeof(int) * resultlength);

	if(op == '+') { /* if the '+' operator was the argument, add is called */
		return add(input1, input2, base);
	}
	if(op == '-') { /* if the '-' operator was the argument, subtract is called */
		return subtract(input1, input2, base);
	}
	if(op == '<'){	/* if the '<' operator was the argument, the following if statement is executed */
												/* do we need '<=' or '>=' ? */
		if(input1 == input2){ /* checks if the two arrays are identical and returns false */
			printf("%s", "input1 is not less than input2, but because an int must be returned, 0 will be returned");
			return 0;
		}
		if(bignum_length(input1) < bignum_length(input2)){ /* checks if input1 length is less than input2 length and returns true */
			return input1;
		}
		if(bignum_length(input1) > bignum_length(input2)){ /* checks if input1 length is greater than input2 length which would return false */
			return input2;
		}
		if(bignum_length(input1) == bignum_length(input2)){ /* checks if the two inputs are of same length */
			int len1 = bignum_length(input1);
			int len2 = bignum_length(input2);
			int sign = input1[len1];
		  int num1, num2;
			len1--;
			len2--;

			for(int i = 0; i<len1; i++){ /* starting from the beginning of the two inputs, if the first digit in input1
				 															is less than the same digit spot in input2, then input1 is less than input2 (returns true)*/
				if(input1[i]<input2[i]){
					return input1;
				}
				if(input1[i]>input2[i]){ /* starting from the beginning of the two inputs, if the first digit in input1
					 															is more than the same digit spot in input2, then input1 is more than input2 (returns false)*/
					return input2;
				}
			}
		}
	}
	if(op == '>'){ /* if the '<' operator was the argument, the following if statement is executed */
		if(input1 == input2){ /* if the two arrays are identical then return false */
			printf("%s", "input1 is not greater than input2, but because an int must be returned, 0 will be returned");
			return 0;
		}
		if(bignum_length(input1) > bignum_length(input2)){ /* checks if input1 length is less than input2 length and returns true */
			return input1;
		}
		if(bignum_length(input1) < bignum_length(input2)){ /* checks if input1 length is less than input2 length and returns false */
			return input2;
		}
		if(bignum_length(input1) == bignum_length(input2)){ /* checks if input1 length is equal to the input2 length */
			int len1 = bignum_length(input1);
			int len2 = bignum_length(input2);
			int sign = input1[len1];
			int num1, num2;
			len1--;
			len2--;

			for(int i = 0; i<len1; i++){
				if(input1[i]>input2[i]){  /* starting from the beginning of the two inputs, if the first digit in input1
					 															is more than the same digit spot in input2, then input1 is more than input2 (returns true)*/
					return input1;
				}
				if(input1[i]<input2[i]){ /* starting from the beginning of the two inputs, if the first digit in input1
					 															is less than the same digit spot in input2, then input1 is less than input2 (returns false)*/
					return input2;
				}
			}
		}
	}
	if(op == '='){ /* if the '=' operator was the argument, the following if statement is executed */
		if(input1 == input2){ /* if the two arrays are identical then return true */
			return input1;
		}
		if(bignum_length(input1) < bignum_length(input2)){  /* checks if input1 length is less than input2 length and returns false */
			printf("%s", "input1 is not equal to input2, but because an int must be returned, 0 will be returned");
			return 0;
		}
		if(bignum_length(input1) > bignum_length(input2)){  /* checks if input1 length is greater than input2 length and returns false */
			printf("%s", "input1 is not equal to input2, but because an int must be returned, 0 will be returned");
			return 0;
		}
		if(bignum_length(input1) == bignum_length(input2)){ /* checks if input1 length is equal to the input2 length */
			int len1 = bignum_length(input1);
			int len2 = bignum_length(input2);
			int sign = input1[len1];
			int num1, num2;
			len1--;
			len2--;

			for(int i = 0; i<len1; i++){ /* This for loop starts from the beginning of the two inputs, if the first digit in input1
																			is more than the same digit spot in input2, or the digit is less than the same digit
																			in the same digit spot, then false is returned */
				if(input1[i]<input2[i]){
					printf("%s", "input1 is not equal to input2, but because an int must be returned, 0 will be returned");
					return 0;
				}
				if(input1[i]>input2[i]){
					printf("%s", "input1 is not equal to input2, but because an int must be returned, 0 will be returned");
					return 0;
				}
			}
			return input1; /* since the for loop is completed, then the two inputs must be the same */
		}
	}
	return 0;
}

int* add(int* input1, int* input2, int base) {
	int len1 = bignum_length(input1);
	int len2 = bignum_length(input2);
	int resultlength = ((len1 > len2)? len1 : len2) + 2;
	int* result = (int*) malloc (sizeof(int) * resultlength);
	int r = 0;
	int carry = 0;
	int sign = input1[len1];
    int num1, num2;

	len1--;
	len2--;

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
		result[r] = (num1 + num2 + carry) % base;
		carry = (num1 + num2 + carry) / base;
		len1--;
		len2--;
		r++;
	}
	if (carry > 0) {
        result[r] = carry;
        r++;
    }
	result[r] = sign;
	reverse(result);
	return result;
}

int* subtract(int* input1, int* input2, int base) { /* similar structure to the add function */
	int len1 = bignum_length(input1);
	int len2 = bignum_length(input2);
	int resultlength = ((len1 > len2)? len1 : len2) + 2;
	int* result = (int*) malloc (sizeof(int) * resultlength);
	int r = 0;
	int carry = 0;
	int sign = input1[len1];
  int num1, num2;
	bool swapped = false;
	int* inputswap;
	int lenswap;

	len1--;
	len2--; 														/* == input1 over true */


	if(perform_math(input1,input2,'<',base) == input1){ /* calls perform_math to see if input1 is less than input2,
		 																								if it is then we swap the values. */

		inputswap = input1;
		input1 = input2;
		input2 = inputswap;

		lenswap = len1;
		len1 = len2;
		len2 = lenswap;

		swapped = true;
	}
	while (len1 >= 0 || len2 >= 0) { /* while loop that is nearly identical to the add function */
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
		if((num1 - carry) >= num2){
			result[r] = (num1 - num2 - carry) % base;
			carry=0;
		}
		else{
			result[r] = (base+num1-num2-carry) % base;
			carry=1;
		}
		len1--;
		len2--;
		r++;
	}
	if (carry > 0) { /* this if statement is also identical to the add function */
        result[r] = carry;
        r++;
    }
	result[r] = sign;
	if(swapped==true){ /* since the values have been swapped we print out a '-' to show
											that the value would be negative */
		result[r] = -36;
	}
	else{
		result[r] = -1;
	}
	reverse(result);
	return result;
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
    printf("%s", " -");
  }

  for(int j=checker; j<i; j++){ /* iterates through int list */


  if(num[j]<10){ /* if the int at num[j] is less than 10, just print it out */
    printf("%d",num[j]);
    }
  else{ /* since it's greater than 9 a letter will be returned */
    total=num[j]-10;
    result = total+'a';
    printf("%c",result);
     }
   }
   printf("\n");
}

int main(){
  int a[] = {8,-1};
  int b[] = {2,0,-1};
  int c = 10;
	//int* answer = subtract(a,b,c);
	int* answer = perform_math(a,b,'-',c);
	bignum_print(answer);
  exit (0);
}
