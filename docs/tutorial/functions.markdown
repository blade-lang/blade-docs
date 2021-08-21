---
layout: default
title: Functions
parent: Tutorial
nav_order: 12
permalink: /tutorial/functions
---

# Functions

Blade like most high-level programming language allows the creation of reuseable blocks of code
of various kinds, most notable being `functions`. A blade function is declared using the `def` (meaning define) keyword followed by the fuction name and an option list of arguments/parameters enclosed within parenthesis `()` and followed by a block of code.

For example:

```blade-repl
%> def fn() {
..   echo 'Hello, World'
.. }
```

Over this course of this tutorial, we've actually been calling a few functions such ash the built-in `print()` function. Calling a function is as simple as stating the function name followed by an opening parenthesis `(`, followed by one or more arguments if applicable and a closing parenthesis `)`.

For example:

```blade-repl
%> fn()   # calling the fn function declared above
'Hello, World'
nil
```

Below is another example with a function accepting arguments and how it can be called.

```blade-repl
%> def print_info(name, age) {
..   echo '${name} is ${age} years old'
.. }
%> print_info('Varun', 39)
'Varun is 39 years old'
nil
```

> A function can only accept a maximum of 255 arguments and cannot declare more than  65,535 local 
> variables. If you need anything more than that, it's time you start looking at breaking up your 
> function into smaller functions.

The default value of a blade function argument is `nil`. With this in mind, when calling a function, one can all or the rest of the arguments to the function without raising an exception.

For example:

```blade-repl
%> def show(book, author) {
..   echo 'Book name = ${book}'
..   echo 'Author name = ${author}'
.. }
%> show()   # calling show() without any parameter make book and author nil
'Book name = nil'
'Author name = nil'
nil
%> show('Jaws')  # calling show() with only book name makes author nil
'Book name = Jaws'
'Author name = nil'
nil
%> show('Jaws', 'Andrea')   # calling with both parameters
'Book name = Jaws'
'Author name = Andrea'
nil
```


## Returning Values
---

Did you notice that extra `nil` printed after some function calls when you run Blade in the REPL mode, I'm sure you've seen it a couple of times in this tutorial and been wandering what exactly it is. This is because every Blade function returns a value and by default, that value is `nil`.

To return something else other than `nil`, the `return` keyword can be called anywhere in a function to halt the function and return the specified value.

For example:

```blade-repl
%> def return_a_number() {
..   return 25 * 31
.. }
%> return_a_number()
775
%> 
%> def return_nil() {}  # `return nil` is never necessary
%> return_nil()
nil
```

## Anonymous Fuctions
---


## Closures
---


## Variadic functions
---




<br><br>

[Previous Topic](./dictionaries) | [Next Topic](./builtin-functions)