---
layout: default
title: Modules & Packages
parent: Tutorial
nav_order: 19
permalink: /tutorial/modules.html
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
    <repl>:1 -> @.script()
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


## Default Exports and Imports

In Blade, modules and packages can export a default function that will be called if when a user 
instantiates a module or package as they would instantiate a function or class by simply declaring 
a function whose name is the same as the module or package's.

For example, a module `jump` can declare a function `jump()` in itself like this:

```blade
# jump.b
def jump(x) {
  return x + 1
}
```

A user of this module can call the `jump()` function without using `jump.jump(100)` by just calling the module itself directly.

```blade
# jump_test.b
import jump

echo jump(100)
```

The `jump()` function automatically becomes available for calling via the module name itself. 
Other functions declared in the module will still have to be called using the standard syntax 
of `jump.another_style()`.

---

When the user of a module or package imports a package or module, they can carefully select any of the 
functions in the module or package as the default import rather than the one created by the author if 
they so wish by simply renaming the entire module or package to the name of a function available in 
the module or package using the `as` keyword. 

For example, if the `jump` module also declares the function `slowly()` to allow users jump slowly as 
well as the `jump()` function for a default kind of jump, you can choose to not default to the default 
jump but rather default to a slow jump if you wish.

```blade
# jump.b

def jump(x) {
  return x + 10
}

def slow(x) {
  return x + 5
}
```

When you import the `jump` module without renaming it, the `jump()` function will become available to you via the module name directly. To change this behavior to use the `slow()`, we can import it like this:

```blade
# jump_test.b
import jump as slow

echo slow(15)
```


<br><br>

[Previous Topic](./error-handling.html) | [Next Topic](./bytes.html){:class="float-right"}