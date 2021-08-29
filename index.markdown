---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Introduction
nav_order: 0
description: Welcome! This is the official documentation for Blade 0.0.5.
---

# The Blade Language Documentation
{: .fs-9 }

Welcome! This is the official documentation for Blade 0.0.5.
{: .fs-6 .fw-300 }

<img src="https://github.com/blade-lang/blade/actions/workflows/codeql.yml/badge.svg" style="height: 27px" />
<img src="https://img.shields.io/badge/License-MIT-yellow.svg" style="height: 27px" />
<a class="github-button" href="https://github.com/blade-lang/blade" data-color-scheme="no-preference: light; light: light; dark: dark;" data-size="large" data-show-count="true" aria-label="Star blade-lang/blade on GitHub">Star</a>
<a class="github-button" href="https://github.com/blade-lang" data-color-scheme="no-preference: light; light: light; dark: dark;" data-size="large" aria-label="Follow @blade-lang on GitHub">Follow @blade-lang</a>

<span class="fs-8">
[Installation &darr;](#installing-blade){: .btn .btn-primary .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Quick Language Overview](./quick-learn){: .btn .btn-red .fs-5 .mb-4 .mb-md-0 .mr-2 }
[Learn by Example](./examples){: .btn .btn-green .fs-5 .mb-4 .mb-md-0 .mr-2 }
</span>

---

> **_THIS DOCUMENTATION IS A WORK IN PROGRESS_**

<br>


## What is Blade?
---
Blade is a simple, fast, clean and dynamic language that allows you to develop complex applications 
quickly. Blade emphasises algorithm over syntax and for this reason, it has a very small but powerful 
syntax set with a very natural feel.

Blade is _NOT_ named after any weapon, but rather after the iconic Marvel Comics vampire slayer &mdash; Blade.


## Installing Blade
---

Blade currently supports and have been tested on the Linux, OSX and Windows operating system. To install Blade, you need to have [CMake](https://cmake.org/download/) and a C/C++ compiler toolchain/IDE installed on your computer.

> **On Windows:**
> 1. Only Visual Studio (MSVC compiler) have been tested and is currently guaranted to build Blade. While other compilers such as Mingw32/64 and/or Cygwin may build it, they are not currently recommended.
> 2. A minimum of Windows SDK version 10.0.18362 is recommended. This will be readily available from Visual studio 2017 on Windows 10 and above.

To install Blade, fire up your favorite terminal and run the following commands.

```terminal
$ git clone https://github.com/blade-lang/blade.git
$ cd blade
$ cmake -B ./blade -DCMAKE_BUILD_TYPE=Release
$ cmake --build ./blade --config Release
```

This will build and install Blade into a new directory called `blade` within the current directory. You can move this directory to any location on your computer. 

To make Blade (`blade`) available from your terminal, you'll need to add the generated `blade` directory to your computer paths.

See [this](https://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path), [this](https://stackoverflow.com/questions/11530090/adding-a-new-entry-to-the-path-variable-in-zsh) or [this](https://stackoverflow.com/questions/44272416/how-to-add-a-folder-to-path-environment-variable-in-windows-10-with-screensho) Stack overflow questions for information on adding Blade installation directory to path.


## Running the Blade REPL
---

Blade comes with support for REPL (Read-Evaluate-Print-Loop). The REPL mode is triggered when calling the Blade (`blade`) executable without any file.

Something like this:

```terminal
$ blade
Blade 0.0.5 (running on BladeVM 0.0.5), REPL/Interactive mode = ON
Clang 12.0.0, (Build time = Jul 14 2021, 14:30:16)
Type "exit()" to quit or "credits()" for more information
%> echo 'Hello, World'
'Hello, World'
%> 
```

To exit the loop, simply type `exit()` and press enter or press the `Ctrl`+`D` combination on your keyboard.

We'll be using this mode a lot in this documentation.


## Running a Blade script
---

The `blade` command can take a file as parameter and execute the file as simply as follows:

```terminal
$ blade somefilename.b
...
```

Did you notice how the filename ends with a `.b`? Blade program files should make use of the `.b` extension. This is the recommended convention. 

It is important to remember that:

> While Blade may not enforce the `.b` extension for all scripts, it is a _requirement_ for a script that is meant to be imported as a module into another program.


## Editor Support
---

For editor support, we recommend Visual Studio Code along with the [blade-vscode Extension](https://marketplace.visualstudio.com/items?itemName=blade-lang.blade-vscode){:target="_blank"}. 
Support for more editors are planned and on the way.


## Blade CLI options
---

Blade CLI comes with lots of options to control how Blade runs and how it runs
your scripts.

Type:

```terminal
$ blade -h
```

to show the CLI options. It should look something like this.


```terminal
Usage: blade [-[h | d | j | v | g]] [filename]
   -h    Show this help message.
   -v    Show version string.
   -b    Buffer terminal outputs.
         [This will cause the output to be buffered with 1kb]
   -d    Show generated bytecode.
   -j    Show stack objects during execution.
   -g    Sets the minimum heap size in kilobytes before the GC
         can start. [Default = 1024 (1mb)]
```

> This help message will automatically be triggered when you try to use an unsupported switch.

For example, to get the version of Blade installed:

```terminal
$ blade -v
Blade 0.0.5 (running on BladeVM 0.0.5)
```


## How to contribute
---

Along with Blade's goal to be simplicity, flexibility and expressiveness is a strong desire to make the community around it as friendly and welcoming as possible. Therefore, all forms of contributions from pull requests, suggestions, typo fixes in documentation, feature request, bug reports and any contribution at all is greatly welcomed and appreciated.

> WE NEED HELP! From review of this documentation, to suggestions on the core features of Blade, 
testing of Blade features, writing more comprehensive tests, bug detection, code fixes and more. 
PLEASE CONTRIBUTE!

### Contributing code, fixes and features

The standard. The general workflow is as follows.

1. Find/file an issue on the Issues tab.
2. Fork the repo and make your changes.
3. Push your changes to a branch in your forked repo. For coding guidelines, see the project [README](https://github.com/blade-lang/blade/blob/main/README.md) file.
4. Submit a pull request to Blade from your forked repo.

You can also just mail your issues to [Ore Richard Muyiwa](mailto:eqliqandfriends@gmail.com) directly.


## Sponsors
---

<!-- ![IMG](https://github.com/blade-lang/blade/raw/main/jetbrains.png) -->

<ul class="list-style-none">
{% for sponsor in site.sponsors %}
  <li class="d-inline-block mr-1">
     <a href="#{{ sponsor.link }}"><img src="{{ sponsor.image }}" width="64" height="64" alt="{{ sponsor.name }}"/></a>
  </li>
{% endfor %}
</ul>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>