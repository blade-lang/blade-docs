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

> **Convention:** Omit the parenthesis unless it make the expression clearer.

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

## Tenary Operators
---





<br><br>

[Previous Topic](./reserved) | [Next Topic](./loops)