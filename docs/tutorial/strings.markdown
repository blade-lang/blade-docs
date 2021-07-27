---
layout: default
title: Strings
parent: Tutorial
nav_order: 5
permalink: /tutorial/strings
---

# Strings

Blade has a very rich support for strings and they can be expressed in several ways. In Blade, 
strings are denoted by enclosing characters in pairs of single quotes (`'...'`) or pairs of 
double quotes (`"..."`) and they are essentially the same.

When strings are wrapped in `'` or `"`, you can escape that quotation within the string using 
the backslash (`\`).

For example:

```blade-repl
> 'string in single quote'
'string in single quote'
> "another version with double quotes"
'another version with double quotes'
> 'What\'s the escape character?'
"What's the escape character?"
> "It's the \"\\\" character"
"It's the "\" character"
```

> All Blade strings can span multiple lines whether created using single (`'`) or double (`"`) quotes.
>
> For example:
> ```blade-repl
> > 'Hello
>   World'
> 'Hello
> World'
> > "I am
>   a living
>   Legend!"
> 'I am
> a living
> Legend!'
> ```

In the REPL mode, strings are enclosed in quotes based on the kind of data they contains. If a
string contains no quote, it is wrapped in single quotes (`'...'`). If it contains a single quote,
it is wrapped in double quotes (`"..."`). If it contains both, the latter is used. This is simply
for presentation purpose. This is to discourage readers from confusing them with language schematics.

The `print()` function produces a result that is more like what you'd expect. It does no extra 
processing of the output.

For example:

```blade-repl
> print("It's the \"\\\" character")
It's the "\" character
```

Blade strings support a lot of special characters called `escape sequence` for formatting and 
they also need to be escaped with `\` as follows:

| Sequence | Meaning |
|----------|---------|
| `\a` | Alert (Beep, Bell) |
| `\b` | Backspace |
| `\f` | Formfeed Page Break |
| `\n` | Newline |
| `\r` | Carriage Return |
| `\t` | Horizontal Tab |
| `\v` | Vertical Tab |
| `\\` | Backslash |
| `\'` | Single Quotation Mark |
| `\"` | Dobule Quotation Mark |
| `\0` | String terminator |
| `\$` | Escape for interpolated strings |
| `\xhh` | Hexadecimal number |
| `\uhhhh` | Unicode code point below 10000 hexadecimal |
| `\Uhhhhhhhhh` | Unicode code point where h is a hexadecimal digit |

> 1. _`h`_ stands for hexadecimal digit.
> 2. `\0` used anywhere in a string will cause the rest of the string to be ignored and useless.
> 3. `\$` _See the `Interpolated Strings` section below._
> 4. `\u` takes 4 hexadecimal digits _h_ after it.
> 5. `\U` takes 8 hexadecimal digits _h_ after it.


## Unicode and UTF-8
---

As mentioned in the previous section, Blade strings fully supports unicode and are UTF-8 encoded by default.
Unicode code points can be represented using Unicode `\u` and `\U` escape sequences.

For example,

```blade-repl
> '\u00a9'
'©'
> '10\u00B5s'
'10µs'
> '\U0002B695 is a chinese character'
'𫚕 is a chinese character'
```

Unicode characters can also be written directly in strings. This means, that in a Blade string, you can
actually use advanced texts like smilies, trademarks and many more directly in your source code.

For example:

```blade-repl
> 'I am 😀'
'I am 😀'
> 'Black ♞ rule'
'Black ♞ rule'
> '道可道非常道，名可名非常名'
'道可道非常道，名可名非常名'
```

To verify our UTF-8 support, how about we try to get the length of the chinese string `名可名非常名`. 
With UTF-8 support, the length of this string should be six (6) and much longer without UTF-8 support. 
To get the length of the string, we can call it's `length()` method.

For example,

```blade-repl
> '名可名非常名'.length()
6
> 'Hello, World'.length() # compared with English text
12
```

As you can see, Blade returns the correct length irrespective of the language of the source text.


## String Interpolation
---

As we write more code, we seldom find ourselves needing to join two strings together or at other times,
join a string to a declared variable. Some other times, we want to have the result of an operation or 
expression within our string. All of these operations can soon become pretty verbose and tedious. Blade
allows _interpolation_ into string literals using the `$` character just as can be seen in Perl and Dart.

For example:

```blade-repl
> 'Sum after addition = ${10 + 15}'
'Sum after addition = 25'
```

The above example shows the general construct for string interpolation. Start interpolation with the 
dollar (`$`) character, and wrap the interpolated expression within curly braces `{}` as shown above.

For another example, let's say we have two variables `x` and `y` declared as `Number` and `String` 
respectively and we want to have them _concatenated_ to our string at some location, we can have 
something like the following:

```blade-repl
> 'We have ${x} crates of ${y}'
'We have 20 crates of eggs'
```

To write the interpolation expression within a string without interpreting it, we need to escape the `$`
with a backslash (`\`) as follows:

```blade-repl
> 'Sample interpolation: \${x * y}'
'Sample interpolation: ${x * y}'
```

## Characters
---

In Blade, _Characters_ are essentially strings with a length of one (1). No more, no less! However, there are 
times when we require Characters over Strings. For example, the builtin `ord()` function expects a character
and not a String. While this distinction looks thin, it is a very important distinction that must be put
to heart.

Characters are also UTF-8 compliant.

The sample code below shows an example of the clear distinctive use of characters and strings.

```blade-repl
> echo ord('A')
65
> echo ord('AB')
Unhandled Exception: ord() expects character as argument, string given
  StackTrace:
    File: <repl>, Line: 1, In: <script>
```

A more complex example that skips a lot into the future of this tutorial is given as below for reference.

```blade-repl
> import types
> types.char('a')
true
> types.char('ab')
false
> types.char('地')
true
> types.char('地点')
false
```

## String Operations
---

## Regular Expressions
---


<br><br>

[Previous Topic](./numbers) | [Next Topic](./variables)