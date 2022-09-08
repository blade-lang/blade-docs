---
layout: default
title: iters
parent: Standard Library
nav_order: 17
permalink: /standard/iters
---

# iters

Provides functions for simplifying the usage of iterables.



<h2>Functions</h2><hr>

{:#iters__each} _iters_.**each**(_object_: iterable, _callback_: function)
: Calls function `callback` for each item in the iterale `object` and 
  pass the item and index as arguments to the callback function. 
  The callback function should capture the item its first parameter and if 
  the index of the item in the iterable is needed, it can be captured in 
  the second item.


^
{:#iters__reduce} _iters_.**reduce**(_list_: list, _callback_: function [, _initial_: any])
: Executes a user-supplied "reducer" callback function on each element 
  of the list, in order, passing in the return value from the calculation 
  on the preceding element. 
  The final result of running the reducer across all elements of the list 
  is a single value.
  
  The first time that the callback is run there is no "return value of the 
  previous calculation". If supplied, an initial value may be used in its 
  place. Otherwise the list element at index 0 is used as the initial value 
  and iteration starts from the next element (index 1 instead of index 0).


^
{:#iters__map} _iters_.**map**(_list_: list, _callback_: function)
: Creates a new list populated with the results of calling the provided 
  callback on every element in the list.


^
{:#iters__some} _iters_.**some**(_list_: list, _callback_: function)
: Tests whether at least one element in the list passes the test 
  implemented by the provided function. It returns true if, in the list, 
  it finds an element for which the provided function returns true; 
  otherwise it returns false.


^
{:#iters__every} _iters_.**every**(_list_: list, _callback_: function)
: Tests whether all elements in the list passes the test implemented by 
  the provided function. It returns false if, in the list, it finds an 
  element for which the provided function returns false.


^
{:#iters__filter} _iters_.**filter**(_list_: list, _callback_: function)
: Creates a new list with all elements that pass the test implemented by 
  the provided function.


