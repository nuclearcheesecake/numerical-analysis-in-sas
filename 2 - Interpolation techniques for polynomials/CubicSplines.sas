PROC IML;

/* 
INTRODUCTION
================================
Created by:		Wickus Bester

Date created: 	11/10/2020

Purpose: 	 	Find the cubic splines of a data set, and approximate a value

Inputs:			x_values  = a list of x values - with two conditions: sorted in increasing order, and with NO repetitions (both conditions are NB!!)
				y_values  = a list of y values corresponding to given x values
				x         = the point to evaluate the interpolating polynomial at
				
Instructions:	1 - Define the data points (sorted in increasing order by x values) and specify the value at which you want to find the approximate function value
				2 - The output will display the coefficients of the linear equation, and the value of the function according to the interpolation
					* If "value_on_spline_i" displays a period, the value does not fall on that spline
					* If it displays a value, that is the interpolated value at the point

*/

/* INPUT - Define the data points */
x_values = {5 7 9};
y_values = {5 2 4};
x = 9;

/* Finding coefficients for the spline formulas */
n = ncol(x_values);
T = j(n,8, .);
numerate = do(0,n-1,1);
T[,1] = t(numerate);
T[,2] = t(x_values);
T[,3] = t(y_values);

/* Column for A values*/
T[,4] = t(y_values);

/* Column for H values*/
do i=1 to n-1;
T[i,5] = T[i+1,2] - T[i,2];
end;

/* Column for C values*/
Table2 = j(n,1);
Table2[1,] = 0;
Table2[n,] = 0;
DO w=2 to n-1;
Table2[w,] = 3#(((y_values[w+1]-y_values[w])/(x_values[w+1]-x_values[w])) - ((y_values[w]-y_values[w-1])/(x_values[w]-x_values[w-1])));
END;

Table1 = j(n,n,0);
Table1[1,1] = 1;
Table1[n,n] = 1;
DO p=2 to n-1;
Table1[p,p-1] = T[p-1,5];
Table1[p,p] = 2#(T[p-1,5] + T[p,5]);
Table1[p,p+1] = T[p,5];
END;

sol = inv(Table1) * Table2;
T[,6] = sol;

/* Column for B values*/
do m=1 to n-1;
T[m,7] = (T[m+1,4] - T[m,4])/(T[m,5]) - ((T[m,5])/3)#(2#T[m,6] + T[m+1,6]);
end;

/* Column for D values*/
do n=1 to n-1;
T[n,8] = (T[n+1,6] - T[n,6])/(3#T[n,5]);
end;

/* Create the table */

title "Table to find coefficients, and then a spline evaluated at x";


colnames = {"i" "x" "f(x)" "a_i" "h_i" "c_i" "b_i" "d_i"};
tbl_coeffs = TableCreate(colnames, T);   /* Creating the table using the column-names above, and the accumulated matrix through the i iterations */

call TablePrint(tbl_coeffs) label="Finding the coefficients of the spline formulas"  /* Printing the created table */
							 firstobs=1 numobs=n
							 var=colnames
							 ID="i";
							 
							 
/* Evaluating the spline at the point x */
do s=1 to n-1;
if (x >= T[s,2] && x <= T[s+1,2]) then n=s;
end;

point = T[n,4] + T[n,7]#(x-x_values[n]) + T[n,6]#((x-x_values[n])##2) + T[n,8]#((x-x_values[n])##3);
print "Function evaluated on the spline is: " point;