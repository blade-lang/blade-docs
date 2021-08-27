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

Blade dictionaries are arbitary key-value pairs separated by colons (`:`) enclosed in braces (`{}`).

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
: Returns the length of the dictionary. The length of a Blade dictionary is equal to the number of
  keys it contains. i.e. `dict.length() == dict.keys().length()`.

  For example:

  ```blade-repl
  %> {name: 'Blade', version: 1}.length()
  2
  ```


^
{:#add} _dict_.**add**(_key_: any, _value_: any)
: Adds a new key-value pair to the dictionary with the given key and value.<br>

  For example:

  ```blade-repl
  %> var dict = {}
  %> dict.add('name', 'Blade')
  nil
  %> dict
  {name: Blade}
  ```


^
{:#set} _dict_.**set**(_key_: any, _value_: any)
: Sets the value of the given key to the given value in the dictionary. If there is no exisiting entry
  for the key in the dictionary, a new entry will be added.<br>

  For example:

  ```blade-repl
  %> dict.set('name', 'New Blade')
  nil
  %> dict
  {name: New Blade}
  %> dict.set('version', 1)
  nil
  %> dict
  {name: New Blade, version: 1}
  ```

  > **_@note_:** `dict.set(x, y)` is equivalent to the following Blade code.
  > ```blade-repl
  > %> if dict.contains(x) {
  > ..   dict[x] = 1
  > .. } else {
  > ..   dict.add(x, 1)
  > .. }
  > ```


^
{:#clear} _dict_.**clear**()
: Clears the content of the dictionary.<br>

  For example:
  
  ```blade-repl
  %> var a = {name: 'Blade'}
  %> a
  {name: Blade}
  %> a.clear()
  nil
  %> a
  {}
  ```


^
{:#clone} _dict_.**clone**()
: Returns a new dictionary which is a deep copy of the original dictionary.<br>

  For example:
  
  ```blade-repl
  %> var new_dict = dict.clone()
  %> new_dict
  {name: New Blade, version: 1}
  ```


^
{:#compact} _dict_.**compact**()
: Returns a new dictionary that contains every key-value pair in the original dictionary except
  for keys whose associated value is `nil`.

  For example:

  ```blade-repl
  %> var dict2 = {name: 'James', age: 20, address: nil, country: nil}
  %> dict2.compact()
  {name: James, age: 20}
  ```


^
{:#contains} _dict_.**contains**(_x_: any)
: Returns `true` if any of the keys in the dictionary is equal to _x_, `false` otherwise.<br>

  For example:

  ```blade-repl
  %> dict2.contains('name')
  true
  %> dict2.contains('street')
  false
  ```


^
{:#extend} _dict_.**extend**(_x_: dict)
: Adds all key-value pairs in dictionary _x_ to the original dictionary.<br>

  For example:

  ```blade-repl
  %> var dict = {name: 'Blade'}
  %> dict.extend({version: 1})
  nil
  %> dict
  {name: Blade, version: 1}
  ```


^
{:#get} _dict_.**get**(_key_: any [, _default_: any])
: Returns the value of the given _key_ in the dictionary. If the given key is not defined in the
  dictionary and the _default_ value is given, the default value will be returned. Otherwise, `nil`
  is returned.

  For example:

  ```blade-repl
  %> dict.get('version')   # value exists
  1
  %> dict.get('age')   # value does not exist
  nil
  %> dict.get('age', 6)   # value does not exist, but default is given
  6
  %> dict.get('version', 1.1)   # value exists and default is given
  1
  ```


^
{:#keys} _dict_.**keys**()
: Returns a list containing the keys in the dictionary.<br>

  For example:

  ```blade-repl
  %> dict.keys()
  [name, version]
  ```


^
{:#values} _dict_.**values**()
:  Returns a list containing the value of all keys in the dictionary.<br>

  For example:

  ```blade-repl
  %> dict.values()
  [Blade, 1]
  ```


^
{:#remove} _dict_.**remove**(_key_: any)
: Removes a given key and it's corresponding value from the dictionary and returns the value of
  the key.

  For example:

  ```blade-repl
  %> dict = {username: 'james', email: 'a@b.c', active: true}
  %> dict.remove('active')
  true
  %> dict
  {username: james, email: a@b.c}
  ```


^
{:#is_empty} _dict_.**is_empty**()
: Returns `true` if the dictionary is empty, otherwise returns `false`.<br>

  For example:

  ```blade-repl
  %> dict.is_empty()
  false
  %> {}.is_empty()
  true
  ```


^
{:#find_key} _dict_.**find_key**(_x_: any)
: Returns the key whose value is equal to _x_ in the dictionary or `nil` if no key has the value _x_.<br>

  For example:

  ```blade-repl
  %> dict.find_key('james')
  'username'
  %> dict.find_key('camel')
  nil
  ```


^
{:#to_list} _dict_.**to_list**()
: Returns a list that contains a list of key and a list of values from the dictionary. <br>

  For example:

  ```blade-repl
  %> var dict = {username: 'james', email: 'a@b.c'}
  %> dict.to_list()
  [[username, email], [james, a@b.c]]
  ```



<br><br>

[Previous Topic](./lists) | [Next Topic](./functions)