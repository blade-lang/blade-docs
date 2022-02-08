---
layout: default
title: math
parent: Standard Library
nav_order: 12
permalink: /standard/math
---

# math

Blade's mathematical library



<h2>Properties</h2><hr>

{:#math__PI} _math._**PI**
: represents the ratio of the circumference of a circle 
  to its diameter


^
{:#math__E} _math._**E**
: represents Euler's number, the base of natural logarithms


^
{:#math__LOG_10} _math._**LOG_10**
: represents the natural logarithm of 10


^
{:#math__LOG_10_E} _math._**LOG_10_E**
: represents the base 10 logarithm of e


^
{:#math__LOG_2} _math._**LOG_2**
: represents the natural logarithm of 2


^
{:#math__LOG_2_E} _math._**LOG_2_E**
: represents the base 2 logarithm of e


^
{:#math__ROOT_2} _math._**ROOT_2**
: represents the square root of 2


^
{:#math__ROOT_3} _math._**ROOT_3**
: represents the square root of 3


^
{:#math__ROOT_HALF} _math._**ROOT_HALF**
: represents the square root of 1/2


^
{:#math__Infinity} _math._**Infinity**
: Mathematical infinity


^
{:#math__NaN} _math._**NaN**
: Mathematical NaN




<h2>Functions</h2><hr>

{:#math__factorial} _math_.**factorial**(_n_: number)
: calculates the product of all positive 
  numbers less than or equal to a given positive number n
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__sin} _math_.**sin**(_n_: number)
: returns a numeric value between -1 and 1, which 
  represents the sine of the angle given in radians
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__cos} _math_.**cos**(_n_: number)
: returns a numeric value between -1 and 1, which 
  represents the cosine of the angle
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__tan} _math_.**tan**(_n_: number)
: returns a numeric value that represents the tangent 
  of the angle given
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__sinh} _math_.**sinh**(_n_: number)
: returns the hyperbolic sine (in radians) of number n
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__cosh} _math_.**cosh**(_n_: number)
: returns the hyperbolic cosine (in radians) of number n
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__tanh} _math_.**tanh**(_n_: number)
: returns the hyperbolic tangent (in radians) of number n
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__asin} _math_.returns a numeric value between -(π/2)
: for x between -1 and 1. 
  If the value of x is outside this range, it returns NaN
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__acos} _math_.**acos**(_n_: number)
: returns a numeric value between 0 and π radians for x 
  between -1 and 1. 
  If the value of x is outside this range, it returns NaN
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__atan} _math_.returns a numeric value between -(π/2)
:  <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__atan2} _math_.**atan2**(_n_: number)
: returns a numeric value between -π and π representing the 
  angle theta of an (x, y) point. 
  This is the counterclockwise angle, measured in radians, 
  between the positive X axis, and the point (x, y). 
   <div class="cite"><span class="hint">note</span> <span>the arguments to this function pass the y-coordinate first and the x-coordinate second</span></div>

   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__asinh} _math_.**asinh**(_n_: number)
: returns the hyperbolic arcsine (in radians) of number n
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__acosh} _math_.**acosh**(_n_: number)
: returns the hyperbolic arccosine (in radians) of number n
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__atanh} _math_.**atanh**(_n_: number)
: returns the hyperbolic arctangent (in radians) of number n
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__exp} _math_.**exp**(_n_: number)
: returns e ** x, where x is the argument, and e is Euler's 
  number (also known as Napier's constant), the base of the 
  natural logarithms
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__expm1} _math_.**expm1**(_n_: number)
: returns (e ** x) - 1, where x is the argument, and e the base of 
  the natural logarithms
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__ceil} _math_.**ceil**(_n_: number)
: returns number n rounded up to the next largest integer
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__round} _math_.**round**(_n_: number)
: returns the value of a number rounded to the nearest integer
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__log} _math_.**log**(_n_: number)
: returns the natural logarithm (base e) of a number (mathematical ln(x))
   <div class="cite"><span class="hint">note</span> <span>- If the value of x is 0, the return value is always -inf</span></div>

  - If the value of x is negative, the return value is always NaN
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__log2} _math_.**log2**(_n_: number)
: returns the base 2 logarithm of the given number. 
  If the number is negative, NaN is returned
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__log10} _math_.**log10**(_n_: number)
: returns the base 10 logarithm of the given number. 
  If the number is negative, NaN is returned
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__log1p} _math_.**log1p**(_n_: number)
: For very small values of x, adding 1 can reduce or eliminate precision.  
  The double floats used in JS give you about 15 digits of precision.  
  1 + 1e-15 = 1.000000000000001, but 1 + 1e-16 = 1.000000000000000 and therefore 
  exactly 1.0 in that arithmetic, because digits past 15 are rounded off.  
  
  When you calculate log(1 + x), you should get an answer very close to x, 
  if x is small (that's why these are called 'natural' logarithms).  
  If you calculate log(1 + 1.1111111111e-15) you should get an answer 
  close to 1.1111111111e-15.  
  Instead, you will end up taking the logarithm of 1.00000000000000111022 
  (the roundoff is in binary so sometimes it gets ugly), so you get the answer 
  1.11022...e-15, with only  3 correct digits.  
  If, instead, you calculate log1p(1.1111111111e-15) you will get a much 
  more accurate answer 1.1111111110999995e-15 with 15 correct digits of precision 
  (actually 16 in this case).
  
  returns the natural logarithm (base e) of 1 + a number
  If the value of x is less than -1, the return value is always NaN.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__cbrt} _math_.**cbrt**(_n_: number)
: returns the cube root of a number n
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__sign} _math_.**sign**(_n_: number)
: returns either a positive or negative +/- 1, indicating the sign of 
  a number passed into the argument. 
  If the number passed into sign() is 0, it will return a 0.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__floor} _math_.**floor**(_n_: number)
: A number representing the largest integer less than or 
  equal to the specified number
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__is_nan} _math_.**is_nan**(_n_: number)
: returns true if the given number is equal to NaN or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#math__is_inf} _math_.**is_inf**(_n_: number)
: returns true if the given number is equal to Infinity or -Infinity 
  or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#math__is_finite} _math_.**is_finite**(_n_: number)
: return true if x is neither an Infinity nor a NaN, and false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#math__trunc} _math_.**trunc**(_n_: number)
: returns the integer part of a number by removing any fractional
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__sqrt} _math_.**sqrt**(_n_: number)
: returns the square root of a nunmber
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__sum} _math_.**sum**(_arg_: iterable)
: calculate the sum of all the elements in the input iterable
  the default start value for the product is 1.
  when the iterable is empty, it returns 1
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__product} _math_.**product**(_arg_: iterable)
: calculate the product of all the elements in the input iterable
  the default start value for the product is 1.
  when the iterable is empty, it returns 1
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#math__fraction} _math_.**fraction**(_n_: number)
: returns the fractional part of a number as a whole number 
  by removing any integer
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



