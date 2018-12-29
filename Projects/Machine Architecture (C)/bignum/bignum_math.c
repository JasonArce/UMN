
/**************************
 * bignum_math.c -- an outline for CLab1
 *
 * orginially written by Andy Exley
 * modified by Emery Mizero
 **************************/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bignum_math.h"

// Method declarations
int* perform_math(int* input1, int* input2, char op, int base);


/*
 * Returns true if the given char is a digit from 0 to 9
 */
bool is_digit(char c) {
	return c >= '0' && c <= '9';
}

/*
 * Returns true if lower alphabetic character
 */
bool is_lower_alphabetic(char c) {
	return c >= 'a' && c <= 'z';
}

/*
 * Returns true if upper alphabetic character
 */
bool is_upper_alphabetic(char c) {
	return c >= 'A' && c <= 'Z';
}

/*
 * Convert a string to an integer
 * returns 0 if it cannot be converted.
 */
int string_to_integer(char* input) {
	int result = 0;
	int length = strlen(input);
    int num_digits = length;
	int sign = 1;

	int i = 0;
    int factor = 1;

    if (input[0] == '-') {
		num_digits--;
		sign = -1;
    }

	for (i = 0; i < num_digits; i++, length--) {
		if (!is_digit(input[length-1])) {
			return 0;
		}
		if (i > 0) factor*=10;
		result += (input[length-1] - '0') * factor;
	}

    return sign * result;
}

/*
 * Returns true if the given base is valid.
 * that is: integers between 2 and 36
 */
bool valid_base(int base) {
	if(!(base >= 2 && base <= 36)) {
		return false;
	}
	return true;
}

/*
 * TODO
 * Returns true if the given string (char array) is a valid input,
 * that is: digits 0-9, letters A-Z, a-z
 * and it should not violate the given base and should not handle negative numbers
 */
 bool valid_input(char* input, int base) { /* checks to see if at the base argument, if the input is valid or not */
 	if(input[0]== '-'){ /* if the input is negative, then return false */
 		return false;
 	}
 	if(base>=2 && base<=10){ /* if the base is greater than 2 and less than 10
															then the function checks for input with values between 0 and x
															where x is the base (less than 10). */
 		for(int i = 0; i<strlen(input);i++){
 			if(input[i]<'0' || input[i]>= ('0'+base-1) ){ /* checks if the input is outside of the 0 to 9 range */
 				return false;
 			}
 		}
 	}
 	if(base>=11 && base<=36 ){ /* if the base is greater than 11 and less than 36 then we are dealing with alphabetical values.
		 														The function checks for input between 0 and x where x is the base (less than 'Z' or 'z')*/
 		for(int j = 0; j<strlen(input);j++){
 			if((input[j]<'0' || input[j]>'9') && (input[j]<'A'|| input[j]>(base-10+'A')) && (input[j]<'a' || input[j]>(base-10+'a'))){
				/* The above if statement checks for the same condition as the earlier if statement (between 0 to 9) and also if it
				 	 is between 'A' and 'Z' or 'a' and 'z' */
				return false;
 			}
 		}

 	}
 	return true;
 }

/*
 * converts from an array of characters (string) to an array of integers
 */
int* string_to_integer_array(char* str) {
	int* result;
	int i, str_offset = 0;
		result = malloc((strlen(str) + 1) * sizeof(int));
		result[strlen(str)] = -1;
	for(i = str_offset; str[i] != '\0'; i++) {
		if(is_digit(str[i])) {
			result[i - str_offset] = str[i] - '0';
		} else if (is_lower_alphabetic(str[i])) {
			result[i - str_offset] = str[i] - 'a' + 10;
		} else if (is_upper_alphabetic(str[i])) {
			result[i - str_offset] = str[i] - 'A' + 10;
		} else {
			printf("I don't know how got to this point!\n");
		}
	}
	return result;
}

/*
 * finds the length of a bignum...
 * simply traverses the bignum until a negative number is found.
 */
int bignum_length(int* num) {
	int len = 0;
	while(num[len] >= 0) { len++; }
	return len;
}

/*
 * TODO
 * Prints out a bignum using digits and lower-case characters
 * Current behavior: prints integers
 * Expected behavior: prints characters
 */
 void bignum_print(int* num) {	 /* prints the base representation of the numbers in the array */
   int i;
   int total = 0;
   int count = 1;
   char result;
   if(num == NULL) { return; }

   i = bignum_length(num);

   int checker = 0;
   while(num[checker]==0){ //gets rid of leading zeros
     checker++;
   }

   if(num[i]== (-36)){ //this is where you add the negative sign, the value returned is negative
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

/*
 *	Helper for reversing the result that we built backward.
 *  see add(...) below
 */
void reverse(int* num) {
	int i, len = bignum_length(num);
	for(i = 0; i < len/2; i++) {
		int temp = num[i];
		num[i] = num[len-i-1];
		num[len-i-1] = temp;
	}
}


/*
 * used to add two numbers with the same sign
 * GIVEN FOR GUIDANCE
 */
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
	bool whatisit; //variable used to determine if input1 is less than input2 or not

	len1--;
	len2--;

		if(input1 == input2){ /* checks if the two arrays are identical and returns false */
			whatisit=false;
		}
		if(bignum_length(input1) < bignum_length(input2)){ /* checks if input1 length is less than input2 length and returns true */
			whatisit=true;
		}
		if(bignum_length(input1) > bignum_length(input2)){ /* checks if input1 length is greater than input2 length which would return false */
			whatisit=false;
		}
		if(bignum_length(input1) == bignum_length(input2)){ /* checks if the two inputs are of same length */
			int len1 = bignum_length(input1);
			int len2 = bignum_length(input2);
			int num1, num2;

			for(int i = 0; i<len1; i++){ /* starting from the beginning of the two inputs, if the first digit in input1
																			is less than the same digit spot in input2, then input1 is less than input2 (returns true)*/
				if(input1[i]<input2[i]){
					whatisit=true;
				}
				if(input1[i]>input2[i]){ /* starting from the beginning of the two inputs, if the first digit in input1
																				is more than the same digit spot in input2, then input1 is more than input2 (returns false)*/
					whatisit=false;
				}
			}
		}



	if(whatisit == true){ /* calls perform_math to see if input1 is less than input2,
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
		if((num1 - carry) >= num2){ //determines if there should be a carry. Simulates subtraction on paper.
			result[r] = (num1 - num2 - carry) % base;
			carry=0;
		}
		else{ //determines if there should be no carry. Similar to subtraction on paper.
			result[r] = (base+num1-num2-carry) % base;
			carry=1;
		}
		len1--;
		len2--;
		r++;
	}

	if(swapped==true){ /* -36 is simply a place holder for a - symbol as -36 cannot be inputted */
		result[r] = -36;
	}
	else{ // -1 will terminate the subtract
		result[r] = -1;
	}
	reverse(result);
	return result;
}


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
			printf("%s", "Result: false"); //these print cases represent the boolean type that the format demands.
			printf("\n");
			exit (0);
		}
		if(bignum_length(input1) < bignum_length(input2)){ /* checks if input1 length is less than input2 length and returns true */
			printf("%s", "Result: true");
			printf("\n");
			exit (0);
		}
		if(bignum_length(input1) > bignum_length(input2)){ /* checks if input1 length is greater than input2 length which would return false */
			printf("%s", "Result: false");
			printf("\n");
			exit (0);
		}
		if(bignum_length(input1) == bignum_length(input2)){ /* checks if the two inputs are of same length */
			int len1 = bignum_length(input1);
			int len2 = bignum_length(input2);
			int sign = input1[len1];
		  int num1, num2;

			for(int i = 0; i<len1; i++){ /* starting from the beginning of the two inputs, if the first digit in input1
				 															is less than the same digit spot in input2, then input1 is less than input2 (returns true)*/
				if(input1[i]<input2[i]){
					printf("%s", "Result: true");
					printf("\n");
					exit (0);
				}
				if(input1[i]>input2[i]){ /* starting from the beginning of the two inputs, if the first digit in input1
					 															is more than the same digit spot in input2, then input1 is more than input2 (returns false)*/
					printf("%s", "Result: false");
					printf("\n");
					exit (0);
				}
			}
		}
		printf("%s","Result: false");  // if the two numbers are the same then this case will be reached.
		printf("\n");
		exit(0);
	}
	if(op == '>'){ /* if the '<' operator was the argument, the following if statement is executed */
		if(input1 == input2){ /* if the two arrays are identical then return false */
			printf("%s", "Result: false");
			printf("\n");
			exit (0);
		}
		if(bignum_length(input1) > bignum_length(input2)){ /* checks if input1 length is less than input2 length and returns true */
			printf("%s", "Result: true");
			printf("\n");
			exit (0);
		}
		if(bignum_length(input1) < bignum_length(input2)){ /* checks if input1 length is less than input2 length and returns false */
			printf("%s", "Result: false");
			printf("\n");
			exit (0);
		}
		if(bignum_length(input1) == bignum_length(input2)){ /* checks if input1 length is equal to the input2 length */
			int len1 = bignum_length(input1);
			int len2 = bignum_length(input2);
			int sign = input1[len1];
			int num1, num2;

			for(int i = 0; i<len1; i++){
				if(input1[i]>input2[i]){  /* starting from the beginning of the two inputs, if the first digit in input1
					 															is more than the same digit spot in input2, then input1 is more than input2 (returns true)*/
					printf("%s", "Result: true");
					printf("\n");
					exit (0);
				}
				if(input1[i]<input2[i]){ /* starting from the beginning of the two inputs, if the first digit in input1
					 															is less than the same digit spot in input2, then input1 is less than input2 (returns false)*/
					printf("%s", "Result: false");
					printf("\n");
					exit (0);
				}
			}
		}
		printf("%s","Result: false"); // if the two numbers are the same then this case will be reached.
		printf("\n");
		exit(0);
	}
	if(op == '='){ /* if the '=' operator was the argument, the following if statement is executed */
		if(input1 == input2){ /* if the two arrays are identical then return true */
			printf("%s", "Result: true");
			printf("\n");
			exit (0);
		}
		if(bignum_length(input1) < bignum_length(input2)){  /* checks if input1 length is less than input2 length and returns false */
			printf("%s", "Result: false");
			printf("\n");
			exit (0);
		}
		if(bignum_length(input1) > bignum_length(input2)){  /* checks if input1 length is greater than input2 length and returns false */
			printf("%s", "Result: false");
			printf("\n");
			exit (0);
		}
		if(bignum_length(input1) == bignum_length(input2)){ /* checks if input1 length is equal to the input2 length */
			int len1 = bignum_length(input1);
			int len2 = bignum_length(input2);
			int sign = input1[len1];
			int num1, num2;
	

			for(int i = 0; i<len1; i++){ /* This for loop starts from the beginning of the two inputs, if the first digit in input1
																			is more than the same digit spot in input2, or the digit is less than the same digit
																			in the same digit spot, then false is returned */
				if(input1[i]<input2[i]){
					printf("%s", "Result: false");
					printf("\n");
					exit (0);
				}
				if(input1[i]>input2[i]){
					printf("%s", "Result: false");
					printf("\n");
					exit (0);
				}
			}
			printf("%s", "Result: true");
			printf("\n");
			exit (0); /* since the for loop is completed, then the two inputs must be the same */
		}
	}
	return 0;
}

/*
 * Print to "stderr" and exit program
 */
void print_usage(char* name) {
	fprintf(stderr, "----------------------------------------------------\n");
	fprintf(stderr, "Usage: %s base input1 operation input2\n", name);
	fprintf(stderr, "base must be number between 2 and 36, inclusive\n");
	fprintf(stderr, "input1 and input2 are arbitrary-length integers\n");
	fprintf(stderr, "Two operations are allowed '+' and '-'\n");
	fprintf(stderr, "----------------------------------------------------\n");
	exit(1);
}


/*
 * MAIN: Run the program and tests your functions.
 * sample command: ./bignum 4 12 + 13
 * Result: 31
 */
int main(int argc, char** argv) {

	int input_base;

    int* input1;
    int* input2;
    int* result;

	if(argc != 5) {
		print_usage(argv[0]);
	}

	input_base = string_to_integer(argv[1]);

	if(!valid_base(input_base)) {
		fprintf(stderr, "Invalid base: %s\n", argv[1]);
		print_usage(argv[0]);
	}


	if(!valid_input(argv[2], input_base)) {
		fprintf(stderr, "Invalid input1: %s\n", argv[2]);
		print_usage(argv[0]);
	}

	if(!valid_input(argv[4], input_base)) {
		fprintf(stderr, "Invalid input2: %s\n", argv[4]);
		print_usage(argv[0]);
	}

        char op = argv[3][0];
	if(op != '-' && op != '+' && op != '<' && op != '>' && op != '=') {
		fprintf(stderr, "Invalid operation: %s\n", argv[3]);
		print_usage(argv[0]);
	}

	input1 = string_to_integer_array(argv[2]);
    input2 = string_to_integer_array(argv[4]);

    result = perform_math(input1, input2, argv[3][0], input_base);

    printf("Result: ");
    bignum_print(result);
	printf("\n");

	exit(0);
}
