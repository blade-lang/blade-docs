---
layout: default
title: Decision Making
parent: Tutorial
nav_order: 8
permalink: /tutorial/decision-making
---

# Decision Making

Blade wouldn't be a complete usable language if all you can do is manipulating strings and numbers. 
Blade let's you do more. Blade has powerful features to help you make decisions, control the flow 
of executables and more like you'll expect in any programming language worth using at all.

For this chapter, we'll be focusing on the tools Blade has in it's arsenal for making decisions.

## if Statements
---

From previous experience in other programming languages, the `if` statement is by far the most popular 
and used control flow in any programming language. For anyone coming from lanaguages like Java or C++, 
Blade's _if_ statement will be directly intuitive to you and maybe even more familiar to a Go developer.

For example:

```blade-repl
%> var a = 25
%> if a > 10 {
..   print('a is greater than 10')
.. }
a is greater than 10
```

> **Important:** In a Blade block, the last statement can ommit the newline before closing the block 
> with the right brace (`}`)

Now, take a moment and consider the code above. For those familiar with Java, C++ or similar languages, 
you should note that unlike those languages, the `if` statement does not required parenthesis (`(`) 
round it's condition, but it can be used if desired for grouping. 

For example, we can rewrite the above _if_ statement as follows:

```blade-repl
%> if (a > 10) {
..   print('a is greater than 10')
.. }
```

> **_@convention:_** Omit the parenthesis unless it make the expression clearer.

The `if` statement also support an `else` statement that must follow after it, which will execute when 
the condition in the `if` statement is not true. 

For example:

```blade-repl
%> var age = 93
%> if age < 65 {
..   echo 'User is not retired'
.. } else {
..   echo 'User is retired'
.. }
'User is retired'
```

The `else` statement can have another `if` statement as it's own block. For example:

```blade-repl
%> if a < 18 {
..   echo 'User is a child'
.. } else if age > 65 {
..   echo 'User is retired'
.. } else {
..   echo 'User is working class'
.. }
'User is retired'
```

**If you are only going to be having one statement in your `if` block, or any block in general, 
you can ommit the braces (`{}`) completely**
 
For example:
 
```blade-repl
%> if age == 93 echo 'User is 93'
'User is 93'
```

Another example that explores using a semi-colon (`;`) as a statement terminator:

```blade-repl
%> if age == 5 echo 'User is 5'; else echo 'User is 93'
'User is 93'
```

Multiple conditions can be evaluated together using `and` and `or` as applicable to the statement. 
For example:

```blade-repl
%> var a = 20
%> if a > 5 and a <= 20 {
..   echo 'Both conditions are true'
.. }
'Both conditions are true'
%> if a < 5 or a > 10 {
..   echo 'One of the condition is true'
.. }
'One of the condition is true'
```


## Tenary Operators
---

The tenary (or conditional) operator like in most languages that supports it takes three operands.

1. The condition followed by a question mark (`?`)
2. An expression to evaluate if the condition is true, followed by a colon (`:`)
3. An expression to evaluate when the condition is false.

For example:

```blade-repl
%> 10 ? 'ok' : 'no'
'ok'
%> var a = 10 > 5 ? 21 : 19  # used to determine variable value
%> a
21
```

## using Statements
---

The _using_ statement in Blade is akin to the _switch_ statement in C/C++ (or Java if you insist I 
mention it). When there are two or more **_predefined_** options to react to or decide on, the 
`using` statement offers superior speed when compared to multiple/nested _if_ blocks. The emphasis 
here is on _predefined_. 

`using` statements are simply lookup tables for a predefined set of options and code bound to each 
option. Each option must be defined using the `when` keyword followed by the option value, then a 
statement or block of code to execute. Blade will only execute a matching block or do nothing if no 
match is found.

For example:

```blade-repl
%> var name = 'Larry'
%> using name {
..   when 'James' echo 'My name is James'
..   when 'Larry' echo 'My name is Larry'
.. }
'My name is Larry'
```

The values given to the `when` keyword must be constants, i.e. expressions such as `2 + 2` or using 
a variable will raise a syntax error. For example:

```blade-repl
%> using true {
..   when (2 * 5) echo 'Bug'
.. }
SyntaxError at '(': only constants can be used in when expressions
  <repl>:2
SyntaxError at '}': expected expression
  <repl>:3
```

For those coming from the Java or C++, take notice that there is no use of the `break` keyword. 
In fact, it is a syntax error to use a break keyword here. For example,

```blade-repl
%> using 1 {
..   when 1 break
.. }
SyntaxError at 'break': 'break' can only be used in a loop
  <repl>:2
```

The using statement also support a `default` case which will be executed if given whenever a match 
could not be found. For example:

```blade-repl
%> var a = 25 
%> using a {
..   when true echo 'It\'s true'
..   when false echo 'I don\'t even understand'
..   default echo 'It\'s 25'
.. }
"It's 25"
```

To have more than one statement in the `when` option, simply use a block. For example:

```blade-repl
%> var age = 30 
%> using age {
..   when 25 {
..     age++
..     echo 'Age increased'
..   }
..   default {
..     age--
..     echo 'Age reduced'
..   }
.. }
'Age reduced'
```

<br><br>

[Previous Topic](./reserved) | [Next Topic](./loops){:class="float-right"}