---
layout: default
title: Hello, World
parent: Tutorial
nav_order: 2
permalink: /tutorial/hello
---

# Hello, World

In this chapter, we are going to learn about how to write a basic Hello, World application as well
as try our hands on something a little more exiting than that.

At the end of the chapter, you should be more motivated to learn Blade.


## Starting the interpreter
---

If you've had any experience at all with programming, then you'll be familiar with an interactive
shell. Incase you don't know, an interactive shell is an application that when run, prompts for
commands, does something based on them (execution) and either asks for another command, prints a
result or both. 

Blade comes withn an interactive shell also knwon as the REPL mode (Read-Evaluate-Print-Loop). This
mode allows you to quickly execute or test out ideas without writing a complete program (Er... depends
on what you call a complete program).

To start Blade in the REPL mode, simply type the following command in your terminal.

```terminal
$ blade
```

You should be presented with a screen looking like the below:

```terminal
Blade 0.0.5 (running on BladeVM 0.0.5), REPL/Interactive mode = ON
Clang 12.0.0, (Build time = Jul 22 2021, 16:03:05)
Type "exit()" to quit, "help()" or "credits()" for more information
> 
```

You might see a few differences depending on your operating system, the build and version you have 
installed. However, at a minimum, you should see a welcome message and at lease a version number
as well as tips on how to get more help or exit the REPL.

The Blade REPL prompts for the next command with the greater-than (`>`) sign or a continuation with
the bar (`|`) sign. You can exit the REPL mode by typing `exit()` and pressing the ENTER key or simply
by pressing the combination `Ctrl`+`D`.




<br><br>

[Previous Topic](./intro) | [Next Topic](./numbers)