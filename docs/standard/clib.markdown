---
layout: default
title: clib
parent: Standard Library
nav_order: 9
permalink: /standard/clib.html
---

# clib

The `clib` module exposes Blade capabilites to interact with C 
shared libraries. The workflow follows a simple approach.

- Load the library
- Define the function schematics
- Call the function.

That simple!

For example, the following code `dirname()` and `cos()` function from the 
standard C library on a Unix machine (Linux, OSX, FreeBSD etc).

```blade
# Import clib
import clib

# 1. Load 'libc' shared module available on Unix systems
var lib = clib.load('libc')

# 2. Declare the functions
var dirname = lib.define('dirname', clib.char_ptr, clib.char_ptr)
var cos = lib.define('cos', clib.double, clib.double)     # this may not work on linux

# 3. Call the functions
echo dirname('/path/to/my/file.ext')
echo cos(23)

# Close the library (this is a good practice, but not required)
lib.close()
```

The first argument to a definiton is the name of the function. 
The second is its return type. If the function takes parameters, 
the parameter types follow immediately. (See below for a list of the 
available types.)

> **NOT YET SUPPORTED:**
> - Variadic functions
> - Arrays
> - Structs and Unions
> - Enums



<h2>Properties</h2><hr>

{:#clib__void} _clib._**void**
: C void type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__bool} _clib._**bool**
: C bool type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__uint8_t} _clib._**uint8_t**
: C uint8_t type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__int8_t} _clib._**int8_t**
: C int8_t type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__byte} _clib._**byte**
: C byte type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__ubyte} _clib._**ubyte**
: C ubyte type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__uint16_t} _clib._**uint16_t**
: C uint16_t type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__int16_t} _clib._**int16_t**
: C int16_t type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__uint32_t} _clib._**uint32_t**
: C uint32_t type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__int32_t} _clib._**int32_t**
: C int32_t type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__uint64_t} _clib._**uint64_t**
: C uint64_t type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__int64_t} _clib._**int64_t**
: C int64_t type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__ssize_t} _clib._**ssize_t**
: C ssize_t type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__float} _clib._**float**
: C float type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__double} _clib._**double**
: C double type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__uchar} _clib._**uchar**
: C uchar type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__char} _clib._**char**
: C char type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__ushort} _clib._**ushort**
: C ushort type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__short} _clib._**short**
: C short type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__uint} _clib._**uint**
: C uint type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__int} _clib._**int**
: C int type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__ulong} _clib._**ulong**
: C ulong type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__long} _clib._**long**
: C long type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__size_t} _clib._**size_t**
: C size_t type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__long_double} _clib._**long_double**
: C long_double type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__char_ptr} _clib._**char_ptr**
: C char_ptr type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__uchar_ptr} _clib._**uchar_ptr**
: C uchar_ptr type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>



^
{:#clib__ptr} _clib._**ptr**
: C ptr type
   <div class="cite"><span class="hint">type</span> <span>ptr</span></div>





<h2>Functions</h2><hr>

{:#clib__load} _clib_.**load**(_name_: string)
: Loads a new C shared library pointed to by name. Name must be a 
  relative path, absolute path or the name of a system library. 
  If the system shared library extension is omitted in the name, 
  it will be automatically added.
   <div class="cite"><span class="hint">return</span> <span>CLib</span></div>



^
{:#clib__get_ptr_index} _clib_.**get_ptr_index**(_pointer_: ptr, _type_: clib_type, _index_: number)
: Get the value at the given index of a pointer based 
  on the given CLib type.
  
   <div class="cite"><span class="hint">return</span> <span>any</span></div>



^
{:#clib__set_ptr_index} _clib_.**get_ptr_index**(_pointer_: ptr, _type_: clib_type, _index_: number, _value_: any)
: Sets the value at the given index of a pointer based 
  on the given CLib type to the given value.
  
   <div class="cite"><span class="hint">return</span> <span>any</span></div>



^
{:#clib__struct} _clib_.**struct**(...type)
: Returns a type that can be used to declare structs. 
  To create or read value for the struct, you need to use the `pack()` 
  and `unpack()` function in the `struct` module respectively.
  
  > - This function can also be used to define a C union or array.
   <div class="cite"><span class="hint">return</span> <span>type</span></div>





<h2>Classes</h2><hr>



### _class_ Clib 
---

class CLib provides an interface for interacting with C shared modules.


#### class Clib methods
---

{:#_Clib_Clib} **CLib**([_name_: string])
: The name should follow the same practice outlined in `load()`.
   <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_Clib_load} **load**(_name_: string)
: Loads a new C shared library pointed to by name. Name must be a 
  relative path, absolute path or the name of a system library. 
  If the system shared library extension is omitted in the name, 
  it will be automatically added except on Linux machines.
   <div class="cite"><span class="hint">return</span> <span>CLib</span></div>



{:#_Clib_close} **close**()
: Closes the handle to the shared library.


{:#_Clib_function} **function**(_name_: string)
: Retrieves the handle to a specific function in the shared library.
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>



{:#_Clib_define} **define**(_name_: string, _return_type_: type, ...type)
: Defines a new C function with the given name and return type.
  -  When there are no more argument, it is declared that the function
     takes no argument.
  -  `define()` expects a list of the argument/parameter types as expected
     by the function.
  
  E.g.
  
  ```blade
  define('myfunc', int, int, ptr)
  ```
  
  Corresponds to the C declaration:
  
  ```c
  int myfunc(int a, void *b);
  ```


{:#_Clib_get_pointer} **get_pointer**()
: Returns a pointer to the underlying module
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>




