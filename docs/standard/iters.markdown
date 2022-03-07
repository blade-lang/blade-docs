---
layout: default
title: iters
parent: Standard Library
nav_order: 13
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


