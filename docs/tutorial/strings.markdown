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

```blade
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

```blade
> print("It's the \"\\\" character")
It's the "\" character
```


<br><br>

[Previous Topic](./numbers) | [Next Topic](./variables)