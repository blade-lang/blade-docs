---
layout: default
title: Error Handling
parent: Tutorial
nav_order: 17
permalink: /tutorial/error-handling.html
---

# Error Handling

There are generally two types of errors that can occur in Blade &mdash; `Syntax Errors` and `Runtime Exceptions`. 
A Syntax error occurs when you attempt to run an invalid program, while a Runtime Exception is any error that occurs 
during the execution of the program. 

Blade typically reports Syntax errors looking like the below.

> **_@note:_** Syntax errors cannot be handled.

```blade-repl
SyntaxError at ':': end of statement expected
  <repl>:1
```

While Runtime Exceptions are reported similar to the following.

```blade-repl
Unhandled Exception: only functions and classes can be called
  StackTrace:
    <repl>:1 -> @.script()
```


## Exceptions
---

Blade comes with the built-in _class_ `Exception` which is raised everytime a Runtime Exception occurs. For example,

```blade-repl
%> [1,2,3][5]
Unhandled Exception: list index 5 out of range
  StackTrace:
    <repl>:1 -> @.script()
```

Blade allows us to manually trigger a Runtime Exception at any point in a program as well via the `die` keyword. 

For example:

```blade-repl
%> die Exception('I was manually triggered')
Unhandled Exception: I was manually triggered
  StackTrace:
    <repl>:1 -> @.script()
```


## Custom Exceptions
---

You can define custom Exception classes by subclassing the class `Exception`. All custom Exceptions in Blade must descend 
from the built-in `Exception` class.

For example:

```blade-repl
%> class MyCustomException < Exception {}
%> die MyCustomException('Something happened')
Unhandled MyCustomException: Something happened
  StackTrace:
    <repl>:1 -> @.script()
```


## Catching Exceptions
---

Blade supports _testing for_ and _catching_ Exceptions as well via the `try...catch...` block allowing graceful handling of 
runtime errors that should have ordinarily halt the application. The `catch` block of the try/catch must specify the type of 
Exception to be caught by that block and only that type of Exception or it's subclass will be affected by the `catch` block.

For example:

```blade-repl
%> try {
..   die Exception('Sucide!')
.. } catch Exception {
..   echo 'Ha!Ha!! You survived!'
.. }
'Ha!Ha!! You survived!'
```

The catch block can also catch the Exception into a variable, allowing us to manipulate and use the Exception object itself 
for a fine grained error reporting or anything for that matter.

For example:

```blade-repl
%> try {
..   die Exception('Sucide!')
.. } catch Exception e {
..   echo '${e.message}? Bad Idea!'
.. }
'Sucide!? Bad Idea!'
```

<!-- A try block may also have more than one corresponding catch block all treating different types of Exceptions as shown in the 
following example.

```blade-repl
``` -->


## Finally...
---

Most times, when we anticipate Exceptions in our code and wrap the code in a try/catch block, we want to be able to do 
something or run a piece a code irrespective of whether an Exception occured or not. For this, Blade supports an optional 
`finally` block.

For example:

```blade-repl
%> try {
..   echo 'No exception'
.. } catch Exception {
..   echo 'Something went wrong!'
.. } finally {
..   echo 'All is good'
.. }
'No exception'
'All is good'
```

Whenever the `finally` is present, The `catch` block may be omitted. 

For example:

```blade-repl
%> try {
..   echo 'No exception'
.. } finally {
..   echo 'No catch occured!'
.. }
'No exception'
'No catch occured!'
```

In this case, even though the Blade will halt the execution of the program whenever an Exception occurs, the _finally_ 
block will still run irrespective of whether the program will halt or not (if no error occured.)


For example:

```blade-repl
%> try {
..   die Exception('No exception')
.. } finally {
..   echo 'I will still run'
.. }
'I will still run'
Unhandled Exception: No exception
  StackTrace:
    <repl>:2 -> @.script()
```


## Asserts
---

Often times, we want to verify that one or more conditions are true before we continue execution otherwise, termiate the 
function and/or process and stop it from going further. This can be achieved using complicated and/or nested `if...else...` 
blocks with a messy use of the `die` command, but Blade offers a more intuitive approach via the `assert` command.

For example:

```blade-repl
%> assert 10 == 5
Illegal State:
  StackTrace:
    <repl>:1 -> @.script()
%> 
%> var a = 13
%> var b = 24
%> assert a != b
```

The assert command also takes an optional error value of any value type that can be specified by separating the assertion 
and the message by a comma (`,`). None string error messages will be converted to string before dieing.

For example:

```blade-repl
%> assert 5 > 25, 'Bad mathematician!'
Illegal State: Bad mathematician!
  StackTrace:
    <repl>:1 -> @.script()
```




<br><br>

[Previous Topic](./working-with-files.html) | [Next Topic](./modules.html){:class="float-right"}