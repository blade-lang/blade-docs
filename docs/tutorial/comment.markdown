---
layout: default
title: Comments
parent: Tutorial
nav_order: 3
permalink: /tutorial/comments
---

# Comments

Comments in any programming language that supports them are a way to tell a 
compiler or an interpreter to ignore certain parts of a code or script and 
not execcute them.

Blade supports like most languages a Single Line Comment and a Multi-line 
Comment (otherwise known as Block Comments).

## Single line comments
---

A single line comment in Blade starts with an hash (`#`) character and can appear anywhere in a REPL session or a script except between two single (`'`) or double (`"`) quotation marks. A single line comment can start the entire line or be inserted later in a line.

```blade
> # this is my first Blade single line comment
> echo 'Not a #comment'    # assigning x to 15
'Not a #comment'
> # and I am just inserting the comment for fun
> # echo 'Hello there!'
```

You can go ahead and try this lines out in the REPL. You'll see that only the second line has an effect and even that line was treated as if we never
wrote that `assigning x to 15` part.

> Also notice how the `#` within the single quotes (`'`) was echoed to screen. Because within those quotes, `#` does not interpret as a commet but 
rather as the hash that it is.


## Multi-line (Block) comments
---

Somtimes, we want comments that span multiple lines. For example, we could
want to insert a long textual description of what a piece of code does, what
code is contained in the file or simple stop a long piece of code suspected 
to be causing bugs from running i.e. for debugging. In this scenarios and
many alike, a multi-line or block comment is preferred.

You can create block comments as follows:

```blade
/*
This 
is a comment 
that spans 
multiple 
lines
*/
```

> It's important to known that while the REPL supports the block comment
> syntax, **for now**, it _only_ supports writing a block comment on a single line.
> So in a REPL session, the above sample may fails. But you can definitely
> write something like:
>
> ```blade
> > /* A block comment */
> ```


<br><br>

[Previous Topic](./hello) | [Next Topic](./numbers)