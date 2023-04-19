---
layout: default
title: reflect
parent: Standard Library
nav_order: 23
permalink: /standard/reflect.html
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
{:#reflect__get_function_metadata} _reflect_.**get_function_metadata**(_object_: function)
: Returns the metadata of a function as a dictionary. 
  This dictionary contains the following keys:
  
  - `name`: The name of the function
  - `arity`: The number of none variable (...) arguments the function defines.
  - `is_variadic`: If the function accepts variable arguments
  - `captured_vars`: The number of variables captured (only greater than zero for captures).
  - `module`: The name of the module from where the function was defined.
  - `file`: The file in which the function was defined.
  
  > - This function does not work for built-in functions
   <div class="cite"><span class="hint">return</span> <span>dictionary</span></div>



^
{:#reflect__get_class_metadata} _reflect_.**get_class_metadata**(_klass_: class)
: Returns the metadata of a class as a dictionary. 
  This dictionary contains the following keys:
  
  - `name`: The name of the class.
  - `properties`: a list of the name of non-static properties defined in the class
  - `static_properties`: a list of the name of static properties defined in the class
  - `methods`: a list of the name of methods defined in the class
  - `superclass`: The name of the class it inherits from.
  
   <div class="cite"><span class="hint">return</span> <span>dictionary</span></div>



^
{:#reflect__get_module_metadata} _reflect_.**get_module_metadata**(_module_: imported module)
: Returns the metadata of an imported module as a dictionary. 
  This dictionary contains the following keys:
  
  - `name`: The name of the module.
  - `file`: The file from which the module was imported.
  - `has_preloader`: `true` if the module is a C extension with a preloader and `false` otherwise.
  - `has_unloader`: `true` if the module is a C extension with a unloader and `false` otherwise.
  - `definitions`: A list of the name of objects defined in the module.
  
   <div class="cite"><span class="hint">return</span> <span>dictionary</span></div>



^
{:#reflect__get_class} _reflect_.**get_class**(_object_: instance)
: Returns the class value of an instance as an object that can be 
  used to create a new instance of that same class.
   <div class="cite"><span class="hint">return</span> <span>class</span></div>



^
{:#reflect__is_ptr} _reflect_.**is_ptr**(_value_: any)
: Returns `true` if _value_ is a pointer, `false` otherwise.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#reflect__get_ptr} _reflect_.**get_ptr**(_value_: any)
: Returns a pointer to the given value.
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>



^
{:#reflect__set_ptr} _reflect_.**set_ptr**(_pointer_: ptr, _value_: any)
: Sets the value at the given pointer's address to the given value.


^
{:#reflect__get_address} _reflect_.**get_address**(_value_: any)
: Returns a the address of the pointer to the value in memory.
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>



^
{:#reflect__ptr_from_address} _reflect_.**ptr_from_address**(_address_: number)
: Returns a pointer to the given memory address.
   <div class="cite"><span class="hint">returns</span> <span>ptr</span></div>



^
{:#reflect__set_global} _reflect_.**set_global**(_fn_: function | class [, _name_: string])
: Sets a function or class as globally accessible in all modules, function and scopes.


^
{:#reflect__run_script} _reflect_.**run_script**(_path_: string)
: Runs the content of a given script in-place as if it were part of the current module.


