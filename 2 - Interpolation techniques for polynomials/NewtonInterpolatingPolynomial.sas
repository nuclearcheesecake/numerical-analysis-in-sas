PROC IML;

/* 
INTRODUCTION
================================
Created by:		Wickus Bester

Date created: 	06/10/2020

Purpose: 	 	Approximate a function value using a Newton interpolating polynomial

Inputs:			vec_x  = a list of x values 
				vec_y  = a list of y values corresponding to given x values
				x      = the point to evaluate the interpolating polynomial at
				
Instructions:	1 - Supply all INPUTS (do not change any other part of the code)
				[For vec_y, there are two possible ways of obtaining a list
				(1.) If points (xi,yi) are given, use the list as below with correct corresponding values
				(2.) If a function is given along with specified x values, define vec_y as follows:
						vec_y = f(x)		where f is a module containing the equation given - thus create f first]

*/

/* INPUT - Define the data points */
vec_x = {2 2.75 4};
vec_y = {0.5 0.3636363636363636 0.25};
x=3;


/* Creating the divided difference table */
n = ncol(vec_x);
divided_differences=j(n, n+1, .);
divided_differences[,1] = t(vec_x);
divided_differences[,2] = t(vec_y);

m = 1;

/* OUTER LOOP */
DO j=3 to n+1;

/* INNER LOOP */
DO i=j-1 to n;
divided_differences[i,j] = (divided_differences[i,j-1] - divided_differences[i-1,j-1])/(divided_differences[i,1] - divided_differences[i-m,1]);
END;
/* INNER LOOP */

m = m + 1;

END;
/* OUTER LOOP */

print divided_differences;


/* Applying the table to the Newton equation, evaluating at the point x */
v = x - vec_x;
Newton_polynomial_evaluated_at_x = divided_differences[1,2];

do k=1 to n-1;
Newton_polynomial_evaluated_at_x = Newton_polynomial_evaluated_at_x + divided_differences[k+1,k+2]#(v[1:k][#]);
end;
print Newton_polynomial_evaluated_at_x;