---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Introduction
nav_order: 0
description: Welcome! This is the official documentation for Blade 0.0.73.
---

# The Blade Language Documentation
{: .fs-9 }

Welcome! This is the official documentation for Blade 0.0.73.
{: .fs-6 .fw-300 }

<div style="color:red">This documentation is a work in progress!</div>

<img src="https://img.shields.io/badge/License-MIT-yellow.svg" style="height: 27px" />
<a class="github-button" href="https://github.com/blade-lang/blade" data-color-scheme="no-preference: light; light: light; dark: dark;" data-size="large" data-show-count="true" aria-label="Star blade-lang/blade on GitHub">Star</a>
<a class="github-button" href="https://github.com/blade-lang" data-color-scheme="no-preference: light; light: light; dark: dark;" data-size="large" aria-label="Follow @blade-lang on GitHub">Follow @blade-lang</a>
<a href="https://gitter.im/blade-lang/community?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge">
<img src="https://badges.gitter.im/blade-lang/community.svg"  style="height: 27px">
</a>

<div class="fs-8">
<a href="#download" class="btn btn-primary fs-4 mb-4 mb-md-0 mr-2">Installation <i class="fa-regular fa-circle-down"></i></a>
<a href="./quick-learn" class="btn btn-red fs-4 mb-4 mb-md-0 mr-2">Quick Language Overview</a>
<a href="./examples" class="btn btn-green fs-4 mb-4 mb-md-0 mr-2">Learn by Example</a>
</div>

<br>

```blade
import http
import json

var server = http.server(3000)
server.on_receive(|request, response| {
  echo 'Request from ${request.ip} to ${request.path}.'
  
  response.headers['Content-Type'] = 'application/json'
  response.write(json.encode(request))
})

echo 'Listening on Port 3000...'
server.listen()
```
_A simple HTTP server listening on port 3000 in Blade_

<br><br>


## What is Blade?
---
Blade is a simple, fast, clean and dynamic language that allows you to develop complex applications 
quickly. Blade emphasises algorithm over syntax and for this reason, it has a very small but powerful 
syntax set with a very natural feel.

Blade is _NOT_ named after any weapon, but rather after the iconic Marvel Comics vampire slayer &mdash; Blade.


## Why should I use Blade?

If you fall into one of more of this categories or have one of the following needs, then Blade is the right language for you.

- You want Python's simplicity but love coding with braces and other things C-like.
- You want a language with first-class support for package management.
- You need a quick script for automating mundane tasks on your device.
- You need a language that allows fast prototyping.
- You want to do backend development without needing to depend on a framework.
- You want a scripting language you can easily port your existing C99 codes to with less hassle (Work in progress).
- You want a familiar language that can be embedded into your application that's more extensive than Lua.

There are many more use-cases where Blade is a great fit. This is just the bare minimal.


## Download
---

<span>
<a href="https://github.com/blade-lang/blade/releases/download/v0.0.73/blade-windows-v0.0.73.zip" class="btn btn-primary fs-6 mb-4 mb-md-0 mr-2">Windows &nbsp;<span class="fa-brands fa-windows"></span></a>
<a href="https://github.com/blade-lang/blade/releases/download/v0.0.73/blade-linux-v0.0.73.zip" class="btn btn-linux fs-6 mb-4 mb-md-0 mr-2">Linux  &nbsp;<span class="fa-brands fa-linux"></span></a>
<a href="https://github.com/blade-lang/blade/releases/download/v0.0.73/blade-macos-v0.0.73.zip" class="btn btn-gray fs-6 mb-4 mb-md-0 mr-2">MacOS  &nbsp;<span class="fa-brands fa-apple"></span></a>
</span>

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
> [ext](https://github.com/blade-lang/blade/ext) directory for more info on how to write a valid C extension for Blade.
>
> #### Important Notice
> 1. Only TDM-GCC, WinLibs, MinGW64 and MSVC compiler have been tested and are currently guaranted to build Blade. While other compilers may build it, they are not currently recommended.
> 2. For MSVC, a minimum of Windows SDK version 10.0.18362 is recommended. This will be readily available from Visual studio 2017 on Windows 10 and above.

To install Blade with TDM-GCC or WinLibs, install [TDM-GCC](https://github.com/jmeubank/tdm-gcc/releases/download/v10.3.0-tdm64-2/tdm64-gcc-10.3.0-2.exe)
or [WinLibs](https://github.com/brechtsanders/winlibs_mingw/releases/download/11.2.0-9.0.0-msvcrt-r5/winlibs-x86_64-posix-seh-gcc-11.2.0-mingw-w64-9.0.0-r5.zip) 
via the given links. Add TDM-GCC or WinLibs `bin` directory to your environment path. TDM-GCC also allows you to add to path during its installation. 
After this, run the following commands from the root of your Blade clone:

```shell
git clone https://github.com/blade-lang/blade.git
cd blade
cmake -B . -DCMAKE_MAKE_PROGRAM=mingw32-make -G "Unix Makefiles"
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

**_See [BUILDING](https://github.com/blade-lang/blade/blob/main/BUILDING.md) for more details._**


## Running the Blade REPL
---

Blade comes with support for REPL (Read-Evaluate-Print-Loop). The REPL mode is triggered when calling the Blade (`blade`) executable without any file.

Something like this:

```terminal
$ blade
Blade 0.0.73 (running on BladeVM 0.0.6), REPL/Interactive mode = ON
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
Blade 0.0.73 (running on BladeVM 0.0.6)
```


## How to contribute
---

Along with Blade's goal to be simplicity, flexibility and expressiveness is a strong desire to make the community around it as friendly and welcoming as possible. Therefore, all forms of contributions from pull requests, suggestions, typo fixes in documentation, feature request, bug reports and any contribution at all is greatly welcomed and appreciated.

> WE NEED HELP! From review of this documentation, to suggestions on the core features of Blade, 
testing of Blade features, writing more comprehensive tests, bug detection, code fixes and more. 
PLEASE CONTRIBUTE!

### Contributing code, fixes and features
---

The standard. The general workflow is as follows.

1. Find/file an issue on the Issues tab.
2. Fork the repo and make your changes.
3. Push your changes to a branch in your forked repo. For coding guidelines, see the project [README](https://github.com/blade-lang/blade/blob/main/README.md) file.
4. Submit a pull request to Blade from your forked repo.

You can also just mail your issues to [Ore Richard Muyiwa](mailto:eqliqandfriends@gmail.com) directly.


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
<script async defer src="https://buttons.github.io/buttons.js"></script>