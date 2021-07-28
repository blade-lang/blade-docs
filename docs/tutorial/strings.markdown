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
> 3. `\$` _See the [`Interpolated Strings`](#string-interpolation) section below._
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

> Characters are always interchangeable for strings, but not the reverse.

## String Operations
---

Blade strings support multiple operations categorized into one of the following four groups.

Two or more strings can be concatenated (glued together) via the `+` operator whether it's a literal or 
a variable, and a specific string can be repeated by multiplying it with a number via the `*` operator. 

For example:

```blade-repl
> 'str' + 'ing'
'string'
> 'abc' * 4 # repeating 'abc' four times
'abcabcabcabc'
> 'hat!' * 4 + 'rick' # and even in a more complex form
'hat!hat!hat!hat!rick'
```

The `+` operator is quite powerful with a string, allowing you to add a string to a number or a number 
to a string.

For example,

```blade-repl
> 5 + 'alive'
'5alive'
> 'Base' + 64
'Base64'
```

Strings can also be checked for equality or inequality as needed. For example:

```blade-repl
> "abracadabra" == "xylophone"
false
> "Hello, world." != "Goodbye, world."
true
> "1 + 2 = 3" == "1 + 2 = ${1 + 2}"
true
```

Strings indexes can be accessed. The first character of a Blade string have an index of `0`. The result of 
string indexes are characters.

For example:

```blade-repl
> 'Hello'[0]
'H'
> 'Hello'[3]
'l'
```

Strings indexes can also be accessed with negative numbers. When using negative numbers to access string
indexes, note that the indexes will be returned in reverse. i.e. we start counting from the far right
where the first index will be `-1` (since -0 is the same as 0).

For example:

```blade-repl
> 'Hello'[-1]
'o'
> 'Hello'[-4]
'e'
```

Note that trying to access a non-existing index or an index out of the range of the length of the string
will result in an error.

For example, the following code throws an exception.

```blade-repl
> 'Hello'[6]
Unhandled Exception: string index 6 out of range
  StackTrace:
    File: <repl>, Line: 1, In: <script>
```

In addition to indexing, slicing is also supported. While indexing is used to obtain individual characters, slicing allows you to obtain subparts of a string.

For example:

```blade-repl
> 'Blade'[0,3] # characters starting from index 0 to index 3 - 1 (2)
'Bla'
> 'Blade'[2,5] # characters from index 2 to index 5 - 1 (4)
'ade'
```

The general syntax for slicing in Blade is `[lower limit, upper limit]`. Both lower limit and upper limit
can be omitted. When the lower limit is omitted, it defaults to `0` and when the upper limit is omitted,
it defaults to the length of the object e.g. the string length.

As with general indexing, the upper limit can also use negative numbers and follows the same rules as 
indexing with a negative number. A negative number in the lower limit will cause an empty object to be 
returned.

> 1. Slices are lower limit inclusive and upper limit exclusive. For example, slice `[0,3]` will return
> a substring starting from index `0` (inclusive) to index `2` and index itself will be excluded.
> 2. Index `in[,i] + in[i,]` is equal to the value of `in`. 

For example:

```blade-repl
> 'Blade'[0,3]  # starting from index 0 to 2
'Bla'
> 'Blade'[2,5]  # starting from index 2 to 4
'ade'
> 'Blade'[,]   # starting from index 0 to the end
'Blade'
> 'Blade'[,-3]   # starting from index 0 to string length - 3
'Bl'
> 'Blade'[3,]  # starting from index 3 to the end
'de'
> 'Blade'[-1,]  # negative index in lower limit returns an empty string
''
> 'Blade'[,4]   # starting from index 0 to 3
'Blad'
> 'Blade'[,3] + 'Blade'[3,]     # in[,i] + in[i,]
'Blade'
```

Blade strings are immutable. Hence, a string cannot be changed. Assigning to an indexed position in the string results in an error:

For example,

```blade-repl
> 'Blade'[0] = 'J'
Unhandled Exception: strings do not support object assignment
  StackTrace:
    File: <repl>, Line: 1, In: <script>
```

> You may notice how we are trying to assign to a string object directly instead of a variable and think
> that's why it isn't working. That's not why! In blade, if string wasn't immutable (e.g. Lists aren't 
> immutable), Blade will go ahead and do that assignment. The fact that you aren't storing that value 
> anywhere is up to you. But it's neither a syntax nor runtime error to do so.

If you need to to modify a string, you need to create a new one. Don't worry, Blade is smart enough to 
know when you don't need a string anymore and will gracefully delete the string for memory when necessary.


---
**_If you have no previous experience with C style languages or don't know what methods are, you may which 
to proceed into the [next](./variables) topic of the tutorial and come back here after you've completed 
the [Class](./class) tutorial._**

---

## String Methods
---

## Regular Expressions
---


<br><br>

[Previous Topic](./numbers) | [Next Topic](./variables)