PROC IML;

/* 
INTRODUCTION
================================
Created by:		Wickus Bester

Date created: 	28/09/2020

Purpose: 	 	Approximate roots in R^2 using the Newton method

Inputs:			Initial vector with two rows containing a and b
				Tolerance tol and max number of iterations allowed n
				Also define necessary functions
				
Instructions:	1 - Define the functions f(x) and g(x), and all their first partial derivatives (to use in the Jacobian matrix)
				2 - Fill in the initial values


 */


/* FUNCTIONS AND INITIAL VALUES */
/* Functions */
proc iml;
start f(x1,x2);
return 8#x1##3+x2-1;
finish f;

start g(x1,x2);
return 6#x2##3-9#x1-1;
finish g;

start fx(x1,x2);
return 24#x1##2;
finish fx;

start fy(x1,x2);
return 1;
finish fy;

start gx(x1,x2);
return -9;
finish gx;

start gy(x1,x2);
return 18#x2##2;
finish gy;

/* Define initial values */
a = 0;
b = 0;
n = 50;
tol = 0.00001;

start NewtonLE(a,b,tol,n);
i = 1;
print "Iteration number" i;

sol1 = a//b;
print sol1;

f = f(a,b)//g(a,b);
print f;

jacobian = ((fx(a,b)||fy(a,b))//(gx(a,b)||gy(a,b)));
print jacobian;

inverse_jac = inv(jacobian);
print inverse_jac;

sol2 = sol1 - inv(jacobian)*f;
print sol2;

x_err = a - sol2[1,];
y_err = b - sol2[2,];
Error = x_err // y_err;
print Error;

/* Do using tolerance */
i = i+1;

do while (abs(x_err) > tol && abs(y_err) > tol && i <=n);
a = sol2[1,];
b = sol2[2,];

print "Iteration number" i;

sol1 = a//b;
print sol1;

f = f(a,b)//g(a,b);
print f;

jacobian = ((fx(a,b)||fy(a,b))//(gx(a,b)||gy(a,b)));
print jacobian;

inverse_jac = inv(jacobian);
print inverse_jac;

sol2 = sol1 - inv(jacobian)*f;
print sol2;

x_err = a - sol2[1,];
y_err = b - sol2[2,];
Error = x_err // y_err;
print Error;

i = i + 1;
end;

return 0;
finish NewtonLE;

temp = NewtonLE(a,b,tol,n);