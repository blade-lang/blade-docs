---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Quick Language Overview
nav_order: 1
description: A single-page introduction to the Blade programming language. For the advanced and experienced ones.
---

# Quick Language Overview
{: .fs-9 }

For those with good programming experience, reading through tons of pages of documentation may look
like a waste of time since they'll already be equipped enough to pick off new stuff fast. If you are
one of them &mdash; this is for you!

> Click the `REPL` box to toggle the REPL mode on and off.


## Start in REPL mode
---

Simple type `blade` in your terminal to launch REPL mode

```terminal
$ blade
Blade 0.0.7 (running on BladeVM 0.0.6), REPL/Interactive mode = ON
Clang 13.0.0, (Build time = Feb  8 2022, 02:47:36)
Type "exit()" to quit or "credits()" for more information
%> 
```

## Running a script
---

Type `blade` followed by the path to the file in the terminal. <br>
Blade scripts use the `.b` extension.

```terminal
$ blade /path/to/file.b
```


## Print to the standard output
---

You can use the `echo` keyword to print any object to standard output or use the `print()` function to print one or more objects to standard output.

```blade-repl
%> echo 'Hello, World'     # using echo keyword
'Hello, World'
%> print('Hello,', 'World\n')   # using the print function
Hello, World
```

> **_@note:_** Statements are terminated by newlines, but they can also be separated by semicolons `;` <br>
> **_@convention:_**  use newlines

## Variables
---

Use the `var` keyword to declare variables.

```blade-repl
%> var a = 10
%> a    # in the REPL mode, you can omit `echo` to do a quick print
10
%> var b = 'Hello, World'
%> b
'Hello, World'
%> a = 25
%> b = 33
%> a; b     # printing a and b to screen at the same time
25
33
```

Operators such as `+=`, `-=`, `++`, `--` are all supported.

```blade-repl
%> a++
%> b--
%> a; b
26
32
%> a += 10
%> b *= 5
%> a; b
36
160
```
[More](./tutorial/variables)


## Comments
---

Single line comments begin with an `#`, multiline comments are wrapped in `/*` and `*/` and they can be nested.

```blade
# a single line comment

/*
 Multiline comments
  /*
    can be nested...
  */
*/
```
[More](./tutorial/comments)


## String interpolation
---

Blade strings allow you to evaluate expressions within strings using the interpolation syntax `${expression...}`.

> **_@note_:** Blade strings always support interpolation and can span multiple lines whether wrapped in `''` or `""`

```blade-repl
%> var a = 93
%> 'a is ${a}'
'a is 93'
%> var b = 'a is ${a}'
%> b
'a is 93'
%> a = 107
%> '${b.replace("is", "was")}, but is now ${a}'
'a was 93, but is now 107'
```
The arguments to _replace_ could have used `''` pairs too. We only used `""` for clarity.<br>
[More](./tutorial/strings)


## `if...else...` statements
---

Blade has the standard `if... else...` you'll find in most C-like languages except that it doesn't require the parenthesis.

```blade-repl
%> var a = 20
%> if a > 20 {
..   echo 'a is greater than 20'
.. } else {
..   echo 'a is less than or equal to 20'
.. }
'a is less than or equal to 20'
```

It can be inlined if only one statement follows

```blade
if a == 20 echo 'a is 20'
else echo 'a is not 20'

/**
 * Output:
 * a is 20
 */
```
[More](./tutorial/decision-making)


## Ternary operators `?:`
---

Simple expression time decisions are supported via ternary operators

```blade-repl
%> var a = 10
%> echo a < 10 ? 'Failed.' : 'Congrats!'
'Congrats!'
```
[More](./tutorial/decision-making)


### `using` statements

This statement takes a value and matches it against a set of constants to run the piece of code associated with it.

```blade-repl
%> var name = 'james'
%> 
%> using name {
..   when 10 echo 'My name is 10'
..   when true {
..     echo 'My name is true'
..     echo 'Yes, true is a constant!'
..   }
..   when 'james' echo 'My name is James'
..   default echo "I don't know my name"
.. }
'My name is James'
```
[More](./tutorial/decision-making)


## `while` loop
---

```blade-repl
%> var items = ['Apple', 'Mango', 'Banana', 'Peach']
%> var index = 0
%> 
%> while index < items.length() {
..   echo 'Item at ${index} is ${items[index]}'
..   index++
.. }
'Item at 0 is Apple'
'Item at 1 is Mango'
'Item at 2 is Banana
'Item at 3 is Peach'
```
[More](./tutorial/loops)


## `iter` loop
---

Blade's version of C/JavaScript's _for_ loops. See [here](./) for why we didn't call it a for loop.

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
[More](./tutorial/loops)


## Ranges
---

You can define numbers over a range using Blade's range operator `..` and they can be used with loops very easily.

```blade-repl
%> 0..5
<range 0-5>
%> 1..10
<range 1-10>
%> 21..3
<range 21-3>
```
[More](./tutorial/loops)


## `for` loop
---

```blade-repl
%> var items = ['Nigeria', 'Ghanan', 'Senegal', 'Mali']
%> for item in items {
..   echo '${item} is a country'
.. }
'Nigeria is a country'
'Ghanan is a country'
'Senegal is a country'
'Mali is a country'
%> 
%> var details = {name: 'Blade', version: 0.5, website: 'https://bladelang.com'} 
%> for key, value in details {
..   echo '${key} -> ${value}'
.. }
'name -> Blade'
'version -> 0.5'
'website -> https://bladelang.com'
```
[More](./tutorial/loops)


## Iterables
---

Blade comes with built-in support for strings, ranges, bytes, lists, and dictionaries as its primary iterables and they support all common operations such as indexing and slicing. The concepts shown below apply to all iterables with the exception that strings are immutable.

```blade-repl
%> var list = [1, 'game', false]  # any data type can fit in...
%> var dictionary = {name: 'Blade', version: '0.0.6'}
%> var byte_array = bytes([104, 101, 108, 108, 111])  # hello
%> var sized_bytes = bytes(10)   # a byte array of size 10 with all entries as 0x0
%> 
%> echo list.length()
3
%> echo byte_array[2]
108
%> echo list[1,-1]
[game]
%> 
%> # update value (string values cannot be updated as they are immutable)
%> dictionary['version'] = 'version 0.0.6'
%> list[0]++
%> 
%> echo dictionary
{name: Blade, version: version 0.0.6}
%> echo list
[2, game, false]
%> 
%> for _, value in byte_array {
..   echo chr(value)
.. }
'h'
'e'
'l'
'l'
'o'
```
[More](./tutorial/lists)


## Functions
---

Use the `def` keyword to define a function.
> **_@note_:** The default value of a parameter is `nil`. For this reason, parameters can be omitted when calling functions.

```blade-repl
%> # define function name that takes one argument - name.
%> def say_hello(name) {
..   echo 'Hi, ' + name
.. }
%> 
%> say_hello('Parker')
'Hi, Parker'
%> say_hello() # name will default to nil
'Hi, '
%> 
%> def add(a, b) {
..   return a + b
.. }
%> 
%> add(30, 45)
75
%> 
%> # Functions can be nested into closures as they are first class objects...
%> def outer_function() {
..   def inner_function() {
..     return 20
..   }
..   return inner_function
.. }
%> 
%> outer_function()()
20
```
[More](./tutorial/functions)


## Type check and conversions
---

You can check if a value is a type by calling the related built-in function all named as `is_...` or convert to that type by calling the built-in `to_...` functions. E.g.

```blade-repl
%> is_string('hello')
true
%> to_list('hello')
[h, e, l, l, o]
```
> **_@note:_** They type of a dictionary is shortened to `dict` for builtin functions. i.e. we have `to_dict()` and `is_dict()`.


[More](./tutorial/type-casting)


## Class
---

```blade-repl
%> class Person { /* class content goes here... */ }
%> 
%> # creating instance of a class...
%> var person = Person()
```
[More](./tutorial/classes)


## Class methods
---

```blade-repl
%> class Person {
..   say_hello(name) {
..     return 'Hello, ${name}'
..   }
.. }
%> 
%> var person = Person()
%> person.say_hello('Hank')
'Hello, Hank'
```
[More](./tutorial/classes)


## Class constructors
---

Constructors are simply class methods bearing the same name as the class.

```blade-repl
%> class Person {
.. 
..   Person(name) {
..     self.name = name
..   }
.. 
..   say_hello() {
..     return 'Hello, ${self.name}'
..   }
.. }
%> 
%> var person = Person('Stark')
%> person.say_hello()
'Hello, Stark'
```
[More](./tutorial/classes)


## Class fields
---

```blade-repl
%> class Point {
..   var x = 2.143
..   var y = 7.941
.. }
%> 
%> var point = Point()
%> '${point.x}, ${point.y}'
'2.143, 7.941'
```
[More](./tutorial/classes)


## Static class fields and methods
---

```blade-repl
%> class Math {
..   static var PI = 3.142
.. 
..   static abs(x) {
..     return x >= 0 ? x : -x
..   }
.. }
%> 
%> Math.PI
3.142
%> Math.abs(-91)
91
```
[More](./tutorial/classes)


## Private class fields and methods
---

Class fields or methods whose name starts with an underscore (`_`) are private and only accessible from the current class.

```blade-repl
%> class Class {
..   var _number_of_desks = 10
.. 
..   _get_desks() {
..     return self._number_of_desks
..   }
.. 
..   get_desks() {
..     return self._get_desks()
..   }
.. }
%> 
%> var cls = Class()
%> cls.get_desks()
10
%> cls._number_of_desks   # this will cause an exception
Unhandled Exception: cannot call private property '_number_of_desks' from instance of Class
  StackTrace:
    File: <repl>, Line: 1, In: <script>
```
[More](./tutorial/classes)


## Inheritance
---

```blade-repl
%> class Animal {
..   Animal(name) {
..     self.name = name
..   }
.. 
..   greet() {
..     echo 'Hello ${self.name}'
..   }
.. 
..   call() {
..     echo 'Come here ${self.name}'
..   }
.. }
%> 
%> class Dog < Animal {
..   Dog(name) {
..     parent(name)
..   }
.. 
..   call() {
..     parent.call()
..     echo 'Whats up?'
..   }
.. }
%> 
%> var dog = Dog('Bingo')
%> dog.greet()
'Hello Bingo'
%> dog.call()
'Come here Bingo'
'Whats up?'
```
[More](./tutorial/classes)


## Class decorator

These are methods meant to provide information on how to use the class and they cannot be called directly by instances of the said class.

```blade-repl
%> class Class {
..   @decoration() {
..     return 1
..   }
.. }
```
[More](./tutorial/classes)


## Overriding builtin-methods
---

Simply create a decorator for the function.

```blade-repl
%> class Person {
..   Person(name) {
..     self.name = name
..   }
.. }
%> 
%> class Animal {
..   Animal(name) {
..     self.name = name
..   }
.. 
..   @to_string() {
..     return '<Animal ${self.name}>'
..   }
.. }
%> 
%> var person = Person('James')
%> var animal = Animal('Dog')
%> 
%> to_string(animal)  # using to_string function to convert classes to string
'<Animal Dog>'
%> to_string(person)
Unhandled Exception: undefined method '@to_string' in Person
  StackTrace:
    File: <repl>, Line: 1, In: <script>
```

> **_@note:_** Some builtin functions do not support decoration. e.g. `max()`.


[More](./tutorial/classes)


## Class as iterables
---

To convert a class into an iterable, simply implement the `@iter()` and `@itern()` decoration. `@itern()` returns the current index and `@iter()` returns the current value.

```blade-repl
%> class Iterable {
..   var items = ['Richard', 'Alex', 'Justina']
.. 
..   @iter(x) {
..     return self.items[x]
..   }
.. 
..   @itern(x) {
..     if x == nil return 0
.. 
..     if x < self.items.length() - 1
..       return x + 1
..     return false
..   }
.. }
%> 
%> for it in Iterable() {
..   echo it
.. }
'Richard'
'Alex'
'Justina'
```
[More](./tutorial/classes)


## Reading and Writing Files
---

### Writing/Creating a file

```blade-repl
%> var f = file('test.txt', 'w')
%> var written = f.write('It works!')
%> f.close()
%> 
%> if written echo 'File created successfully!'
'File created successfully!'
```

### Reading a file

```blade-repl
%> file('test.txt').read()
'It works!'
```
[More](./tutorial/working-with-files)


## Throwing exceptions
---

Blade comes with the built-in class `Exception` and all exceptions must derive from this class.

```blade-repl
%> die Exception('I died')
Unhandled Exception: I died
  StackTrace:
    File: <repl>, Line: 2, In: <script>
```
[More](./tutorial/error-handling)


## Handling exceptions
---

```blade-repl
%> try {
..   var list = []
..   echo list[1]
.. } catch Exception e {
..   echo 'Error: ${e.message}'  # there is also e.stacktrace
.. } finally {
..   echo "I'll run after all even if there is an error"
.. }
'Error: list index 1 out of range'
"I'll run after all even if there is an error"
```
[More](./tutorial/error-handling)


## Custom Exceptions
---

Simply subclass `Exception` as follows.

```blade-repl
%> class CustomError < Exception {
..   CustomError(message) {
..     parent(message)
..   }
.. }
%> 
%> die CustomError('I died too!')
Unhandled CustomError: I died too!
  StackTrace:
    File: <repl>, Line: 2, In: <script>
```
[More](./tutorial/error-handling)


## Asserts
---

```blade-repl
%> assert 10 == 10
%> assert 10 > 11
Unhandled Exception: AssertionError
  StackTrace:
    File: <repl>, Line: 2, In: <script>
%> assert 10 > 11, 'Failue!'
Unhandled Exception: AssertionError: Failue!
  StackTrace:
    File: <repl>, Line: 2, In: <script>
```
[More](./tutorial/asserts)


## Importing packages and modules
---

### Import package/module
```blade-repl
%> import http
%> http
<module http at /blade/libs/http/index.b>
```

### Import specific items from package/module
```blade-repl
%> import http { HttpClient }
%> HttpClient
<class HttpClient at 0x143f1f060>
%> http
Unhandled Exception: 'http' is undefined in this scope
  StackTrace:
    File: <repl>, Line: 1, In: <script>
```

### Import all exported values into current namespace
```blade-repl
%> import math { * }
%> math
Unhandled Exception: 'math' is undefined in this scope
  StackTrace:
    File: <repl>, Line: 1, In: <script>
%> product
<function product at 0x133e10180>
```

### Rename package/module on import
```blade-repl
%> import os as osystem
%> os
Unhandled Exception: 'os' is undefined in this scope
  StackTrace:
    File: <repl>, Line: 1, In: <script>
%> osystem
<module osystem at /blade/libs/os.b>
```

### Import module/package in relative path
```blade
import .test  # prefix the import path with a dot
import ..test # prefix path with a range (..) for the parent directory.
```

> **_@note:_** Every Blade `.b` script is a module.


[More](./tutorial/modules)


## Creating packages
---

Create a directory with the name of the package and create an `index.b` file in the directory. That's all!

```
my_package
|-- index.b
|...
```

Import as usual!

[More](./tutorial/modules)
