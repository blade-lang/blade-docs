---
layout: default
title: Loops & Ranges
parent: Tutorial
nav_order: 9
permalink: /tutorial/loops
---

# Loops & Ranges

Loops are programmatic constructs for repeated evaluation and execution. Blade has three statements 
that are used to support looping over data. The `while`, `iter` and `for` loops. All three of them 
evaluate conditions and continue to execute so long as those conditions are true. If the conditions 
are false as at the start of their iteration, they simply do not execute.

It is sometimes convinent to halt the execution of a loop. The `break` keyword acts as a mechanism 
for achieving just that. At other times, one simply wants to skip the current iteration and move on 
to the next. For the later, the `continue` keyword exists just for that. The `break` and `continue` 
keywords are both valid in all looping techniques. 


## While Loops
---

The _while_ loop is very straightforward in application and self explainable. Simply put, `while` 
a condition is true, execute the following.

For example:

```blade-repl
%> var age = 13
%> while age < 18 {
..   echo 'Happy ${age}th birthday'
..   age++
.. }
'Happy 13th birthday'
'Happy 14th birthday'
'Happy 15th birthday'
'Happy 16th birthday'
'Happy 17th birthday'
```

> **NOTE:** In a while loop, the user has the responsibility to evaluate the condition to false. In 
> our example, we incremented the value of `age` before we end the loop so that `age` can finally reach 
> a value at which the loops condition evaluation returns false.

That's it!


## Iter Loops
---

Ah! We are here... Iter loops (sighs!). Iter loops in Blade are akin to `for loops` in C or JavaScript. And soon enough, you'll understand why Blade introduced an new keyword (`iter`) instead of just calling it a for loop.

Iter loops are simple to construct. An iter loop requires an initializer (variable declaration), a 
condition and a loop control statement (usually an increment/decrement statement); all three being 
optional and separated by a semi-colon (`;`).

For example:

```blade-repl
%> iter var i = 0; i < 5; i++ {
..   echo 'Iteration ${i}'
.. }
'Iteration 0'
'Iteration 1'
'Iteration 2'
'Iteration 3'
'Iteration 4'
```

When the initializer is not given, Blade assumes it has been declared somewhere in the code. If it 
wasn't, trust that your code will run into one of many syntax error or exception depending on your code.

For example:

```blade-repl
%> iter ; i < 10; i++ {
..   echo i
.. }
Unhandled Exception: 'i' is undefined in this scope
  StackTrace:
    File: <repl>, Line: 1, In: <script>
```

A good practice would look something like the below:

```blade-repl
%> var i = 4
%> iter ; i < 10; i++ {
..   echo i
.. }
4
5
6
7
8
9
```

When the condition or loop control is not is not given, your code will most likely run infinitely

```blade-repl
%> iter var i = 0; ; i++ {
..   echo i
.. }
1
2
3
4
5
6
... # to infinity
```

Unless you have a `break` statement somewhere in your code.

```blade-repl
%> iter var i = 0; ;i++ {
..   echo i
..   if i == 5 break
.. }
0
1
2
3
4
5
```

> **NOTE:** `break` and `continue` are statements in Blade not expressions.

A simple way to write an infinite loop that runs until you decide to end it within the block is 
like this.

```blade-repl
%> iter ;; {
..   echo i
.. }
```

The above iter statement will run infinitely.

Since we've seen an example using the `break` statement to halt the execution of a block, it's only 
nice that we show how the `continue` statement to skip running the rest of an iteration.

For example:

```blade-repl
%> iter var i  = 0; i < 10; i++ {
..   if i <= 5 
..     continue
..   echo '${i} > 5'
.. }
'6 > 5'
'7 > 5'
'8 > 5'
'9 > 5'
```

## Ranges
---

Ranges are simple numeric iterables. i.e. They are structures that can be iterated/looped through. 
Ranges are in the format `start..end`. They include a starting number (inclusive) and an ending 
number (non-inclusive) separated by a range operator (`..`).

For example:

```blade-repl
%> 0..10
<range 0-10>
%> 10..5
<range 10-5>
```

Ranges are valid in any direction. That is, they can either ascend (end greater than start) or 
descend (start greater than end). They are also evaluated in order. They can also be constructed 
from variables or a mixture of constant number and variables as desired.

```blade-repl
%> var a = 20
%> 5..a
<range 5-20>
%> a..10
<range 20-10>
%> var b = 16
%> a..b
<range 20-16>
```

Ranges also have a few methods.

{:#range-lower} _range_.**lower()**
: Returns the lower limit of the range. 
  For example:

  ```blade-repl
  %> (10..100).lower()
  10
  ```
^
{:#range-upper} _range_.**upper()**
: Returns the upper limit of the range. 
  For example:

  ```blade-repl
  %> (20..30).upper()
  30
  ```

> **NOTE:** The parenthesis (`()`) around the range in our example is important to make sure that 
> the upper limit of the range is not interpreted as a number since the range was not assigned to 
> a variable.

Other examples of iterables are [Strings](./strings), [Lists](./lists), [Dictionaries](./dictionaries), [Bytes](/standard/bytes) etc.


## For Loops
---

I promised you'll soon find out why Blade didn't name the `iter` loop for loops. Here is why. 
The construct of the iter loop is familiar with programmers coming from C-like languages, but not 
so much for those coming from non-C background. The construct of the `iter` loop make it monstrous 
and for this reason, Blade's `for` loop is much simplier and easier to write and use.

Rather than iterating arithemetic progressions, _`for`_ loops iterate over items in an iterable in the order in which they appear in the iterable.

For example (Rhymes...):

```blade-repl
%> for i in 1..10 {
..   echo i
.. }
1
2
3
4
5
6
7
8
9
```

The `for` keyword _MUST_ be paired with the `in` keyword. The _for_ loop works for all iterable 
items. For example, we can iterate the elements of the string `Hello` as follows:

```blade-repl
%> for x in 'hello' {
..   echo 'Letter ${x}'
.. }
'Letter h'
'Letter e'
'Letter l'
'Letter l'
'Letter o'
```

That's the basic idea. We'll show more examples as we go through the different iterables we'll 
come across in the tutorial. 

---

**_Infact, we'll like to get you exited ahead of time by sharing a simple secret &mdash; In Blade, 
you can convert any [class](./class) into an iterable simply by implementing two 
[decorators](./class#decorators) and it'll work perfectly with the for loop._**


<br><br>

[Previous Topic](./decision-making) | [Next Topic](./lists)