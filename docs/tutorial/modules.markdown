---
layout: default
title: Modules & Packages
parent: Tutorial
nav_order: 19
permalink: /tutorial/modules
---

# Modules and Packages

A `module` is any Blade script file that ends with the `.b` extension. Remember we noted earlier in this tutorial that Blade 
scripts do not require any extension, but a Blade script with a `.b` extension in Blade's world is a `Module`.

A `package` is a collection of Blade modules grouped together into the same directory for ease of reuse and import. However, 
you should note that there are requirements for converting grouped modules into a package. For all Blade cares, they could as 
well just be multiple modules stored somewhere.

So far in this tutorial, whenever we talked about putting Blade codes into a file and running it, we've been talking about 
a module.


## Creating a Package
---

Like earlier said, a package consists of many modules grouped together into the same parent directory. To create a package,

- Create a directory and give it a name (e.g. my_package). This name must comply with the rules of a valid variable name. i.e. 
  underscore, alphabetic or numeric characters and can only start with either an underscore or an alpabeth.
- Next, create an empty file in the directory and save it as `index.b`.

Your directory structure should look like this:

```
my_package
|__ index.b
``` 

You can add as many modules into your package as you need, but the `index.b` module is **required** for a valid package.

> **_@note:_** The Blade runtime does not make a distinction between the two and calls them all `module` because ideally, a package 
> is a "super module" &mdash; that name is allowed in the Blade world.

{:class="pop"}
> The package `index.b` file is where you define what is exported from your package as only the objects in visible in the 
> `index.b` module will be visible whenever the package is imported.


## Importing Modules and Packages
---

To import a module or package in Blade, we use an `import` statement (which is essentially the keyword `import` followed by 
the name of the nmodule we want to import).

For example:

```blade-repl
%> import http  # importing the built-in http package
```

You can also import specific modules in a package or inner/nested packages, by specifying the path to the nested 
package/module with the `.` separator (instead of the native `/` or `\` used byb your OS).

For example:

```blade-repl
%> import http.status
%> status.OK
200
```

When a module is imported, the module gets an automatic variable name equal to the last name in the import path. For instance, 
in the above above the module `http/status.b` gets the name `status` and all values in the pacakge/module will be bound to 
that name. To access the values, properties, functions, classes, essentially anything in the package/module, you must access 
them through the variable name as shown above.


## Renaming modules and packages on import
---

Often time, you'll have one or more package/module with conflicting names. For this reason, the import statement allows an 
optional `as` keyword that allows you to rename the imported module/package.

For example:

```blade-repl
%> import math as m
%> m.factorial(50)
3.041409320171338e+64
%> m
<module m at /blade/libs/math.b>
%> math
Unhandled Exception: 'math' is undefined in this scope
  StackTrace:
    File: <repl>, Line: 1, In: <script>
```

In the above example, the `math` variable wasn't defined because we asked Blade to name it `m` instead. So it's a runtime 
error to try and access it.


## Importing relative packages and modules
---

Take a look at the following directory structure, let's say you are in the file `module.b` and want to import the module 
`another_module.b` or `sub_module.b`, if you try to import it directly, you'll get a module not found error because by 
default, Blade attempts to import modules and packages that can be found in `%BLADE_INSTALL_ROOT%/libs`. 

```
my_package
|__ index.b
|__ sub_module.b
|__ my_sub_package
|_____ index.b
|_____ module.b
|_____ another_module.b
```

To import from a relative path, start your import path with a `.` if the module/package are in the same directory with the 
importing script or a `..` if it is in a parent path.

To import `another_module.b` from `module.b`,

```blade-repl
%> import .another_module
```

And to import `sub_module.b` from `module.b`,

```blade-repl
%> import ..module
```

Blade allows multiple `..` in a relative import path and simply translates them to a `../` or `..\` depending on the 
operating system.

```blade-repl
%> import ..package..root_package..module
```


## Selective Import
---

Sometimes, we don't want to import an entire module but rather individual objects from the module. To do this in Blade, 
there is the selective import statement. For example, to import the `md5()` function from the `hash` module, we can do 
the following.

```blade-repl
%> import hash { md5 }
%> md5('hello, world')
'e4d7f1b4ed2e42d15898f4b27b019da4'
```

You can specify more than one object for selective importation by simply separating the objects you want to import with a 
comma. For example, to import the `crc32()` function and the md5 function at the same time from the hash library, the 
import statement will look like the following:

```blade-repl
%> import hash { crc32, md5 }
```

Another form of the selective `import` statement imports _`all`_ objects from the module/package into the current scope without directly. This way, you can use the objects directly without having to resolve them through a module variable (in fact, a module variable won't be created).

For example:

```blade-repl
%> import math { * }
%> cos(10)
-0.8390715290764524
%> tan(25)
-0.1335264070215359
```

## First-Class Package Management
---

For Blade, package management is such an important and integral part to software development 
that we decided to add package management as a language feature by offering first-class 
support fo it.

Blade lets you download packages and libraries into your source code directory and
call it from your code as if it were a standard library. Making it available for all 
applications and files that will be called from or created within that directory.

For every directory where you call the `blade` command to run programs, Blade looks for the 
following directory structure and marks all modules and packages in that directory as part 
of the built-in library.

```sh
.blade
|__ libs
|____ ...
|__ bin
|____ ...
```

Blade modules and packages in `.blade/libs` will be importable like a standard library 
package/module, while `C` extensions found in the `.blade/bin` directory will be loaded 
when Blade starts up. If a module/package is a mixture of `C` extensions and standard 
Blade module/package, such module or package should be added to the `.blade/libs` directory 
while the object file of the `C` extension should go into `.blade/bin`.

> It is important to note that modules and libraries having a conflicting name with a 
> standard library will take precedence and will be loaded instead of the standard library.
> This is not a drawback in anyway. Rather, it provides the user with the choice of 
> overriding any of the standard libraries with any preferred alternative.

For example, create the directory `.blade/libs` in your current directory and create a 
file `sample.b` in that directory. Paste the following code into it.

```blade
var version = '1.0.0'
```

Now create a new file `test.b` in your current directory and save the following code in it:

```blade
import sample
echo sample.version
```

Now run your file using:

```terminal
$ blade sample.b
```

You should see `1.0.0` printed in the console. Voila!

> Remember, the package name set in your `C` extensions MUST start with an underscore 
> (`_`) to make it callable.

<br><br><br>
<hr>

**_If you've come this far then you are already a Blade master! What you've learnt so far coupled with the standard library 
opens the door to endless possiblities. Remember that Blade is a growing language and stuffs are bound to change so we 
plead with you to keep up to date with this documentation to follow the development of the language of Ninjas._**


<br><br>

[Previous Topic](./error-handling) | [Next Topic](./bytes){:class="float-right"}