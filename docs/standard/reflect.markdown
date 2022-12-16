---
layout: default
title: reflect
parent: Standard Library
nav_order: 23
permalink: /standard/reflect
---

# reflect

This module provides many functions that can be used to interact with or modify modules, 
classes and functions. It is well suited for many uses cases such as creating a library 
that is heavily dependent on decorators (e.g. the `json` module).

### For example,

We can call a decorator using the `reflect` module like this.

```blade
class A {
  @custom_decorator() {
    echo 'It works!'
  }
}

import reflect

var instance_of_a = A()
var decorator = reflect.get_decorator(instance_of_a, 'custom_decorator')

# It's always good to check the result first as it will be a good 
# practice to make decorators optional to make it easy for users to 
# opt-in and opt-out of features your package or library provide.
if decorator {
  decorator()
}
```

Try it out!



<h2>Functions</h2><hr>

{:#reflect__has_prop} _reflect_.**has_prop**(_object_: instance, _name_: string)
: Returns `true` if instance has the property name or `false` if not
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#reflect__get_prop} _reflect_.**get_prop**(_object_: instance, _name_: string)
: Returns the property of the instance matching the given name
  or nil if the object contains no property with a matching name.
   <div class="cite"><span class="hint">return</span> <span>any</span></div>



^
{:#reflect__set_prop} _reflect_.**set_prop**(_object_: instance, _name_: string, _value_: any)
: Sets the named property of the object to value.
  
  > - if the property already exist, it overwrites it
   <div class="cite"><span class="hint">return</span> <span>bool: `true` if a new property was set, `false` if a property was updated</span></div>



^
{:#reflect__del_prop} _reflect_.**del_prop**(_object_: instance, _name_: string)
: Deletes the named property from the instance
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#reflect__has_method} _reflect_.**has_method**(_object_: instance, _name_: string)
: Returns true if class of the instance has the method name or
  false if not.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#reflect__has_decorator} _reflect_.**has_decorator**(_object_: instance, _name_: string)
: Returns true if class of the instance implements the decorator name or
  false if not.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#reflect__get_method} _reflect_.**get_method**(_object_: instance, _name_: string)
: Returns the method in a class instance matching the given name
  or nil if the class of the instance contains no method with
  a matching name.
   <div class="cite"><span class="hint">return</span> <span>function</span></div>



^
{:#reflect__get_decorator} _reflect_.**get_decorator**(_object_: instance, _name_: string)
: Returns the decorator function matching the given name in the class 
  of the given instance.
  > - the name of a decorator excludes the `@` character.
   <div class="cite"><span class="hint">return</span> <span>function</span></div>



^
{:#reflect__bind_method} _reflect_.**bind_method**(_object_: instance, _method_: function)
: Binds the given function to the instance, allowing you to access 
  the instance itself in the function via the `self` keyword in 
  the function.
   <div class="cite"><span class="hint">return</span> <span>function</span></div>



^
{:#reflect__get_type} _reflect_.**get_type**(_object_: instance)
: Returns the type of an instance as string
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#reflect__get_function_metadata} _reflect_.**get_type**(_object_: instance)
: Returns the type of an instance as string
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#reflect__get_class} _reflect_.**get_class**(_object_: instance)
: Returns the class value of an instance as an object that can be 
  used to create a new instance of that same class.
   <div class="cite"><span class="hint">return</span> <span>class</span></div>



^
{:#reflect__is_ptr} _reflect_.**is_ptr**(_value_: any)
: Returns `true` if _value_ is a pointer, `false` otherwise.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



