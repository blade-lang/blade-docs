---
layout: default
title: types
parent: Standard Library
nav_order: 26
permalink: /standard/types
---

# types

Provides type validation and conversion capabilities

This module is wrapper around the builtin functions
where applicable and does and return the same thing as the builtin
alternative.



<h2>Functions</h2><hr>

{:#types__of} _types_.**of**(_value_: any)
: returns the name of the type of value
  > - method implemented as part of core language features


^
{:#types__digit} _types_.**digit**(_value_: char)
: returns true if the value is a character and digit,
  otherwise returns false
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__alpha} _types_.**alpha**(_value_: char)
: returns true if the value is a character and alphabetic,
  otherwise returns false
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__int} _types_.**int**(_value_: any)
: returns true if the value is an integer or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__bool} _types_.**bool**(_value_: any)
: returns true if the value is a boolean or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__number} _types_.**is_number**(_value_: any)
: returns true if the value is a number or false otherwise
  > - this method also returns true for integers
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__char} _types_.**char**(_value_: any)
: returns true if the value is a single character or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__string} _types_.**string**(_value_: any)
: returns true if the value is a string or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__bytes} _types_.**bytes**(_value_: any)
: returns true if the value is a bytes or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__list} _types_.**list**(_value_: any)
: returns true if the value is a list or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__dict} _types_.**is_dict**(_value_: any)
: returns true if the value is a dictionary or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__object} _types_.**object**(_value_: any)
: returns true if the value is an object or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__function} _types_.**function**(_value_: any)
: returns true if the value is a function or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__is_a_class} _types_.**class**(_value_: any)
: returns true if the value is a class or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__file} _types_.**file**(_value_: any)
: returns true if the value is a file or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__iterable} _types_.**iterable**(_value_: any)
: returns true if the value is an iterable or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__callable} _types_.**callable**(_value_: any)
: returns true if the value is a callable function or class and false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#types__instance} _types_.**instance**(_value_: any, _type_: class)
: returns true if the value is an instance the given class, false
  otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>





<h2>Classes</h2><hr>



### _class_ Convert 
---

The Convert class handles conversion from one type to another


#### class Convert methods
---

{:#_Convert_Convert} **Convert**(_value_: any)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_Convert_to_int} **to_int**()
: convert the value into an integer.
  > - classes may override the return value by declaring a to_int()
  function.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Convert_to_number} **to_number**()
: convert the value into a number.
  > - classes may override the return value by declaring a to_number()
  function.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Convert_to_string} **to_string**()
: convert the value into a string.
  > - classes may override the return value by declaring a to_string()
  function.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Convert_to_bool} **to_bool**()
: converts the value into a boolean.
  > - classes may override the return value by declaring a to_bool()
  function.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Convert_to_list} **to_list**()
: convert the value into a list.
  > - classes may override the return value by declaring a to_list()
  function.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Convert_to_dict} **to_dict**()
: convert the value value into a dictionary.
  > - classes may override the return value by declaring a to_dict()
  function.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>




