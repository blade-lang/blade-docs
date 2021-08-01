---
layout: default
title: Variables
parent: Tutorial
nav_order: 6
permalink: /tutorial/variables
---

# Variables

Variables are a basic building block in programming and they are basically memorable names associated 
with values within a codespace that can be used to refer to the said value latter in the code.

In Blade, the process of declaring a variable and assigning to a value to it are two distinct and 
non-dependent actions. To declare a variable, use the `var` keyword. Any variable declared without a 
value will automatically be assigned the value `nil`.

For example:

```blade-repl
%> var a 
%> a
nil
```

To assign or reassign/overwrite the value of a declared variable, you can simply use the `=` operator. 
For example,

```blade-repl
%> a = 25
%> a
25
%> a = 'Hello, World'
%> a
'Hello, World'
```

Due to the frequent need to declare and assign values to variables, Blade allows you to declare a variable
and assign value to it using a continious statement as follows:

```blade-repl
%> var a = 'Great!'
%> a
'Great!'
```

Blade also allows chaining variable declarations as well as it's assignment form discussed just now using
a comma (`,`) as a separator.

For example:

```blade-repl
%> var animal, food   # declaration without assignment
%> animal
nil
%> food
nil
%> 
%> var name = 'Joe', age = 31, is_adult = true  # declaration with assignment
%> name
'Joe'
%> age
31
%> is_adult
true
```

Anything can be assigned to a value.

## Valid variable names
---

A valid variable name in Blade follows the C convention. A variable name must start with either an ASCII alphabet (`A to Z` 
whether in the lower or upper case) or and underscore (`_`), followed by zero or more combinations of ASCII alphabets, numbers 
or underscore.

For example:

`_`, `a`, `_9`, `_test`, `test`, `another_test`, `Big_test`, `AVeryBigText`, `rot13` etc.

> **_Reserved words cannot be used as variable names_**

The following variable declaration is bound to fail as it makes use of a reserved word and will trigger a `SyntaxError`.

```blade-repl
%> echo = 'Failure!'
SyntaxError:
    File: <repl>, Line: 1
    Error at '=': expected expression
```

## Variable scopes

Blade variables are scoped to their parent block and do not override or hide variables declared outside the given block. For example:

```blade-repl
%> var a = 200
%> {
..   var a = 100
..   {
..     var a =  50
..     echo a
..   }
..   echo a
.. }
50
100
%> echo a
200
```

Scopes are in the following hierarchy in _descending_ order.

- **Module**: Variables declared globally in a module, accessible to all scopes in the module.
- **Instance**: Variables bound specifically to an instance of a class.
- **Class**: Variables belonging to a class shared by all child functions and instances.
- **Function**: Variables declared within a function. This is the same as the local scope.
- **Blocks**: Variables declared within a block. E.g. `if`, `while` block.


## Naming Convention

While Blade as a language does not restrict the user to any particular naming convention, throughout
this tutorial and the entire documentation, the following conventions will be adhered to. The Blade
community is adviced but not required to try to comply with the convention.

> **_The convention stated below is subject to improvement and all suggestions are welcomed and 
> will be treated with high regards._**

<br>

1. Prefer snake case variables over camel case variables. For example, instead of `myVar`, use
  `my_var`.
2. Function names begin with lower case. For example, `my_function`.
3. Class names begins in upper case and are preferably camel cased. For example, `MyClass`.
4. File and directory names are preferably in lower case and spaces in the names treated with 
   snake casing. This help to keep module and packages names for importation in-tune with the
   rest of the codebase. For example, instead of `MyPackage/MyFile.b`, use `my_package/my_file.b`.

<br>
> A few other conventions exits, but they are not highlighted here as they are REQUIRED and DEFINED
> by the language and cannot be altered. For example, to make a method private to a class, the name
> is _required_ to start with an `_`. Other conventions similar to this exists and are not covered
> here but under their respective topics.



<br><br>

[Previous Topic](./strings) | [Next Topic](./reserved)