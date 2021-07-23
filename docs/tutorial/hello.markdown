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
commands, does something based on them (execution) and either prints a
result, asks for another command or both in that order. 

Blade comes with an interactive shell also knwon as the REPL (Read-Evaluate-Print-Loop) mode. This
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


## The Hello, World program
---

Following in the footsteps of legends, we are going to start learning Blade by writing a simple _Hello, World_
application. Now, fire up your Blade REPL, type the following and press ENTER.

```blade
> echo 'Hello, World'
```

You should see the text `'Hello, World'` printed immediately after it. Congratulation, you've written your first
Blade program! The `'` surrounding our text is because we are in the REPL and serves as an easy way to identify
strings in the REPL output.

Now, let's try something a little more fun shall we? 

Create a file somewhere on your computer and name it `hello.b`. Now, the following program into the file and 
save it. 

```blade
print('Hello, World')
```

Have you done that? Ok. Now, navigate to the folder/directory containing your file in 
your preferred terminal (Err... is that Windows? Open the command prompt). Are you there? Now type the 
following command.

```terminal
$ blade hello.b
```

Can you see it? Now you are a Blade ninja! You now know two ways to print something to screen and you can use 
the REPL and a file to create a Blade program. Give yourself a pat on the back and tell yourself weldone. You did good.

For those of you who still can't see it, pick a sledge hammer, smash your computer and go get something modern.

We'll learn more about the `print` thing you saw there later. For now, it's good enough to know that there are two ways show something on the screen. 

1. Using the `echo` command
2. Using the `print` function

You'll see how they differ when we explain `print` better [here](./tutorial/builtin-functions).


## Blade the Calculator
---

We can take surely have more fun than just printing "Hello, World" to the screen. We can go ahead and do some
amazing things now that we know how to print something to screen. How about we take a look at using Blade as
a calculator?

Now, let's try a few more commands in the REPL.

```blade
> echo 5 + 20
25
> echo 4 * 11
44
> echo 16 - 1 * 4 / 6 + 3
18.33333333333334
> echo 2 ** 5
32
```

In the examples above, we used Blade as a simple arithemetic calculator. Notice that little `**`? That simply means
raise to power and 2 raised to the power of 5 equals 32.

---

If all you ever want to do with Blade is use it as a handy calculator, you are welcomed to stop here. 
But if you want to do beautiful and amazing things, let's continue into the next chapter together.




<br><br>

[Previous Topic](./intro) | [Next Topic](./comments)