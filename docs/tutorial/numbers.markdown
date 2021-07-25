---
layout: default
title: Numbers & Operators
parent: Tutorial
nav_order: 4
permalink: /tutorial/numbers
---


# Numbers

In Blade, all numeric types have just one type &mdash; Number. 

Numbers in Blade are just like you will expect in any programming language. 
The `Number` type can hold integer, floating-point, real, hexadecimal, 
octal and binary numbers. 

For example:

```blade
> echo 21 # integer
21
> echo 50.6 # floating-point number
50.6
> echo -103 # real number
-103
> echo 0xF1ABC3 # hexadecimal number
15838147
> echo 0c476 # octal number
318
> echo 0b1101 # binary number
13
```

Numbers can be used in expressions and all operators works on `Number` just as you would expect
in any other language. Parenthesis `()` can be used to group expression together as well. The 
operators `+`, `-`, `*`, `/` work exactly as you expect them to work.

For example:

```blade
> 5 + 6
11
> 21 + 7 - 8
20
> 3 * 4 + 5
17
> 16 / 4
4
> (30 / 3) * 4
40
> (2 / 11) * ((21 / 3) + ((4 / 3) - (16 / 5)))
0.9333333333333332
```

To do floor division and get an integer result (discarding any fractional result) you can use 
the `//` operator, to get the remainder of a division, use the `%` operator. Use the `**` operator 
to calculate powers.

For example:

```blade
```






<br><br>

[Previous Topic](./comments) | [Next Topic](./strings)