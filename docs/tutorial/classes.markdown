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

One can easily check if a class is derived from another using the [`is_instance()`](http://localhost:4000/tutorial/builtin-functions#is_instance) function. For example:

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
..  var _value = 31
.. 
..  get_value() {
..   return self._value
..  }
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
..  static var my_static_field 
.. 
..  static my_static_method() {
..   return HasStatic.my_static_field
..  }
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


## Iterable Classes
---


## Overriding built-in functions
---




<br><br>

[Previous Topic](./builtin-functions) | [Next Topic](./type-casting)