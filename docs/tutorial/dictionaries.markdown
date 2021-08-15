---
layout: default
title: Dictionaries
parent: Tutorial
nav_order: 11
permalink: /tutorial/dictionaries
---

# Dictionaries

Blade dictionaries are built on powerful hashtables with fast key lookups. Creating Blade dictionaries
are extremely similar to how you create objects in JavaScript and for developers coming from that
language will find Blade dictionaries very familiar.

Blade dictionaries are arbitary key/value pairs separated by colons (`:`) enclosed in braces (`{}`).

For example:

```blade-repl
%> {'name': 'Blade', 'version': 0.5}
{name: Blade, version: 0.5}
%> {}    # empty dictionary
{}
```

> While dictionary values can be any valid Blade object, keys can only be one of [String](./strings), 
> [Number](./numbers) or Boolean.

For example:

```blade-repl
%> {0: 'number', false: 'boolean', 'key': 'string'}
{0: number, false: boolean, key: string}
```

For string keys in a dictionary, the quotation may be excluded given that the string contains no space 
or any non alphanumeric character or the unquoted version equals to a boolean value.

For example:

```blade-repl
%> {country: 'Nigeria', dial_code: 234, in_africa: true}
{country: Nigeria, dial_code: 234, in_africa: true}
```

## Accessing members of a Dictionary
---

Each key in a dictionary is a property of the given dictionary and as such, dictionary like strings 
and lists support index access.

For example:

```blade-repl
%> var a = {name: 'Blade', version: 0.5}
%> a['name']
'Blade'
```

And they also support property access whenever the key is a string. For example, the above `a['name']` 
could also be written as:

```blade-repl
%> a.name
'Blade'
```

## Looping through dictionaries
---

There are two ways to loop through a dictionary in Blade. We can loop through the dictionary itself 
using the specialized _for_ loop, of loop through its keys using any of the _while_ or _iter_ loop.

Below is an example looping through the dictionary itself using the _for_ loop.

```blade-repl
%> var person = {name: 'Ceaser', birth: '29AD', nation: 'Rome', position: 'Emperor'}
%> for x, y in person {
..   print(x, '=', y)
.. }
name = Ceaser
birth = 29AD
nation = Rome
position = Emperor
```

Unlike strings and lists, note that this _for_ loop takes two variables. This is to allow us take 
the key into the first and the value into the second variable respectively. 

If we only want to loop through the values without concern for the keys, we can use a single variable 
to hold our value and still iterate correctly. Note however that the corresponding _key_ information 
will be lost in the loop.

For example:

```blade-repl
%> for x in person {
..   echo x
.. }
'Ceaser'
'29AD'
'Rome'
'Emperor'
```

<br>
The following example loops through the dictionary by looping through the keys of the dictionary. 

```blade-repl
%> var keys = person.keys()
%> iter var i = 0; i < keys.length(); i++ {
..   print(keys[i], '=', person[keys[i]])
.. }
name = Ceaser
birth = 29AD
nation = Rome
position = Emperor
```

The technique presented above is to walk through the keys of the dictionary and use the current key 
to index the dictionary. While the example uses the _iter_ loop, the same technique applies to the 
_while_ loop. 


## Dictionary methods
---

Blade dictionaries comes with a lot of power packed methods like other objects. The methods are 
detailed below.

{:#length} _dict_.**length**()
: 


^
{:#add} _dict_.**add**(_key_: any, _value_: any)
: 


^
{:#set} _dict_.**set**(_key_: any, _value_: any)
: 


^
{:#clear} _dict_.**clear**()
: 


^
{:#clone} _dict_.**clone**()
: 


^
{:#compact} _dict_.**compact**()
: 


^
{:#contains} _dict_.**contains**(_key_: any)
: 


^
{:#extend} _dict_.**extend**(_x_: dict)
: 


^
{:#get} _dict_.**get**(_key_: any [, _default_: any])
: 


^
{:#keys} _dict_.**keys**()
: 


^
{:#values} _dict_.**values**()
: 


^
{:#remove} _dict_.**remove**(_key_: any)
: 


^
{:#assign} _dict_.**assign**(_key_: any, _value_: any)
: 


^
{:#is_empty} _dict_.**is_empty**()
: 


^
{:#find_key} _dict_.**find_key**(_key_: any)
: 


^
{:#to_list} _dict_.**to_list**()
: 


^
{:#has_attr} _dict_.**has_attr**(_attr_: any)
: 



<br><br>

[Previous Topic](./lists) | [Next Topic](./functions)