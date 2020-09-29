PROC IML;

/* 
INTRODUCTION
================================
Created by:		Wickus Bester

Date created: 	11/09/2020

Purpose: 	 	Approximate a single root of a function using the Bisection method

Inputs:			Initial range [a,b]
				Tolerance tol and max number of iterations n
				Also define necessary function(s)
				
Instructions:	1 - Define the function f(x) as desired
				2 - Fill in the initial values

 */


/* FUNCTIONS AND INITIAL VALUES */
/* Functions */
start f(x);
output = x##2-4;
return output;
finish f;

/* Initial values */
a = 0;
b = 10;
tol = 0.00001;
n = 50;
i = 0;

/* Graph the function */
x = do(a,b,0.1);
y = f(x);
title "The function f(x) on the initial interval";
call Series(x,y) grid={X Y} xvalues=a:b other="refline 0 / axis=y";


/* DEFINE THE BISECTION METHOD */
start Bisection(a,b, er, n);

L=a;
R=b;

M=(L+R)/2;
fm=f(M);
T=j(1,8);
i=1;
nmax = (log10(b-a) - log10(er)) / (log10(2));
error = (R-L)/(2**i);

T[1,1]=i; 
T[1,2]=L; 
T[1,3]=M; 
T[1,4]=R; 
T[1,5]=f(L); 
T[1,6]=fm; 
T[1,7]=f(R);
T[1,8] = error;

DO WHILE (i <= nmax && i<n);

IF (f(L)*f(M)<0) then R=M;
IF (f(R)*f(M)<0) then L=M;

p0 = M;
M=(L+R)/2;
fm=f(M);

i = i + 1;

error = (R-L)/(2**i);

Temp = j(1,8);
Temp[1,1]=i; 
Temp[1,2]=L; 
Temp[1,3]=M; 
Temp[1,4]=R; 
Temp[1,5]=f(L); 
Temp[1,6]=fm; 
Temp[1,7]=f(R);
Temp[1,8] = error;
T=insert(T, temp, i);
END;

title "BISECTION METHOD ON THE INTERVAL [a,b]";

iterations = i;
approximate_root = M;
max_error = (R-L)/(2**i);
print iterations;
print approximate_root;
print max_error;

names={"i" "Left" "Midpoint" "Right" "f(Left)" "f(Midpoint)" "f(Right)" "Max Error"};
tbl_bisection=TableCreate(names, T);

call TablePrint(tbl_bisection) label="The Bisection Method on f(x)"
							 firstobs=1 numobs=i
							 var=names
							 ID="i";
return 0;
finish Bisection;


/* APPLYING THE BISECTION METHOD TO FIND A SINGLE ROOT */
testa = f(a);
testb = f(b);
if (testa#testb>0) then print "ERROR: No root between given interval [a,b].";
else if (testa#testb=0) then print "Either a or b already the root" testa testb;
else temp = Bisection(a,b,tol,n);
