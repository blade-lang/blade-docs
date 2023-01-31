---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Introduction
nav_order: 0
description: Welcome! This is the official documentation for Blade 0.0.81.
---

> Introducing [Nyssa Package Manager](https://nyssa.bladelang.com). The official package manager for the Blade programming language.
{: .fs-4 .text-red-300 }

# The Blade Language Documentation
{: .fs-9 }

Welcome! This is the official documentation for Blade 0.0.81.
{: .fs-6 .fw-300 }

<!-- <div style="color:red">This documentation is a work in progress!</div>

<img src="https://img.shields.io/badge/License-MIT-yellow.svg" style="height: 27px" />
<a class="github-button" href="https://github.com/blade-lang/blade" data-color-scheme="no-preference: light; light: light; dark: dark;" data-size="large" data-show-count="true" aria-label="Star blade-lang/blade on GitHub">Star</a>
<a class="github-button" href="https://github.com/blade-lang" data-color-scheme="no-preference: light; light: light; dark: dark;" data-size="large" aria-label="Follow @blade-lang on GitHub">Follow @blade-lang</a>
<a href="https://gitter.im/blade-lang/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge">
<img src="https://badges.gitter.im/blade-lang/community.svg"  style="height: 27px">
</a> -->

[![Build Status](https://github.com/blade-lang/blade/actions/workflows/ci.yml/badge.svg)](https://github.com/blade-lang/blade/actions)
[![Gitter](https://badges.gitter.im/blade-lang/community.svg)](https://gitter.im/blade-lang/community)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/blade-lang/blade/blob/master/LICENSE)
[![Coverage Status](https://coveralls.io/repos/github/blade-lang/blade/badge.svg?branch=main)](https://coveralls.io/github/blade-lang/blade?branch=main)
[![Version](https://img.shields.io/badge/version-0.0.81-green)](https://github.com/blade-lang/blade)

<div class="fs-8">
<a href="#download" class="btn btn-primary fs-4 mb-4 mb-md-0 mr-2">Installation <i class="fa-regular fa-circle-down"></i></a>
<a href="/quick-learn.html" class="btn btn-red fs-4 mb-4 mb-md-0 mr-2">Quick Language Overview</a>
<a href="/examples.html" class="btn btn-green fs-4 mb-4 mb-md-0 mr-2">Learn by Example</a>
</div>

<br>

The following code implements a simple backend API that runs on port 3000:

```blade
import http
import json

var server = http.server(3000)
server.on_receive(|request, response| {
  response.headers['Content-Type'] = 'application/json'
  response.write(json.encode(request))
})

echo 'Listening on Port 3000...'
server.listen()
```

<br><br>


## What is Blade?
---

Blade is a simple, clean, and embeddable dynamic programming language created to be simple enough for beginners, yet powerful and expressive for professionals. It has a very small syntax set with a very low learning curve. Blade improves upon the best features of JavaScript, Python, and Ruby to give developers a familiar and powerful system that feels native for developers coming from any of these languages and an easy way to leverage the strength of any.

Blade also comes with [Nyssa](https://nyssa.bladelang.com), the official package manager, which makes it easy to install and manage packages and modules.

Blade is _NOT_ named after any weapon, but rather after the iconic Marvel Comics vampire slayer &mdash; Blade.

## Features
---

- **First-class package management**: Package management is built into the language module system.
- **Iterable classes**: Blade has built-in support for iterable classes, making it easy to work with collections of data.
- **Backend development**: Blade can be used for backend development without any external dependencies.
- **Function promotion**: Blade allows for function promotion, making it easy to reuse any piece of code from an imported module.
- **Default exports and imports**: Blade supports default exports and imports, making it easy to organize code.
- **Anonymous functions**: Blade supports anonymous functions, making it easy to write functional code.
- **Access modifiers**: Unlike any of JavaScript, Python and Ruby, Blade supports access modifiers for variables, properties, functions, classes, modules, etc.
- **Decorator functions**: Blade supports decorator functions, making it easy to add functionality to existing code.
- **Function overrides**: Blade supports function overrides in classes, allowing a class to choose the result to return for a function if the function allows it.
- **Easy to extend with C modules**: Blade supports external extensions built in C, making it easy to extend the language with C modules.

## Use Cases
---

Blade can be used for a wide range of tasks, including:

- **Web development**: Blade can be used to create web applications and web services.
- **Data science**: Blade can be used to perform data analysis and machine learning tasks.
- **Scripting**: Blade can be used to write scripts to automate tasks.
- And more...

## Showcase
---

- **[Nyssa](https://github.com/blade-lang/nyssa)**: The Nyssa self-hostable repository server and package manager is written in Blade.
- **[jsonrpc](https://github.com/mcfriend99/jsonrpc)**: A JSON-RPC library for Blade programming language.
- **[wire](https://github.com/mcfriend99/wire)**: Dynamic HTML template engine.
- **[tar](https://github.com/mcfriend99/tar)**: Pure Blade library for creating and extracting TAR archives.


## How does it differ from Python and Ruby?
---

- First-class package management (Package management is built into the language module system).
- Iterable classes.
- Backend development without any external dependencies.
- [Function promotion](https://bladelang.com/tutorial/modules.html#function-promotion).
- Default exports and imports.
- Anonymous functions.
- Access modifiers for variables, properties, function, class, modules, etc.
- Decorator functions.
- Function overrides in classes &mdash; A class can chose the result to return for a function if the function allows it.
- Easy to extend with C modules with a familiar API to Wren.


## Download
---

<span>
<a href="https://github.com/blade-lang/blade/releases/download/v0.0.81/blade-windows-v0.0.81.zip" class="btn btn-primary fs-6 mb-4 mb-md-0 mr-2">Windows &nbsp;<span class="fa-brands fa-windows"></span></a>
<a href="https://github.com/blade-lang/blade/releases/download/v0.0.81/blade-linux-v0.0.81.zip" class="btn btn-linux fs-6 mb-4 mb-md-0 mr-2">Linux  &nbsp;<span class="fa-brands fa-linux"></span></a>
<a href="https://github.com/blade-lang/blade/releases/download/v0.0.81/blade-macos-v0.0.81.zip" class="btn btn-gray fs-6 mb-4 mb-md-0 mr-2">MacOS  &nbsp;<span class="fa-brands fa-apple"></span></a>
</span>

> It is advisable to install [Nyssa](https://nyssa.bladelang.com) the official package manager after installing Blade. [See installation instruction here](https://nyssa.bladelang.com/docs).

> - This downloads only support `x86-64` plaforms. 
> - Apple M1 devices should install `Rosetta 2` to run the downloaded application or install from source.
> - For other platforms, you'll need to install from source (see below for details).


## Installing Blade from source
---

Blade currently supports and have been tested on the Linux, OSX and Windows operating system. To install Blade, you need to have [CMake](https://cmake.org/download/) and a C/C++ compiler toolchain/IDE installed on your computer.

### For Linux and macOS

If you are on a Unix, OSX or Linux machine, you can use the automated install tool by running the command below in your favorite terminal.

```terminal
$ bash <(curl -s https://raw.githubusercontent.com/blade-lang/blade/main/scripts/install.sh)
```


### For Windows

> Starting from version `0.0.7`, Blade's officially supported compilers for the Windows environment is now the 
> TDM-GCC and WinLibs compiler. The decision to change the official compiler from Visual Studio and MSYS2 to TDM-GCC and WinLibs 
> is to allow a minial configuration effort while installing Blade as well as to allow us to develop Blade faster as trying to 
> be cross-compatible with Visual Studio has proven to slow down the growth of the language and the ecosystem and setting up 
> MSYS2 environment to compile Blade is more work than required for either TDM-GCC or WinLibs.
> 
> This also allows us to build valid Blade C extensions on Windows with less hassle. 
> Check out the [blade-ext-demo](https://github.com/blade-lang/blade-ext-demo) or any of the extension in the 
> [packages](https://github.com/blade-lang/blade/tree/main/packages) directory for more info on how to write a valid C extension for Blade.
>
> #### Important Notice
> 1. Only TDM-GCC, WinLibs, MinGW64 and MSVC compiler have been tested and are currently guaranted to build Blade. While other compilers may build it, they are not currently recommended.
> 2. For MSVC, a minimum of Windows SDK version 10.0.18362 is recommended. This will be readily available from Visual studio 2017 on Windows 10 and above.

To install Blade with TDM-GCC or WinLibs, install [TDM-GCC](https://github.com/jmeubank/tdm-gcc/releases/download/v10.3.0-tdm64-2/tdm64-gcc-10.3.0-2.exe)
or [WinLibs](https://github.com/brechtsanders/winlibs_mingw/releases/download/11.2.0-9.0.0-msvcrt-r5/winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r5.zip) 
via the given links. Add TDM-GCC or WinLibs `bin` directory to your environment path. TDM-GCC also allows you to add to path during its installation.

#### Dependencies

The following dependencies are required and can be installed via Cygwin or Vcpkg.

- CMake
- OpenSSL
- Curl
- Libffi

After this, run the following commands from the root of your Blade clone:

```shell
git clone https://github.com/blade-lang/blade.git
cd blade
cmake -B . -DCMAKE_MAKE_PROGRAM=mingw32-make -G "Unix Makefiles"
cmake --build .
```

If your dependencies were installed via Vcpkg, you may need to reference the Vcpkg toolchain. E.g.

```shell
git clone https://github.com/blade-lang/blade.git
cd blade
cmake -B . -DCMAKE_MAKE_PROGRAM=mingw32-make -G "Unix Makefiles" -DCMAKE_TOOLCHAIN_FILE=PATH_TO_VCKPG\scripts\buildsystems\vcpkg.cmake
cmake --build .
```

This will build and install Blade into a new directory called `blade` within the current directory. You can move this directory to any location on your computer. 

To make Blade (`blade`) available from your terminal, you'll need to add the generated `blade` directory to your computer paths.

See [this](https://unix.stackexchange.com/questions/26047/how-to-correctly-add-a-path-to-path), [this](https://stackoverflow.com/questions/11530090/adding-a-new-entry-to-the-path-variable-in-zsh) or [this](https://stackoverflow.com/questions/44272416/how-to-add-a-folder-to-path-environment-variable-in-windows-10-with-screensho) Stack overflow questions for information on adding Blade installation directory to path.

### For all other platforms
---

For environments without an autoinstall and the adventurous ones, to install Blade, so far as you can successfully setup 
`git`, `cmake` and one of `GCC` or `Clang` based compilers, you can use the following commands to install Blade:


```shell
$ git clone https://github.com/blade-lang/blade.git
$ cd blade
$ cmake -B .
$ cmake --build .
```

> See the Windows section above for a list of dependencies.

**_See [BUILDING](https://github.com/blade-lang/blade/blob/main/BUILDING.md) for more details._**


## Running the Blade REPL
---

Blade comes with support for REPL (Read-Evaluate-Print-Loop). The REPL mode is triggered when calling the Blade (`blade`) executable without any file.

Something like this:

```terminal
$ blade
Blade 0.0.81 (running on BladeVM 0.0.9), REPL/Interactive mode = ON
Clang 13.0.0, (Build time = Feb  8 2022, 02:47:36)
Type ".exit" to quit or ".credits" for more information
%> echo 'Hello, World'
'Hello, World'
%> 
```

To exit the loop, simply type `.exit` and press enter or press the `Ctrl`+`D` combination on your keyboard.

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
Usage: blade [-[h | c | d | e | j | v | g]] [filename]
   -h       Show this help message.
   -v       Show version string.
   -b       Buffer terminal outputs.
            [This will cause the output to be buffered with 1kb]
   -d       Print bytecode.
   -e       Print bytecode and exit.
   -j       Show stack objects during execution.
   -g arg   Sets the minimum heap size in kilobytes before the GC
            can start. [Default = 1024 (1mb)]
   -c arg   Runs the give code.
```

> This help message will automatically be triggered when you try to use an unsupported switch.

For example, to get the version of Blade installed:

```terminal
$ blade -v
Blade 0.0.81 (running on BladeVM 0.0.9)
```


## Community
---

- Join the conversation on [Gitter](https://gitter.im/blade-lang/community)
<!-- - Follow us on Twitter -->
- Submit a [feature request](https://github.com/blade-lang/blade/issues/new?labels=feature-request) or [bug report](https://github.com/blade-lang/blade/issues/new?labels=bug).

## Contributing
---

Blade desire to make the community around it as friendly and welcoming as possible. Therefore, all forms of contributions from pull requests, suggestions, typo fixes in documentation, feature request, bug reports and any contribution at all is highly appreciated. Please refer to the [Contributing](./CONTRIBUTING.md) guide for more information.

You can also mail your issues to [Ore Richard Muyiwa](mailto:eqliqandfriends@gmail.com) directly.

> WE NEED HELP! From review of this documentation, to suggestions on the core features of Blade, 
testing of Blade features, writing more comprehensive tests, bug detection, code fixes and more. 
PLEASE CONTRIBUTE!


<!-- ## Sponsors
---

<ul class="list-style-none">
{% for sponsor in site.sponsors %}
  <li class="d-inline-block mr-1">
     <a href="#{{ sponsor.link }}"><img src="{{ sponsor.image }}" width="64" height="64" alt="{{ sponsor.name }}"/></a>
  </li>
{% endfor %}
</ul> -->

<!-- Place this tag in your head or just before your close body tag. -->
<!-- <script async defer src="https://buttons.github.io/buttons.js"></script> -->