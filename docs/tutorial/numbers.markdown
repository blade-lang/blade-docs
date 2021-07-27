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

```blade-repl
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

## Arithmetic Operations
---

Numbers can be used in expressions and all arithmetic operators works on `Number` just as you would expect
in any other language. Parenthesis `()` can be used to group expression together as well. The 
operators `+`, `-`, `*`, `/` work exactly as you expect them to work.

For example:

```blade-repl
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

```blade-repl
> 17 / 5 # normal divison returns a floating-point number
3.4
> 17 // 5 # floor division discards the fractional part
3
> 17 % 5 # returns the reminder after the division
2
> 3 ** 2 # 3 squared
9
> 2 ** 5 # 2 to the power of 5
32
> 2 ** 0.5 # 2 raise to power half i.e. square root of 2
1.414213562373095
```


## Relational (Comparison) Operators
---

Blade also supports greater-than (`>`) and less-than (`<`) comparison of Numbers as well as
equality comparison using equal-to (`==`), not-equal-to (`!=`) as well as complex ones including
greater-or-equal-to (`>=`) and less-or-equal-to (`<`).

For example:

```blade-repl
> 10 > 5
true
> 21 < 4
false
> 12 >= 9
true
> 56 <= 58
true
> 31 == 31.0
true
> 46.000 != 46.00
false
```


## Logical Operator
---

There are three (`3`) logical operators in Blade &mdash; `and`, `or`, `!`, and all object types including Numbers support 
all logical operators.

For example:

```blade-repl
> 5 > -1 or 4 < 6
true
> 11 > 4 and 21 < 18
false
> !5
false
> !(51 > 5)
false
> !(21 < 40 and 11 > 13)
true
```

## Bitwise Operations
---

Blade supports all standard bitwise operations and they look the same as they appear in any other
programming language. If you are coming from a language such as Java, then it's important to note
that due to how Blade represents numbers internally, blade does not support the unsigned right shift operator (`>>>`) and unsigned left shift operator (`<<<`). 

Every bitwise operator except the NOT (`~`) operator operates on binary information (i.e. on two 
objects). The operators are as follows:

| Operator | Name         | Description |
|----------|--------------|-------------|
| x `&` y  | AND          | Does a "bitwise and". |
| x `|` y  | OR           | Does a "bitwise or". |
| x `^` y  | Exclusive OR | Returns the complement of x. This is the same as -x - 1. |
| `~`x     | NOT          | Does a "bitwise exclusive or". |
| x `>>` y | Right Shift  | Returns x with the bits shifted to the right by y places. |
| x `<<` y | Left Shift   | Returns x with the bits shifted to the left by y places. |

For example:

```blade-repl
> 10 & 2
2
> 10 | 4
14
> 10 ^ 4
14
> 10 >> 2
2
> 10 << 2
40
> ~10
-11
```


## Operator Precedence
---

The following table lists all operators from highest precedence to lowest in Blade.

| Precedence | Operators |
|------------|-----------|
| Postfix*      | `++`, `--` |
| Unary      | `-x`, `+x`, `~`, `!` |
| Mulplicative | `*`, `/`, `%`, `**`, `//` |
| Additive | `+`, `-` |
| Range | `..` |
| Shift | `<<`, `>>` |
| Bitwise AND | `&` |
| Bitwise XOR | `^` |
| Bitwise OR | `|` |
| Relational | `<`, `>`, `<=`, `>=` |
| Equality | `==`, `!=` |
| Logical and | `and` |
| Logical or | `or` |
| Tenary | `?`, `:` |
| Assignment | `=`, `&=`, `|=`, `*=`, `+=`, `-=`, `/=`, `**=`, `%=`, `>>=`, `<<=`, `^=`, `//=` |

> Note that unlike Java, while Blade supports the `++` and `--` operators, they cannot be used in
> an expresssion outside of an `iter` loop. In every other place, they are statements.

In general-purpose programming, certain operators tend to appear more frequently than others; 
for example, the assignment operator (`=`) is far more common than the right shift operator (`>>`). 
With that in mind, the rest of the tutorial will focus more on the operators that you're most 
likely to use on a regular basis and since most other will be used by great men who know exactly 
what they are doing, we have chosen common syntaxes seen across multiple programming languages 
enough that this legends will be sure to not need another lesson on how to use them.


<br><br>

[Previous Topic](./comments) | [Next Topic](./strings)