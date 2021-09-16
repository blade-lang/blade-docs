---
layout: default
title: Built-in Functions
parent: Tutorial
nav_order: 13
permalink: /tutorial/builtin-functions
---

# Built-in Functions

Blade comes with an array of optimized built-in function for simple tasks. Below is a list of the 
built in functions followed by their respective documentations.

| [abs](#abs) |  [bin](#bin) |  [bytes](#bytes) |  [chr](#chr) |  [delprop](#delprop) |  [file](#file) |
|  [getprop](#getprop) | [hasprop](#hasprop) |  [hex](#hex) |  [id](#id) | [instance_of](#instance_of) |  [int](#int) |
|  [is_bool](#is_bool) | [is_callable](#is_callable) |  [is_class](#is_class) | [is_dict](#is_dict) |  [is_function](#is_function) |  [is_instance](#is_instance) |
|  [is_int](#is_int) | [is_list](#is_list) |  [is_number](#is_number) |  [is_object](#is_object) | [is_string](#is_string) |  [is_bytes](#is_bytes) |
|  [is_file](#is_file) | [is_iterable](#is_iterable) |  [max](#max) |  [microtime](#microtime) |  [min](#min) | [oct](#oct) |
|  [ord](#ord) | [print](#print) |  [rand](#rand) |  [setprop](#setprop) |  [sum](#sum) |  [time](#time) |
| [to_bool](#to_bool) | [to_dict](#to_dict) |  [to_int](#to_int) |  [to_list](#to_list) |  [to_number](#to_number) |
|  [to_string](#to_string) | [typeof](#typeof) |


{:#abs} **abs**(_x_: number | instance)
: If _x_ is a number, this function returns the absolute value of the number _x_. This is 
  equivalent to `x >= 0 ? x : -x`. However, if _x_ is an instance of a class _y_ and _y_ defines 
  `@to_abs()`, then this functions returns `x.@to_abs()`. 

^
{:#bin} **bin**(_x_: number | instance)
: If _x_ is a number, this function converts number _x_ to it's binary string and returns the 
  value. However, if _x_ is an instance of a class _y_ and _y_ defines `@to_bin()`, then this 
  functions returns `x.@to_bin()`. 

^
{:#bytes} **bytes**(_x_: number | list)
: If _x_ is a number, this function returns a new `bytes` object with length _x_ having all 
  it's bytes set to `0x0`. If _x_ is a list, it returns a new `bytes` object whose contents are 
  the bytes specified in the list.

  > **_@_@note:__** If _x_ is a list, then the list must only contain valid bytes which can be any 
  > number between 0 and 255.

^
{:#chr} **chr**(_x_: number)
: Returns the Unicode character whose code point is equal to the number _x_.

^
{:#delprop} **delprop**(_object_: instance, _name_: string)
: Deletes the property _name_ from the given instance of _object_.

^
{:#file} **file**(_path_: string [, _mode_: string])
: Returns an open file handle to the file specified in the path in the specified mode. If the 
  mode is not specified, the file will be opened in the _read only_ mode.

^
{:#getprop} **getprop**(_object_: instance, _name_: string)
: Returns the value of the property _name_ from the given instance of _object_. If the _object_ 
  has no such property, `nil` is returned.

^
{:#hasprop} **hasprop**(_object_: instance, _name_: string)
: Returns `true` if the _object_ has a property _name_. Returns `false` otherwise.

^
{:#hex} **hex**(_x_: number | instance)
: If _x_ is a number, this function converts number _x_ to it's hexadecimal string and returns the 
  value. However, if _x_ is an instance of a class _y_ and _y_ defines `@to_hex()`, then this 
  functions returns `x.@to_hex()`. 

^
{:#id} **id**(_x_: any)
: Returns the unique identifier of value _x_ within the system. This value is also equivalent to 
  the current address of object _x_ in memory.

^
{:#instance_of} **instance_of**(_x_: any, _y_: class)
: Returns `true` if _x_ is an instance of the given class _y_ or `false` otherwise.

^
{:#int} **int**([_x_: number | instance])
: If _x_ is not given, returns `0`. If _x_ is a number, converts the number to an integer and 
  returns the integer. However, if _x_ is an instance of a class _y_ and _y_ defines `@to_int()`, 
  then this functions returns `x.@to_int()`.

^
{:#is_bool} **is_bool**(_x_: any)
: Returns `true` if _x_ is a boolean or `false` otherwise.

^
{:#is_callable} **is_callable**(_x_: any)
: Returns `true` if _x_ is a callable or `false` otherwise. Callables includes classes, functions 
  and closures.

^
{:#is_class} **is_class**(_x_: any)
: Returns `true` if _x_ is a class or `false` otherwise.

^
{:#is_dict} **is_dict**(_x_: any)
: Returns `true` if _x_ is a dictionary or `false` otherwise.

^
{:#is_function} **is_function**(_x_: any)
: Returns `true` if _x_ is a function or closure or `false` otherwise.

^
{:#is_instance} **is_instance**(_x_: any)
: Returns `true` if _x_ is an instance of any class or `false` otherwise.

^
{:#is_int} **is_int**(_x_: any)
: Returns `true` if _x_ is an integer or `false` otherwise.

^
{:#is_list} **is_list**(_x_: any)
: Returns `true` if _x_ is a list or `false` otherwise.

^
{:#is_number} **is_number**(_x_: any)
: Returns `true` if _x_ is a number or `false` otherwise.

^
{:#is_object} **is_object**(_x_: any)
: Returns `true` if _x_ is an object or `false` otherwise.

^
{:#is_string} **is_string**(_x_: any)
: Returns `true` if _x_ is a string or `false` otherwise.

^
{:#is_bytes} **is_bytes**(_x_: any)
: Returns `true` if _x_ is a bytes object or `false` otherwise.

^
{:#is_file} **is_file**(_x_: any)
: Returns `true` if _x_ is a file object or `false` otherwise.

^
{:#is_iterable} **is_iterable**(_x_: any)
: Returns `true` if _x_ is an iterable object or `false` otherwise. Iterables includes lists, 
  dictionaries, strings, bytes, and instances of any class that defines both `@iter()` and 
  `@itern()` decorator functions.

^
{:#max} **max**(_numbers_...)
: Returns the greatest of the given numbers. _This method requires at least two numbers._

^
{:#microtime} **microtime**()
: Returns the current epoch time to the microseconds resolution.

^
{:#min} **min**(_numbers_...)
: Returns the least of the given numbers. _This method requires at least two numbers._


^
{:#oct} **oct**(_x_: number)
: If _x_ is a number, this function converts number _x_ to it's octal string and returns the 
  value. However, if _x_ is an instance of a class _y_ and _y_ defines `@to_oct()`, then this 
  functions returns `x.@to_oct()`. 


^
{:#ord} **ord**(_x_: char)
: Returns the code point value of a unicode character _x_.

^
{:#print} **print**(_values_...)
: Prints the given values joined by spaces to standard output.

^
{:#rand} **rand**([_x_: number [, _y_: number]])
: If no argument is given, returns a random number between 0 and 1. If _x_ is given, returns a 
  random number between 0 and _x_. If _y_ is given, returns a random number between _x_ and _y_.

^
{:#setprop} **setprop**(_object_: instance, _name_: string, _value_: any)
: Sets the value of the _object_'s property with the matching _name_ to the given _value_. If the 
  property already exists, it overwrites it and returns `true`, otherwise it returns `false`.

^
{:#sum} **sum**(_numbers_...)
: Returns the sum of all the given numbers. _This method expects at least two arguments._

^
{:#time} **time**()
: Returns the current epoch time in seconds.

^
{:#to_bool} **to_bool**(_x_: any)
: Converts the given value into a boolean. If _x_ is an instance of class _y_ and _y_ defines 
  `@to_bool()` decorator, returns `x.@to_bool()`.

^
{:#to_dict} **to_dict**(_x_: any)
: Converts the given value into a dictionary. If _x_ is an instance of class _y_ and _y_ defines 
  `@to_dict())` decorator, returns `x.@to_dict()`.

^
{:#to_int} **to_int**(_x_: number | instance)
: If _x_ is a number, converts the given value into an integer and returns the integer. If _x_ is 
  an instance of a class and the class defines `@to_int()` decorator, returns `x.@to_int()`.

^
{:#to_list} **to_list**(_x_: any)
: Converts the given value into a list. If _x_ is an instance of class _y_ and _y_ defines 
  `@to_list()` decorator, returns `x.@to_list()`.

^
{:#to_number} **to_number**(_x_: any)
: Converts the given value into a number. If _x_ is an instance of class _y_ and _y_ defines 
  `@to_number()` decorator, returns `x.@to_number()`.

^
{:#to_string} **to_string**(_x_: any)
: Converts the given value into a string. If _x_ is an instance of class _y_ and _y_ defines 
  `@to_string()` decorator, returns `x.@to_string()`.

^
{:#typeof} **typeof**(_x_: any)
: Returns the name of the type of _x_ as a string.




<br><br>

[Previous Topic](./functions) | [Next Topic](./class){:class="float-right"}