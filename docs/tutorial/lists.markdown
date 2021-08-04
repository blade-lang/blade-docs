---
layout: default
title: Lists
parent: Tutorial
nav_order: 10
permalink: /tutorial/lists
---

# Lists

Lists in Blade are sequence types that is used to hold zero or more values in a single storage. 
Each item in a list is assigned a number (index) starting from zero (`0`) for the first item. 
Blade Lists are comma (`,`) separated list of different values of different or same type. For example, 
a list can contain only number, another can contain a mixture of numbers and strings and yet another 
can contain lists as well.

Creating a list is very simple. Simply type a left square bracket (`[`), followed by the values in 
the list if any, all separated by commas and close it all with a right square bracket (`]`). 

For example:

```blade-repl
%> [1, 2, 3]
[1, 2, 3]
%> ['Lane', 21, nil]
[Lane, 21, nil]
%> [['Lois', 36], ['Clark', 27]]
[[Lois, 36], [Clark, 27]]
```

A list can contain any mixture of data types.


## List Operations
---

Like Strings, Lists support lots of operations too, but Lists generally support fewer _operators_. 
List supports additions, slicing, iteration and methods too.

Working with Lists is a breeze. For example, adding two lists together looks like this:

```blade-repl
%> [1, 2] + [3, 4]
[1, 2, 3, 4]
%> ['Hello'] + ['World']
[Hello, World]
```

Lists follow the same indexing and slicing rules as [Strings](./strings) so for breviety, we'll 
not go into the whole academic stuffs anymore.

Just for a quick run-through, accessing indexes in _Lists_ will look like this:

```blade-repl
%> var names = ['John', 'Wick', 'III']
%> names[1]
'Wick'
%> names[-1]
'III'
```

And slicing _Lists_ just like [Strings](./strings#string-operations) will look like this:

```blade-repl
%> var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]
%> numbers[,]
[1, 2, 3, 4, 5, 6, 7, 8, 9]
%> numbers[-1,]
[]
%> numbers[,3]
[1, 2, 3]
%> numbers[2,6]
[3, 4, 5, 6]
%> numbers[4,]
[5, 6, 7, 8, 9]
%> numbers[4,-2]
[5, 6, 7]
```


## Looping thorugh Lists
---


## List Methods
---

{:#length} _list_.**length**()
: 


^
{:#append} _list_.**append**()
: 


^
{:#clear} _list_.**clear**()
: 


^
{:#clone} _list_.**clone**()
: 


^
{:#count} _list_.**count**()
: 


^
{:#extend} _list_.**extend**()
: 


^
{:#index_of} _list_.**index_of**()
: 


^
{:#insert} _list_.**insert**()
: 


^
{:#pop} _list_.**pop**()
: 


^
{:#shift} _list_.**shift**()
: 


^
{:#remove_at} _list_.**remove_at**()
: 


^
{:#remove} _list_.**remove**()
: 


^
{:#reverse} _list_.**reverse**()
: 


^
{:#sort} _list_.**sort**()
: 


^
{:#contains} _list_.**contains**()
: 


^
{:#delete} _list_.**delete**()
: 


^
{:#first} _list_.**first**()
: 


^
{:#last} _list_.**last**()
: 


^
{:#is_empty} _list_.**is_empty**()
: 


^
{:#take} _list_.**take**()
: 


^
{:#get} _list_.**get**()
: 


^
{:#compact} _list_.**compact**()
: 


^
{:#unique} _list_.**unique**()
: 


^
{:#zip} _list_.**zip**()
: 


^
{:#to_dict} _list_.**to_dict**()
: 





<br><br>

[Previous Topic](./loops) | [Next Topic](./dictionaries)