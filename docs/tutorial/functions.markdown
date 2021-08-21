---
layout: default
title: Functions
parent: Tutorial
nav_order: 12
permalink: /tutorial/functions
---

# Functions

Blade like most high-level programming language allows the creation of reuseable blocks of code
of various kinds, most notable being `functions`. A blade function is declared using the `def` 
(meaning define) keyword followed by the fuction name and an option list of arguments/parameters 
enclosed within parenthesis `()` and followed by a block of code.

For example:

```blade-repl
%> def fn() {
..   echo 'Hello, World'
.. }
```

Over this course of this tutorial, we've actually been calling a few functions such ash the built-in 
`print()` function. Calling a function is as simple as stating the function name followed by an 
opening parenthesis `(`, followed by one or more arguments if applicable and a closing parenthesis 
`)`.

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

> A function can only accept a maximum of 255 named parameters and cannot declare more than 65,535 
> local variables. If you need anything more than that, it's time you start looking at breaking up 
> your function into smaller functions.

The default value of a blade function parameter is `nil`. With this in mind, when calling a 
function, one can all or the rest of the arguments to the function without raising an exception.

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

In Blade, functions are first-class objects and can be use like any other value. Functions can be 
assigned, they can even be used as arguments to other functions.

For example:

```blade-repl
%> def example() {
..   echo 'It works!'
.. }
%> var fn = example
%> fn()
'It works!'
nil
```


## Returning Values
---

Did you notice that extra `nil` printed after some function calls when you run Blade in the REPL 
mode, I'm sure you've seen it a couple of times in this tutorial and been wandering what exactly it 
is. This is because every Blade function returns a value and by default, that value is `nil`.

To return something else other than `nil`, the `return` keyword can be called anywhere in a function 
to halt the function and return the specified value.

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

Anonymnous functions in Blade are functions without a name and are meant purely to be treated as 
a value. They can be assigned, called and/or returned as value from functions just like a regular 
function. All anonymous functions are automatically assigned the name `|` by the BladeVM.

Anonymous functions differ from standard functions only by syntax.

- Anonymous function are not defined by any keyword such as `def`.
- Their parameter list are enclosed between pairs of vertical bars rather than parenthesis.

For example:

```blade-repl
%> || {} # empty anonymous function
<function | at 0x127305120>
%> |name| {     # anonymous function accepting parameter name
..   echo name  # function body
.. }
```

Anonymous functions as discussed can be called,

```blade-repl
%> |name, age| {
..   echo '${name} is ${age} years old'
.. }('Pete', 46)
'Pete is 46 years old'
```

or assigned to variable, 

```blade-repl
%> var get_info = |name, age| {
..   echo '${name} is ${age} years old'
.. }
%> get_info('Casandra', 11)
'Casandra is 11 years old'
nil
```

and passed as argument to functions.

```blade-repl
%> def call(fn) {
..   fn('Lionel')
.. }
%> call(|name| {
..   echo 'Hi ${name}'
.. })
'Hi Lionel'
```


## Closures
---

A closure gives you access to an outer function’s scope from an inner function. In Blade, all 
functions are closures. In Blade, closures are scoped to the current function and top level 
functions are scoped to the current module.

For example:

```blade-repl
%> def init() {
..   var name = 'Blade'     # local name variable in function init
..   def show_name() {      # inner function, a closure
..     echo name            # use of variable declared in parent
..   }
..   show_name()
.. }
%> init()
'Blade'
nil
```

While Blade is lexically scoped, inner functions in Blade have access to variables declared in 
their parent functions. Let's see another example that shows clearly how the variables declared 
in the parent survives until the inner function even after the outer function is out of scope.

```blade-repl
%> def make_fn() {
..   var name = 'Blade'
..   def show_name() {
..     echo name
..   }
..   return show_name
.. }
%> var fn = make_fn()
%> fn()
'Blade'
nil
```

Once `make_fn()` finishes executing, you might expect that the name variable would no longer be 
accessible. However, in Blade they still work. This is because the name variable lives long enough 
into the inner function.

Here is a slightly more interesting example borrowed from Mozilla's JavaScript documentation as 
JavaScript is another language that supports closures.

```blade-repl
%> def make_adder(x) {
..   return |y| {
..     return x + y
..   }
.. }
%> 
%> var add5 = make_adder(5)
%> var add10 = make_adder(10)
%> 
%> echo add5(2)
7
%> echo add10(2)
12
```

And another slightly more complex one.

```blade-repl
%> var e = 10   # global scope
%> def sum(a) {
..   return |b| {
..     return |c| {     # outer functions scope
..       return |d| {
..         return a + b + c + d + e     # local scope
..       }
..     }
..   }
.. }
%> echo sum(1)(2)(3)(4)
20
```


## Variadic functions
---

In many situations, it becomes quite convienent to write a function that accepts an arbitary number 
of arguments. This kind of functions are variadic functions i.e. functions accepting variable 
arguments. To accept variable arguments in a Blade function, simple indicate it by using the tridot 
(`...`) operator.

A few notes apply to variadic functions.

- The `...` operator cannot appear before any named parameter
- No named parameter can appear after the `...` operator.

When a function accepts variable arguments, every argument passed to the function starting from the 
index of the tridot operator (`...`) will become available in the function as a local variable 
named `__args__`.

For example:

```blade-repl
%> def concat(...) {
..   return ' '.join(__args__)  # __args__ is a list
.. }
%> concat('Hello', 'World')
'Hello World'
```

The tridot operator isn't necessarily the first parameter in the function, but must be the last 
parameter in the function.

```blade-repl
%> def test2(name, age, ...) {
..   echo name
..   echo age
..   echo __args__
.. }
%> 
%> test2('Richard', 20, 'James')
'Richard'
20
[James]
nil
```

Trying to add another parameter after the tridot operator (`...`) will result in a syntax error.

For example:

```blade-repl
%> def test(name, ..., age) {
..   echo name
.. }
SyntaxError:
    File: <repl>, Line: 1
    Error at ',': expected ')' after function parameters
```




<br><br>

[Previous Topic](./dictionaries) | [Next Topic](./builtin-functions)