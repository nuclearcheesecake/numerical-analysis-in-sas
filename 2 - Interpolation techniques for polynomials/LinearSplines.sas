PROC IML;

/* 
INTRODUCTION
================================
Created by:		Wickus Bester

Date created: 	11/10/2020

Purpose: 	 	Find the linear splines of a data set, and approximate a value

Inputs:			x_values  = a list of x values - sorted in increasing order (NB!!)
				y_values  = a list of y values corresponding to given x values
				x         = the point to evaluate the interpolating polynomial at
				
Instructions:	1 - Define the data points (sorted in increasing order by x values) and specify the value at which you want to find the approximate function value
				2 - The output will display the coefficients of the linear equation, and the value of the function according to the interpolation
					* If "value_on_spline_i" displays a period, the value does not fall on that spline
					* If it displays a value, that is the interpolated value at the point

*/

/* INPUT - Define the data points */
x_values = {4 7 8};
y_values = {10 19 12};
x = 5;

/* Creating the spline formulas */
n = ncol(x_values);
title "Linear Splines of given data";

do i=1 to n-1;
x_one = (y_values[i+1] - y_values[i])/(x_values[i+1] - x_values[i]);
constant = y_values[i] + x_one#(-1#x_values[i]);
s_num = i-1;
if (x >= x_values[i] && x <= x_values[i+1]) then value_on_spline_i = constant + x_one#x;
else value_on_spline_i = ".";
PRINT s_num "Coefficients: " x_one constant "Approximation: " value_on_spline_i;
END;

