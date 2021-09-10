---
layout: default
title: Class
parent: Tutorial
nav_order: 14
permalink: /tutorial/class
---

# Class

Blade supports all features of the Object-Oriented Programming (OOP) paradigm except multiple inheritance. While Blade's 
support for OOP can be implemented with pure functions and closures, they are best implemented with classes.

Creating a _class_ in Blade is very simple.

```blade-repl
%> class MyClass {}
```

In Blade, classes are created at runtime and as such, **you can create a class directly anywhere in your code except in 
another class**. For example, it's perfectly valid to create a class within an `if` statement or inside of a function. 
Their definition must be executed before they can be used.

It's easy to create an instance of class too. Just call the class like a regular function. 

For example:

```blade-repl
%> var my_class = MyClass()
%> my_class
<class MyClass instance at 0x150708a10>
```

## Methods
---

Classes are useless without the ability to use them to do wonderful things such as code reuse. In Blade, classes can have 
methods. A method is a function only accessible via a class or any of it's instance. 

Methods differ from functions also in how they are defined. To define a method in a class, create it like a regular function 
**without the `def` keyword**.

For example:

```blade-repl
%> class MyClass {
..   do_something() {
..     echo 'I am a method'
..   }
.. }
```

The methods on of a class can be called from an instance of the class by typing a dot (`.`) followed by the name of the 
method and parenthesis (`()`) as you will do in a normal function.

```blade-repl
%> MyClass().do_something()
'I am a method'
```

> Methods accept arguments just like any other function and/or return values. They can also contain closures or even another 
> class with it's own set of methods as well.


## Constructor
---

When creating an instance of a class, Blade checks to see if a constructor was defined for the class and executes that after 
creating the instance. A constructor is a special function that will always be called when creating new instances of a class. 
If a class defines a constructor, the constructor automatically defines the parameters to every new instance of the class.

To create a constructor, simply create a function within the class having the same name as the class.

For example,

```blade-repl
%> class Person {
..   Person(name) {
..     self.name = name
..   }
.. 
..   greet() {
..     echo 'Hello, I am ${self.name}'
..   }
.. }
%> var person = Person('Biggie')
%> person.greet()
'Hello, I am Biggie'
```

<br>

{:class="pop"}
> **_@note_** Did you notice that `self` keyword? That's how a member of a class references other members of the class.


## Fields
---

Blade classes can have fields (akin to fields in Java). This fields can be anything from a number to a function 
(basically any value that can be assigned). 

For example:

> If you are a _`Cat`_ person... Sorry in advance!

```blade-repl
%> class Animal {
..   var favorite = 'Dog'
.. }
%> var my_animal = Animal()
%> my_animal.favorite
'Dog'
```

An instance of a class can declare custom fields or methods (known as _`properties`_) as desired without affecting the definitions in the original class.

For example, using our previous example; we can have:

```blade-repl
%> my_animal.age = 13   # instance propery
%> my_animal.age        # accessed like a class field
13
%> my_animal.method = |x| {   # instance method via an anonymous function
..   return x++
.. }
%> my_animal.method(4)  # calling instance method
5
```


## Inheritance
---

Blade supports single inheritance via the inherit (or less-than &mdash; `<`) operator. A class can only inherit public members 
of the parent class.

For example:

```blade-repl
%> class Base {
..   run() {
..     echo 'I am a class'
..   }
.. }
%> 
%> class Derived < Base {}
%> 
%> Derived().run()
'I am a class'
```

One can easily check if a class is derived from another using the [`is_instance()`](./builtin-functions#is_instance) function. For example:

```blade-repl
%> var derived = Derived()
%> is_instance(derived, Base)
true
```


## Access and Visibility
---

Members of a class can access or reference other members of the same class using the `self` keyword or members of a parent class using the `parent` keyword. .

For example:

```blade-repl
%> class MyClass {
..   var prop = 42
.. 
..   MyClass() {
..     self.prop2 = 83
..   }
.. 
..   show() {
..     echo self.prop
..     echo self.prop2
..   }
.. }
%> 
%> MyClass().show()
42
83
```

A call to the parent constructor can be made via the `parent` keyword with a reference to the parent class name or by 
calling the `parent()` function and pass arguments as defined by the parent class. 

For example:

```blade-repl
%> class Base {
..   Base() {
..     echo 'Called base class'
..   }
.. 
..   run() {
..     echo 'Called base class again'
..   }
.. }
%> 
%> class Derived < Base {
..   Derived() {
..     parent()
..     echo 'Called the derived class'
..   }
.. 
..   run_again() {
..     parent.run()
..     echo 'Called the derived class again'
..   }
.. }
%> 
%> var derived = Derived()
'Called base class'
'Called the derived class'
%> derived.run()
'Called base class again'
nil
%> derived.run_again()
'Called base class again'
'Called the derived class again'
nil
```

> **_@note_** The `parent()` function is only valid in a constructor and elsewhere will be a syntax error.

Members of a class can be made private to a classs (i.e. only callable within the creating class) by starting their name with 
an underscore (`_`). In order words, all class members whose name starts with an underscore (`_`) can only be called by other 
members in the class.

For example:

```blade-repl
%> class HasPrivate {
..   var _value = 31
.. 
..   get_value() {
..    return self._value
..   }
.. }
%> 
%> var private = HasPrivate()
%> private.get_value()
31
%> private._value
Unhandled Exception: cannot call private property '_value' from instance of HasPrivate
  StackTrace:
    File: <repl>, Line: 1, In: <script>
```

Blade also support _static_ class members. A static member of a class is a member that can not only be accessed by instances 
of the class, but they can be accessed directly by the class object themselves without having to create an instance. In Blade, 
static members are not static to the instance but rather to the class itself.

For example:

```blade-repl
%> class HasStatic {
..   static var my_static_field 
.. 
..   static my_static_method() {
..     return HasStatic.my_static_field
..   }
.. }
%> 
%> HasStatic.my_static_field
nil
%> 
%> HasStatic().my_static_field
Unhandled Exception: undefined property 'my_static_field'
  StackTrace:
    File: <repl>, Line: 1, In: <script>
%> 
%> HasStatic.my_static_method()
nil
```


## Decorators
---

Blade _decorators_ are special syntaxed functions that is used to provide details on how to interope a function with other 
language features. 

Along this course of this tutorial, we have seen how a for statement can be used loop through iterables and have defined a few 
iterables such as [strings](./strings), [lists](./lists), [dictionaries](./dictionaries) etc. 

Why are these objects iterables?

The answer is simple. Because the implement certain _decorators_ that tells Blade how to use them in a for loop, namely 
&mdash; `@iter()` and `@itern()`. This is also the same technique empolyed by almost all native functions that allows users 
to override/alter how they behave (e.g. `@to_string()` overrides `to_string()`).

Blade allows users to define decorators as desired. This gives library implementers a sleek way to offer streamlined features 
from their package/modules by offering custom behaviors defined by decorators.

Decorators are regular class methods except that their name starts with the `@` sign. 

For example:

```blade-repl
%> class DecoratorTest {
..   @my_decor() {
..     return 1
..   }
.. }
```

Decorators cannot be called directly in code, but they can be accessed via the `getprop()` features. Infact, the `getprop()`, 
`setprop()` and `hasprop()` were created specifically for decorators but of course, they can be used as deem fit for the 
problems you may want to solve.

Let's look at the following brilliant use of decorators as an example:

```blade-repl
%> def show_docs(obj) {
..   var doc = getprop(obj, '@doc')
..   if doc {
..     echo doc()
..   }
.. }
%> 
%> class MyLibraryImplementation {
..   @doc() {
..     return 'This docs will be shown only in my library'
..   }
.. }
%> 
%> # note that you cannot call this method yourself
%> # or from any blade scipt
%> MyLibraryImplementation().@docs()
SyntaxError:
    File: <repl>, Line: 1
    Error at '@docs': expected property name after '.'
%> 
%> # but our library's show_docs() function can print that documenation
%> show_docs(MyLibraryImplementation())
'This docs will be shown only in my library'
```

Decorators open an endless possibility for libraries to implement beautiful features.


## Iterable Classes
---

In Blade, any class can be converted into an iterable provided that the class implements the following iterators:

- `@itern(x)` also known as the `iterator index decorator` which accepts a single value that is equal to the value returned by 
  the last call to `@itern()` or `nil` if there was no previous call to `@itern()` and returns a value equal to the current index or key in a consistent iteration of the object.
- `@iter(x)` also known as the `iterator value decorator` which accepts a single value equal to the value returned by the last 
  call to `@itern()` and returns the value at the key/index returned by the last call to `@itern()`.

For example,

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


## Overriding built-in functions
---

As previously discussed, the result of most built-in functions with a general exception for all methods with names in 
the format `is_...` support overrides from classes via decorators in the format `@to_[method name]`. For example, the 
[`abs()`](./builtin-functions#abs) method can be overriden by implementing the decorator `@to_abs()`. The exception to this 
naming convenction are methods whose name are in the form `to_...` in which case the `to_` prepend will be omitted.

For example:

```blade-repl
%> to_string(200)
'200'
%> 
%> # without override
%> class Person {
..  var name = 'Kelvin'
.. }
%> to_string(Person())
Unhandled Exception: undefined method '@to_string' in Person
  StackTrace:
    File: <repl>, Line: 1, In: <script>
%> 
%> # with override
%> class Person {
..   var name = 'Kelvin'
..   @to_string() {
..     return '<Person ${self.name}>'
..   }
.. }
%> to_string(Person())
'<Person Kelvin>'
```

The overriding decorator must accept `n - 1` arguments, where `n` is the number of arguments of the original built-in 
functions. For example, the `to_string()` function accepts 1 parameter and the override `@to_string()` above accepts `1 - 1 = 0` arguments.

Check the [builtin functions](./builtin-functions) documentation for more information on the functions that support value 
overriding and those that do not.




<br><br>

[Previous Topic](./builtin-functions) | [Next Topic](./working-with-files)