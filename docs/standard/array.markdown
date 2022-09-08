---
layout: default
title: array
parent: Standard Library
nav_order: 5
permalink: /standard/array
---

# array

This moddule provides multiple classes for working with arrays of twos-complement 
integers in the platform byte order. The classes provided in this module complement
the _bytes()_ object and allow higher other binary data manipulation.



<h2>Properties</h2><hr>

{:#array__INT16_MAX} _array._**INT16_MAX**
: Maximum value that "should" exist in a list passed to Int16Array.


^
{:#array__UINT16_MAX} _array._**UINT16_MAX**
: Maximum value that "should" exist in a list passed to UInt16Array.


^
{:#array__INT32_MAX} _array._**INT32_MAX**
: Maximum value that "should" exist in a list passed to Int32Array.


^
{:#array__UINT32_MAX} _array._**UINT32_MAX**
: Maximum value that "should" exist in a list passed to UInt32Array.


^
{:#array__INT64_MAX} _array._**INT64_MAX**
: Maximum value that "should" exist in a list passed to Int64Array.


^
{:#array__UINT64_MAX} _array._**UINT64_MAX**
: Maximum value that "should" exist in a list passed to UInt64Array.


^
{:#array__INT16_MIN} _array._**INT16_MIN**
: Minimum value that "should" exist in a list passed to Int16Array.


^
{:#array__INT32_MIN} _array._**INT32_MIN**
: Minimum value that "should" exist in a list passed to Int32Array.


^
{:#array__INT64_MIN} _array._**INT64_MIN**
: Minimum value that "should" exist in a list passed to Int64Array.




<h2>Classes</h2><hr>



### _class_ Int16Array 
---

class Int16Array represents an array of twos-complement 16-bit signed 
  integers in the platform byte order.
  
  @printable
  @iterable
  @serializable


#### class Int16Array methods
---

{:#_Int16Array_Int16Array} **Int16Array**(_n_: number | list)
: - If n is a number, it creates a new Int16Array that can hold up to n 
  number of elements, but with all the elements set to 0. 
  - If n is a list, it creates a new Int16Array with its elements set to 
  the values in the list.
   <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_Int16Array_length} **length**()
: Returns the number of items in the array.


{:#_Int16Array_bytes_length} **bytes_length**()
: Returns the length of the array if it were to be converted to bytes.


{:#_Int16Array_first} **first**()
: Returns the first item in the array or nil if the array is empty.


{:#_Int16Array_last} **last**()
: Returns the last item in the array or nil if the array is empty.


{:#_Int16Array_append} **append**(_value_: int)
: Adds the given _value_ to the end of the array.


{:#_Int16Array_get} **get**(_index_: number)
: Returns the number at the specified index in the array. If index is 
  outside the boundary of the array indexes (0..(array.length() - 1)), 
  an exception is thrown.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Int16Array_extend} **extend**(_array_: Int16Array)
: Updates the content of the current array by appending all the contents 
  of _array_ to the end of the array in exact order.


{:#_Int16Array_reverse} **reverse**()
: Returns a new array containing the elements in the original array 
  in reverse order.


{:#_Int16Array_clone} **clone**()
: Returns a new Int16Array containing all items from the current array. 
  The new array is a shallow copy of the original array.
   <div class="cite"><span class="hint">return</span> <span>Int16Array</span></div>



{:#_Int16Array_pop} **pop**()
: Removes the last element in the array and returns the value of that item.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Int16Array_to_bytes} **to_bytes**()
: Returns the array as a bytes object
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



{:#_Int16Array_to_list} **to_list**()
: Returns the elements of the array as a list of numbers
   <div class="cite"><span class="hint">return</span> <span>list</span></div>



{:#_Int16Array_to_string} **to_string**()
: Returns a string representation of the array
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_Int16Array_get_pointer} **get_pointer**()
: Returns the raw int16 array pointer.
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>




^


### _class_ Int32Array 
---

class Int32Array represents an array of twos-complement 32-bit signed 
  integers in the platform byte order.
  
  @printable
  @iterable
  @serializable


#### class Int32Array methods
---

{:#_Int32Array_Int32Array} **Int32Array**(_n_: number | list)
: - If n is a number, it creates a new Int32Array that can hold up to n 
  number of elements, but with all the elements set to 0. 
  - If n is a list, it creates a new Int32Array with its elements set to 
  the values in the list.
   <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_Int32Array_length} **length**()
: Returns the number of items in the array.


{:#_Int32Array_bytes_length} **bytes_length**()
: Returns the length of the array if it were to be converted to bytes.


{:#_Int32Array_first} **first**()
: Returns the first item in the array or nil if the array is empty.


{:#_Int32Array_last} **last**()
: Returns the last item in the array or nil if the array is empty.


{:#_Int32Array_append} **append**(_value_: int)
: Adds the given _value_ to the end of the array.


{:#_Int32Array_get} **get**(_index_: number)
: Returns the number at the specified index in the array. If index is 
  outside the boundary of the array indexes (0..(array.length() - 1)), 
  an exception is thrown.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Int32Array_extend} **extend**(_array_: Int32Array)
: Updates the content of the current array by appending all the contents 
  of _array_ to the end of the array in exact order.


{:#_Int32Array_reverse} **reverse**()
: Returns a new array containing the elements in the original array 
  in reverse order.


{:#_Int32Array_clone} **clone**()
: Returns a new Int32Array containing all items from the current array. 
  The new array is a shallow copy of the original array.
   <div class="cite"><span class="hint">return</span> <span>Int32Array</span></div>



{:#_Int32Array_pop} **pop**()
: Removes the last element in the array and returns the value of that item.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Int32Array_to_bytes} **to_bytes**()
: Returns the array as a bytes object
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



{:#_Int32Array_to_list} **to_list**()
: Returns the elements of the array as a list of numbers
   <div class="cite"><span class="hint">return</span> <span>list</span></div>



{:#_Int32Array_to_string} **to_string**()
: Returns a string representation of the array
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_Int32Array_get_pointer} **get_pointer**()
: Returns the raw int32 array pointer.
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>




^


### _class_ Int64Array 
---

class Int64Array represents an array of twos-complement 64-bit signed 
  integers in the platform byte order.
  
  @printable
  @iterable
  @serializable


#### class Int64Array methods
---

{:#_Int64Array_Int64Array} **Int64Array**(_n_: number | list)
: - If n is a number, it creates a new Int64Array that can hold up to n 
  number of elements, but with all the elements set to 0. 
  - If n is a list, it creates a new Int64Array with its elements set to 
  the values in the list.
   <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_Int64Array_length} **length**()
: Returns the number of items in the array.


{:#_Int64Array_bytes_length} **bytes_length**()
: Returns the length of the array if it were to be converted to bytes.


{:#_Int64Array_first} **first**()
: Returns the first item in the array or nil if the array is empty.


{:#_Int64Array_last} **last**()
: Returns the last item in the array or nil if the array is empty.


{:#_Int64Array_append} **append**(_value_: int)
: Adds the given _value_ to the end of the array.


{:#_Int64Array_get} **get**(_index_: number)
: Returns the number at the specified index in the array. If index is 
  outside the boundary of the array indexes (0..(array.length() - 1)), 
  an exception is thrown.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Int64Array_extend} **extend**(_array_: Int64Array)
: Updates the content of the current array by appending all the contents 
  of _array_ to the end of the array in exact order.


{:#_Int64Array_reverse} **reverse**()
: Returns a new array containing the elements in the original array 
  in reverse order.


{:#_Int64Array_clone} **clone**()
: Returns a new Int64Array containing all items from the current array. 
  The new array is a shallow copy of the original array.
   <div class="cite"><span class="hint">return</span> <span>Int64Array</span></div>



{:#_Int64Array_pop} **pop**()
: Removes the last element in the array and returns the value of that item.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Int64Array_to_bytes} **to_bytes**()
: Returns the array as a bytes object
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



{:#_Int64Array_to_list} **to_list**()
: Returns the elements of the array as a list of numbers
   <div class="cite"><span class="hint">return</span> <span>list</span></div>



{:#_Int64Array_to_string} **to_string**()
: Returns a string representation of the array
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_Int64Array_get_pointer} **get_pointer**()
: Returns the raw int64 array pointer.
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>




^


### _class_ UInt16Array 
---

class UInt16Array represents an array of twos-complement 16-bit unsigned 
  integers in the platform byte order.
  
  @printable
  @iterable
  @serializable


#### class UInt16Array methods
---

{:#_UInt16Array_UInt16Array} **UInt16Array**(_n_: number | list)
: - If n is a number, it creates a new UInt16Array that can hold up to n 
  number of elements, but with all the elements set to 0. 
  - If n is a list, it creates a new UInt16Array with its elements set to 
  the values in the list.
   <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_UInt16Array_length} **length**()
: Returns the number of items in the array.


{:#_UInt16Array_bytes_length} **bytes_length**()
: Returns the length of the array if it were to be converted to bytes.


{:#_UInt16Array_first} **first**()
: Returns the first item in the array or nil if the array is empty.


{:#_UInt16Array_last} **last**()
: Returns the last item in the array or nil if the array is empty.


{:#_UInt16Array_append} **append**(_value_: int)
: Adds the given _value_ to the end of the array.


{:#_UInt16Array_get} **get**(_index_: number)
: Returns the number at the specified index in the array. If index is 
  outside the boundary of the array indexes (0..(array.length() - 1)), 
  an exception is thrown.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_UInt16Array_extend} **extend**(_array_: UInt16Array)
: Updates the content of the current array by appending all the contents 
  of _array_ to the end of the array in exact order.


{:#_UInt16Array_reverse} **reverse**()
: Returns a new array containing the elements in the original array 
  in reverse order.


{:#_UInt16Array_clone} **clone**()
: Returns a new UInt16Array containing all items from the current array. 
  The new array is a shallow copy of the original array.
   <div class="cite"><span class="hint">return</span> <span>UInt16Array</span></div>



{:#_UInt16Array_pop} **pop**()
: Removes the last element in the array and returns the value of that item.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_UInt16Array_to_bytes} **to_bytes**()
: Returns the array as a bytes object
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



{:#_UInt16Array_to_list} **to_list**()
: Returns the elements of the array as a list of numbers
   <div class="cite"><span class="hint">return</span> <span>list</span></div>



{:#_UInt16Array_to_string} **to_string**()
: Returns a string representation of the array
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_UInt16Array_get_pointer} **get_pointer**()
: Returns the raw uint16 array pointer.
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>




^


### _class_ UInt32Array 
---

class UInt32Array represents an array of twos-complement 32-bit unsigned 
  integers in the platform byte order.
  
  @printable
  @iterable
  @serializable


#### class UInt32Array methods
---

{:#_UInt32Array_UInt32Array} **UInt32Array**(_n_: number | list)
: - If n is a number, it creates a new UInt32Array that can hold up to n 
  number of elements, but with all the elements set to 0. 
  - If n is a list, it creates a new UInt32Array with its elements set to 
  the values in the list.
   <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_UInt32Array_length} **length**()
: Returns the number of items in the array.


{:#_UInt32Array_bytes_length} **bytes_length**()
: Returns the length of the array if it were to be converted to bytes.


{:#_UInt32Array_first} **first**()
: Returns the first item in the array or nil if the array is empty.


{:#_UInt32Array_last} **last**()
: Returns the last item in the array or nil if the array is empty.


{:#_UInt32Array_append} **append**(_value_: int)
: Adds the given _value_ to the end of the array.


{:#_UInt32Array_get} **get**(_index_: number)
: Returns the number at the specified index in the array. If index is 
  outside the boundary of the array indexes (0..(array.length() - 1)), 
  an exception is thrown.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_UInt32Array_extend} **extend**(_array_: UInt32Array)
: Updates the content of the current array by appending all the contents 
  of _array_ to the end of the array in exact order.


{:#_UInt32Array_reverse} **reverse**()
: Returns a new array containing the elements in the original array 
  in reverse order.


{:#_UInt32Array_clone} **clone**()
: Returns a new UInt32Array containing all items from the current array. 
  The new array is a shallow copy of the original array.
   <div class="cite"><span class="hint">return</span> <span>UInt32Array</span></div>



{:#_UInt32Array_pop} **pop**()
: Removes the last element in the array and returns the value of that item.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_UInt32Array_to_bytes} **to_bytes**()
: Returns the array as a bytes object
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



{:#_UInt32Array_to_list} **to_list**()
: Returns the elements of the array as a list of numbers
   <div class="cite"><span class="hint">return</span> <span>list</span></div>



{:#_UInt32Array_to_string} **to_string**()
: Returns a string representation of the array
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_UInt32Array_get_pointer} **get_pointer**()
: Returns the raw uint32 array pointer.
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>




^


### _class_ UInt64Array 
---

class UInt64Array represents an array of twos-complement 64-bit unsigned 
  integers in the platform byte order.
  
  @printable
  @iterable
  @serializable


#### class UInt64Array methods
---

{:#_UInt64Array_UInt64Array} **UInt64Array**(_n_: number | list)
: - If n is a number, it creates a new UInt64Array that can hold up to n 
  number of elements, but with all the elements set to 0. 
  - If n is a list, it creates a new UInt64Array with its elements set to 
  the values in the list.
   <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_UInt64Array_length} **length**()
: Returns the number of items in the array.


{:#_UInt64Array_bytes_length} **bytes_length**()
: Returns the length of the array if it were to be converted to bytes.


{:#_UInt64Array_first} **first**()
: Returns the first item in the array or nil if the array is empty.


{:#_UInt64Array_last} **last**()
: Returns the last item in the array or nil if the array is empty.


{:#_UInt64Array_append} **append**(_value_: int)
: Adds the given _value_ to the end of the array.


{:#_UInt64Array_get} **get**(_index_: number)
: Returns the number at the specified index in the array. If index is 
  outside the boundary of the array indexes (0..(array.length() - 1)), 
  an exception is thrown.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_UInt64Array_extend} **extend**(_array_: UInt64Array)
: Updates the content of the current array by appending all the contents 
  of _array_ to the end of the array in exact order.


{:#_UInt64Array_reverse} **reverse**()
: Returns a new array containing the elements in the original array 
  in reverse order.


{:#_UInt64Array_clone} **clone**()
: Returns a new UInt64Array containing all items from the current array. 
  The new array is a shallow copy of the original array.
   <div class="cite"><span class="hint">return</span> <span>UInt64Array</span></div>



{:#_UInt64Array_pop} **pop**()
: Removes the last element in the array and returns the value of that item.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_UInt64Array_to_bytes} **to_bytes**()
: Returns the array as a bytes object
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



{:#_UInt64Array_to_list} **to_list**()
: Returns the elements of the array as a list of numbers
   <div class="cite"><span class="hint">return</span> <span>list</span></div>



{:#_UInt64Array_to_string} **to_string**()
: Returns a string representation of the array
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_UInt64Array_get_pointer} **get_pointer**()
: Returns the raw uint64 array pointer.
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>




