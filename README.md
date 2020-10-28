# Numerical Analysis in SAS

With the rapid growth of processing speed in the everyday computer, scientific calculations are becoming more accessible to people who may not necessarily specialise in computing or information technology. An important type of calculation is found in numerical analysis - normally, analytical techniques are used to solve problems, but in some cases, the problem is too complex for our current accumulation of mathematical knowledge to solve. We thus create workarounds, through several different methods. Here is a collection of some of these methods, as applied in the programming language of SAS<sup>®</sup>.

<p align="center">
  <img width="350p" src="https://github.com/nuclearcheesecake/numerical-analysis-in-sas/blob/master/Misc/SAS.png">
</p>

See www.sas.com for more information on SAS<sup>®</sup>-related products, since this repository will focus on the mathematics and is not affiliated with the SAS Institute. The SAS Institute has a few interesting online courses for beginners.

The programs in this repository run on **SAS/IML 15.2** and **SAS 9.4**.

## Table of Contents

1. [Root-finding techniques](#roots)
   - [The Bisection Method](#bis)
   - [The Newton-Raphson Method](#nera)
   - [The Secant Method](#secant)
   - [Horner's Method](#horn)
   - [Newton's Method in Several Variables](#nese)

2. [Interpolation techniques for polynomials](#inter)
   - [Lagrange Interpolating Polynomial](#laginter)
   - [Newton Interpolating Polynomial](#newinter)
   - [Linear Splines](#linspin)
   - [Quadratic Splines](#qspin)
   - [Cubic Splines](#cubspin)
   
3. [Numerical Differentiation](#numdiff)
   - [Lagrange Interpolating Polynomial](#num)

4. [Numerical Integration](#numint)
   - [The Trapezoidal Rule](#trap)
   - [Simpson's Method](#sim)
   - [Gauss-Legendre Integration](#gl)
   - [Monte-Carlo Integration](#mc)
   
5. [Initial Value Problems](#ivp)
   - [Euler's Method](#em)
   - [Taylor's Method](#tay)
   - [Midpoint Method (Runge Kutta)](#midp)
   - [Modified Euler's Method (Runge Kutta)](#mod)
   - [Order 4 (Runge Kutta)](#o4)
   
   
<a name="roots"></a>
## 1 - Root-finding techniques

<a name="bis"></a>
### (1.1) The Bisection Method

(find the code for this section [here](https://github.com/nuclearcheesecake/numerical-analysis-in-sas/blob/master/1%20-%20Root-finding%20techniques/BisectionMethod.sas))

🔧 **How it works** <br/>
_Finding the root_<br/>
Some explanation. <br/>

_Error Analysis_<br/>
Some explanation. <br/>

📖 **Example**

💾 **Notes on code**

<a name="nera"></a>
### (1.2) The Newton-Raphson Method

(find the code for this section [here](https://github.com/nuclearcheesecake/numerical-analysis-in-sas/blob/master/1%20-%20Root-finding%20techniques/NewtonRaphson.sas))

🔧 **How it works** <br/>
_Finding the root_<br/>
Some explanation. <br/>

_Error Analysis_<br/>
Some explanation. <br/>

📖 **Example**

💾 **Notes on code**

<a name="secant"></a>
### (1.3) The Secant Method

(find the code for this section [here](https://github.com/nuclearcheesecake/numerical-analysis-in-sas/blob/master/1%20-%20Root-finding%20techniques/SecantMethod.sas))

🔧 **How it works** <br/>
_Finding the root_<br/>
Some explanation. <br/>

_Error Analysis_<br/>
Some explanation. <br/>

📖 **Example**

💾 **Notes on code**

<a name="horn"></a>
### (1.4) Horner's Method

(find the code for this section [here]()

🔧 **How it works** <br/>
_Finding the root_<br/>
Some explanation. <br/>

_Error Analysis_<br/>
Some explanation. <br/>

📖 **Example**

💾 **Notes on code**

<a name="nese"></a>
### (1.5) Newton's Method in Several Variables

(find the code for this section [here](https://github.com/nuclearcheesecake/numerical-analysis-in-sas/blob/master/1%20-%20Root-finding%20techniques/NewtonSystemOfNonlinearEquations.sas))

🔧 **How it works** <br/>
_Finding the root_<br/>
Some explanation. <br/>

_Error Analysis_<br/>
Some explanation. <br/>

📖 **Example**

💾 **Notes on code**


<a name="inter"></a>
## 2 - Interpolation techniques for polynomials

<a name="laginter"></a>
### (2.1) Lagrange Interpolating Polynomial

(find the code for this section [here]()

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**

<a name="newinter"></a>
### (2.2) Newton Interpolating Polynomial

(find the code for this section [here](https://github.com/nuclearcheesecake/numerical-analysis-in-sas/blob/master/2%20-%20Interpolation%20techniques%20for%20polynomials/NewtonInterpolatingPolynomial.sas))

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**

<a name="linspin"></a>
### (2.3) Linear Splines

(find the code for this section [here](https://github.com/nuclearcheesecake/numerical-analysis-in-sas/blob/master/2%20-%20Interpolation%20techniques%20for%20polynomials/LinearSplines.sas))

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**

<a name="qspin"></a>
### (2.4) Quadratic Splines

(find the code for this section [here](

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**


<a name="cubspin"></a>
### (2.5) Cubic Splines

(find the code for this section [here](https://github.com/nuclearcheesecake/numerical-analysis-in-sas/blob/master/2%20-%20Interpolation%20techniques%20for%20polynomials/CubicSplines.sas))

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**

<a name="numdiff"></a>
## 3 - Numerical Differentiation

<a name="num"></a>
### (3.1) ??

(find the code for this section [here]()

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**

<a name="numint"></a>
## 4 - Numerical Integration

<a name="trap"></a>
### (4.1) The Trapezoidal Rule

(find the code for this section [here]()

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**

<a name="sim"></a>
### (4.2) Simpson's Method

(find the code for this section [here]()

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**

<a name="gl"></a>
### (4.3) Gauss-Legendre Integration

(find the code for this section [here]()

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>

<a name="mc"></a>
### (4.4) Monte-Carlo Integration

(find the code for this section [here]()

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**


📖 **Example**

💾 **Notes on code**

<a name="ivp"></a>
## 5 - Initial Value Problems

<a name="em"></a>
### (5.1) Euler's Method

(find the code for this section [here]()

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**


<a name="tay"></a>
### (5.2) Taylor's Method

(find the code for this section [here]()

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**

<a name="midp"></a>
### (5.3) Midpoint method (Runge Kutta)

(find the code for this section [here]()

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**

<a name="mod"></a>
### (5.4) Modified Euler's Method (Runge Kutta)

(find the code for this section [here]()

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**

<a name="04"></a>
### (5.5) Order 4 (Runge Kutta)

(find the code for this section [here]()

🔧 **How it works** <br/>
_Creating the polynomial_<br/>
Some explanation. <br/>


📖 **Example**

💾 **Notes on code**
