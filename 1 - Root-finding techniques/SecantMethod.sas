PROC IML;

/* 
INTRODUCTION
================================
Created by:		Wickus Bester

Date created: 	18/09/2020

Purpose: 	 	Approximate a single root of a function using the Secant method

Inputs:			Initial range [p0,p1]
				Tolerance tol and max number of iterations n
				Also define necessary function(s)
				
Instructions:	1 - Define the function f(x) as desired
				2 - Fill in the initial values

 */


/* FUNCTIONS AND INITIAL VALUES */
/* Functions - h(x) being their intersection*/
start f(x);
c= 14.8#Exp(-x);
return c;
finish f;

start g(x);
out = x##3 + x + 5;
return out;
finish g;

start h(x);
out = f(x) - g(x);
return out;
finish h;


/* Intitial values */
p0 = -14.8;
p1 = 0;
n = 50;
tol = 0.0000001;

/* Graphing the function */
left = p0+12;             /* Values of left and right are adjusted to easier see specific root in example - take not that initial interval does not necessarily contain a root when using this method*/
right = p1+2;
x = do(left,right,0.1);
y = h(x);
title "The function h(x) on specified interval";
call Series(x,y) grid={X Y} xvalues=left:right other="refline 0 / axis=y";


/* Using the secant method on f given tolerance and max iterations */



start Secant(p0,p1,e,n);
i = 1;
q0 = h(p0);
q1 = h(p1);
p=p1-q1#(p1-p0)/(q1-q0);
error = p1-p0;

T=j(1,7);
T[1,1]=i;
T[1,2]=p0;
T[1,3]=p1;
T[1,4]=q0;
T[1,5]=q1;
T[1,6]=p;
T[1,7] = error;

DO WHILE (abs(error)>e && i<n);
p0=p1;
q0=q1;
p1=p;
q1=h(p);
error = p1-p0;
p=p1-q1#(p1-p0)/(q1-q0);

i=i+1;

Temp = j(1,7);
Temp[1,1]=i;
Temp[1,2]=p0;
Temp[1,3]=p1;
Temp[1,4]=q0;
Temp[1,5]=q1;
Temp[1,6]=p;
Temp[1,7] = error;
T=insert(T, Temp, i);
END;

iterations = i;
approximate_root = p;
max_error = error;
print iterations;
print approximate_root;
print max_error;


colnames = {"i" "pn" "pn+1" "h(pn)" "h(pn+1)" "New p" "Error"};
tbl_secant = TableCreate(colnames, T);

call TablePrint(tbl_secant) label="Approximating with the Secant Method up to n"
							 firstobs=1 numobs=i
							 var=colnames
							 ID="i"; 
							 
return 0;
finish Secant;

temp = Secant(p0,p1,tol,n);				 