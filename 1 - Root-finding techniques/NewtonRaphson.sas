PROC IML;

/* 
INTRODUCTION
================================
Created by:		Wickus Bester

Date created: 	8/09/2020

Purpose: 	 	Approximate a single root of a function using the Newton-Raphson method

Inputs:			Initial value x0
				Tolerance tol OR max number of iterations n
				Initial width wid (to graph the function)
				Also define necessary function(s)
				
Instructions:	1 - Define the function f(x) as desired and then fprime(x), the first derivative of f(x)
				2 - Fill in the initial values


 */


/* FUNCTIONS AND INITIAL VALUES */
/* Functions */
start f(x);
out = 4 - x##2;
return out;
finish f;

start fprime(x);
out = -2#x;
return out;
finish fprime;

/* Initial values */
x0=3;
tol = 0.00001;
n = 50;
i = 0;
wid = 5;


/* Graph the function */
left = x0-wid;
right = x0+wid;
dx = do(left,right,0.1);
y = f(dx);
title "The function f(x) on specified interval";
call Series(dx,y) grid={X Y} xvalues=left:right other="refline 0 / axis=y";

/* Define the NR Method */
START NewtonRaphson(x0,e,n);

fn = f(x0);                     /* We define the needed values for the first iteration of Newton's method */
i=1;
xnext = x0 - fn/fprime(x0);
fnext = f(xnext);
error = fnext;

matrix_newton = j(1,5);         /* We create a 1x4 matrix, representing the first row in the eventual table */
matrix_newton[1,1] = i;
matrix_newton[1,2] = x0;
matrix_newton[1,3] = xnext;
matrix_newton[1,4] = fnext;
matrix_newton[1,5] = error;

DO WHILE(abs(fnext)>e && i<n); /* Stop when f(x) < e or when max iterations reached*/

i = i + 1;                      /* We define the needed values for the ith iteration of Newton's method */
x0 = xnext;
fn = f(xnext);
xnext = x0 - fn/fprime(x0);
fnext = f(xnext);
error = fnext;

temp = j(1,5);                 /* We create a 1x4 matrix, representing the ith row in the table */
temp[1,1] = i;
temp[1,2] = x0;
temp[1,3] = xnext;
temp[1,4] = fnext;
temp[1,5] = error;
matrix_newton=insert(matrix_newton, temp, i);   /* We insert the created row into the matrix that represents the table for now */
END;

title "NEWTON-RAPHSON METHOD WITH INITIAL VALUE X0";

iterations = i;
approximate_root = xnext;
max_error = fnext;
print iterations;
print approximate_root;
print max_error;

colnames = {"i" "x_i" "x_i+1" "f(x_i+1)" "Error"};
tbl_newton = TableCreate(colnames, matrix_newton);   /* Creating the table using the column-names above, and the accumulated matrix through the i iterations */

call TablePrint(tbl_newton) label="Testing the Newton-Raphson Method"  /* Printing the created table */
							 firstobs=1 numobs=i
							 var=colnames
							 ID="i";


RETURN 0;

FINISH NewtonRaphson;


/* APPLYING NEWTON'S METHOD TO FIND A SINGLE ROOT */
temp = NewtonRaphson(x0,tol,n);