/* Jason Arce
 * arcex012
 * File: shift.c
 *
 * Each matrix shift function must have a prototype of the form:
 * void matrix_shift(int M, int N, int A[M][N], int s, int E, int b);
 *
 */
#include <stdio.h>
#include "cachelab.h"

/*
 * matrix_shift_submit - This is the solution matrix shift function that you
 *     will be graded on for Part B of the lab submissions. Do not change
 *     the description string "Matrix shift submission", as the driver
 *     searches for that string to identify the matrix shift function to
 *     be graded.
 */
char matrix_shift_submit_desc[] = "Matrix shift submission";
void matrix_shift_submit(int M, int N, int A[M][N], int s, int E, int b)
{
/* For the for loops, having the outside loop is more efficient when using temp variables.
Inside the for loop, unrolling is done to make the loop more optimized 
*/
	int i, j, before_right, before;
	for (j=0;j<N;j+=2){ //we handle 2 indices in the array in the inside loop so j increments by 2. Where j is a counter for the number of columns.
		for(i=1;i<M;i++){ //for loop for the number of rows.
			before_right = A[i-1][j+1]; //set before_right to the previous row and one column to the right.
			before = A[i-1][j]; //set before to the previous row, same column.
			A[i-1][j] = A[i][j]; //the previous row at column j becomes the current row at column j.
			A[i-1][j+1] = A[i][j+1]; //the previous row at the index to the right becomes the current row at the index to the right.
			A[i][j+1] = before_right; //the current row at the index to the right becomes what was stored at the previous row at the index to the right.
			A[i][j] = before; // the current row at column j becomes the previous row at the column j.
		}
	}
}

/*
 * You can define additional matrix shift functions below. We've defined
 * a simple one below to help you get started.
 */

/*
 * matrix_shift - A simple matrix shift function, not optimized for the cache.
 */
char matrix_shift_function_desc1[] = "Matrix shift function 1";
void matrix_shift_function1(int M, int N, int A[M][N], int s, int E, int b)
{
    int i, j, temp;
    for (i = 1; i < M; i++)
    {
        for (j = 0; j < N; j++)
        {
            temp = A[i][j];
            A[i][j] = A[i-1][j];
            A[i-1][j] = temp;
        }
    }
}

/*
 * registerFunctions - This function registers your matrix shift
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     matrix shift strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerShiftFunction(matrix_shift_submit, matrix_shift_submit_desc);

    /* Register any additional matrix shift functions */
    registerShiftFunction(matrix_shift_function1, matrix_shift_function_desc1);
}
