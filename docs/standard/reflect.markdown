---
layout: default
title: reflect
parent: Standard Library
nav_order: 15
permalink: /standard/reflect
---

# reflect

Provides functionalities for interacting with and modifying modules, 
classes and functions.



<h2>Functions</h2><hr>

{:#reflect__has_prop} _reflect_.**has_prop**(_object_: instance, _name_: string)
: returns true if instance has the property name or false if not
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#reflect__get_prop} _reflect_.**get_prop**(_object_: instance, _name_: string)
: returns the property of the instance matching the given name
  or nil if the object contains no property with a matching
  name
   <div class="cite"><span class="hint">return</span> <span>any</span></div>



^
{:#reflect__set_prop} _reflect_.**set_prop**(_object_: instance, _name_: string, _value_: any)
: sets the named property of the object to value.
  
   <div class="cite"><span class="hint">note</span> <span>if the property already exist, it overwrites it</span></div>

   <div class="cite"><span class="hint">return</span> <span>bool: true if a new property was set, false if a property was</span></div>

  updated


^
{:#reflect__del_prop} _reflect_.**del_prop**(_object_: instance, _name_: string)
: deletes the named property from the instance
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#reflect__has_method} _reflect_.**has_method**(_object_: instance, _name_: string)
: returns true if class of the instance has the method name or
  false if not.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#reflect__has_decorator} _reflect_.**has_decorator**(_object_: instance, _name_: string)
: returns true if class of the instance implements the decorator name or
  false if not.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#reflect__get_method} _reflect_.**get_method**(_object_: instance, _name_: string)
: returns the method in a class instance matching the given name
  or nil if the class of the instance contains no method with
  a matching name.
   <div class="cite"><span class="hint">return</span> <span>function</span></div>



^
{:#reflect__get_decorator} _reflect_.**get_decorator**(_object_: instance, _name_: string)
: returns the decorator function matching the given name in the class 
  of the given instance.
   <div class="cite"><span class="hint">note</span> <span>the name of a decorator excludes the `@` character.</span></div>

   <div class="cite"><span class="hint">return</span> <span>function</span></div>



^
{:#reflect__bind_method} _reflect_.**bind_method**(_object_: instance, _method_: function)
: binds the given function to the instance, allowing you to access 
  the instance itself in the function via the `self` keyword in 
  the function.
   <div class="cite"><span class="hint">return</span> <span>function</span></div>



