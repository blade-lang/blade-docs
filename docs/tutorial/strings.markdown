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




<br><br>

[Previous Topic](./numbers) | [Next Topic](./variables)