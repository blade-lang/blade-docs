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

Lists can be iterated using any of the looping techniques available in Blade. However, the `iter` 
and the `for` loop are the recommended as they will require fewer moving parts, and Lists are 
optimized for those looping techniques.

For example, you can use the `iter` loop like this:

```blade-repl
%> var users = ['Gabriel', 'Anna', 'Cindarella']
%> iter var i = 0; i < users.length(); i++ {
..   echo users[i]
.. }
'Gabriel'
'Anna'
'Cindarella'
```

The above example uses the `iter` loop to iterate through the list. Notice how the condition uses 
the `length()` method of the list and how we accessed the current list item using the iteration 
variable.

We can do the same with the `for` loop using even fewer code schematics. For example,

```blade-repl
%> users = ['James', 'Lucy', 'Estonia']
%> for user in users {
..   echo user
.. }
'James'
'Lucy'
'Estonia'
```

We can also use the `while` loop to iterate through a list. For example,

```blade-repl
%> users = ['Odin', 'Parker', 'Kent']
%> var i = 0
%> while i < users.length() {
..   echo users[i]
..   i++
.. }
'Odin'
'Parker'
'Kent'
```

## List Methods
---

Lists support methods operations too. Here are a list of all the methods supported by list.

{:#length} _list_.**length**()
: Returns the number of items in the list. <br>
  
  For example:
  
  ```blade-repl
  %> ['A', 'B', 'C'].length()
  3
  ```


^
{:#append} _list_.**append**(_x_: any)
: Adds the given value _x_ to the end of the list.
  
  For example:

  ```blade-repl
  %> var a = [1,2,3]
  %> a.append(4)
  %> a
  [1, 2, 3, 4]
  ```


^
{:#clear} _list_.**clear**()
: Removes all items from the list.<br>
  
  For example:

  ```blade-repl
  %> var a = [1,2,3,4,5]
  %> a
  [1, 2, 3, 4, 5]
  %> a.clear()
  %> a
  []
  ```


^
{:#clone} _list_.**clone**()
: Returns a new list containing all items from the _list_. The new list is a shallow copy of the 
  original list. This is equivalent to `list[,]`.

  For example:

  ```blade-repl
  %> var a = [1, 2, 3]
  %> var b = a.clone()
  %> a.append(4)
  %> a
  [1, 2, 3, 4]
  %> b
  [1, 2, 3]
  ```


^
{:#count} _list_.**count**(_x_: any)
: Returns the number of times itesm _x_ occurs in the list.
  
  For example:

  ```blade-repl
  %> [1, 2, 1, 3, 2, 1, 1].count(1)
  4
  ```


^
{:#extend} _list_.**extend**(_x_: list)
: Updates the content of the _list_ by appending all the contents of list _x_ to the end of the 
  original list in exact order. This is equivalent to `list + x`.

  For example:

  ```blade-repl
  %> var a = [1, 2, 3]
  %> var b = [4, 5, 6]
  %> a.extend(b)
  %> a
  [1, 2, 3, 4, 5, 6]
  %> b
  [4, 5, 6]
  ```


^
{:#index_of} _list_.**index_of**(_x_: any)
: Returns the zero-based index of the first occurrence of the value _x_ in the list or `-1` if 
  the list does not contain the value _x_.

  For example:

  ```blade-repl
  %> [1,2].index_of(3)
  -1
  %> [4,5,6,5].index_of(5)
  1
  ```


^
{:#insert} _list_.**insert**(_x_: any, _index_: number)
: Inserts the item _x_ into the list at the specified _index_. By specifying an index of zero 
  (`list.insert(x, 0)`), one can prepend the list and `list.insert(x, list.length())` is equivalent 
  to `list.append(x)`. If the _index_ specified is greater than `list.length()`, the list will be 
  padded with `nil` up till the index preceeding the specified index. 

  For example:

  ```blade-repl
  %> var a = [1,2,3]
  %> a.insert(4, 0)
  %> a
  [4, 1, 2, 3]
  %> a.insert(5, a.length())
  %> a
  [4, 1, 2, 3, 5]
  %> a.insert(6, 3)
  %> a
  [4, 1, 2, 6, 3, 5]
  %> a.insert(7, 11)
  %> a
  [4, 1, 2, 6, 3, 5, nil, nil, nil, nil, nil, 7]
  ```


^
{:#pop} _list_.**pop**()
: Removes the last item in a list and returns the value of that item.<br>
  
  For example:

  ```blade-repl
  %> var a = [4, 5, 6]
  %> a.pop()
  6
  %> a
  [4, 5]
  ```


^
{:#shift} _list_.**shift**([_count_: number])
: Removed the specified count of items from the beginning of the list and returns it. If _count_ 
  is not specified, _count_ defaults to 1. If one item is shifted, the method returns that item. 
  If more than one item is shifted, the method returns a list containing the shifted items.

  > The square brackets (`[]`) around the _`count: number`_ in the method definition indicates that 
  > the parameter is optional and does not mean you have to type the square brackets.

  If the number of items required to be shifted exceeeds the size of the list, the list is cleared
  and `nil` is returned.

  For example:

  ```blade-repl
  %> var a = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
  %> a.shift()
  9
  %> a
  [8, 7, 6, 5, 4, 3, 2, 1, 0]
  %> a.shift(3)
  [8, 7, 6]
  %> a
  [5, 4, 3, 2, 1, 0]
  %> a.shift(10)
  %> a
  []
  ```


^
{:#remove_at} _list_.**remove_at**(_index_: number)
: Removes the item at the specified index in the list and returns it. If the index is less than 
  `0` or greater than `list.length() - 1`, an exception is raised.

  For example:

  ```blade-repl
  %> var a = [1, 2, 3, 4, 5]
  %> a.remove_at(3)
  4
  %> a
  [1, 2, 3, 5]
  %> a.remove_at(6)
  Unhandled Exception: list index 6 out of range at remove_at()
    StackTrace:
      File: <repl>, Line: 1, In: <script>
  %> a.remove_at(-1)
  Unhandled Exception: list index -1 out of range at remove_at()
    StackTrace:
      File: <repl>, Line: 1, In: <script>
  ```


^
{:#remove} _list_.**remove**(_x_: any)
: Removes the first occurrence of item _x_ from the list.
  
  For example:

  ```blade-repl
  %> var a = ['Kirk', 'Tasha', 'Emily', 'Kirk']
  %> a.remove('Kirk')
  %> a
  [Tasha, Emily, Kirk]
  ```

  Notice that only the first occurrence of `Kirk` was removed.


^
{:#reverse} _list_.**reverse**()
: Returns a new list containing the items in the original list in reverse order.
  
  For example:

  ```blade-repl
  %> var a = ['apple', 'mango', 'banana', 'orange', 'peach']
  %> a.reverse()
  [peach, orange, banana, mango, apple]
  ```


^
{:#sort} _list_.**sort**()
: Sorts the items in the list in-place. Sorting in Lists follows are strict set of precedence based 
  on the object type. The order for sorting is as follows in ascending orders:<br>
  
  `nil`, boolean, numbers, strings, ranges, lists, dictionaries, file, bytes, functions, classes 
  and modules.

  When the corresponding items in the list are of the same type, they are sorted based on their
  respective values according to the type. For example, the number `5` is less than `8` and as such
  will appear first in the sort.

  For example:

  ```blade-repl
  %> var a  = ['A', 5, false, nil, [21, 13, 46]]
  %> a.sort()
  %> a
  [nil, false, 5, A, [13, 21, 46]]
  ```

  > Notice how the boolean value preceeds the number and how the number in turn preceeds the string
  > and the strings in turn, preceeds the list in the result. Also, note that the items of the inner 
  > list is sorted.



^
{:#contains} _list_.**contains**(_x_: any)
: Returns `true` if the list contains the item _x_ or `false` otherwise.

  For example:

  ```blade-repl
  %>  ['dog', 'cat', 'wolf', 'tiger'].contains('cat')
  true
  %>  ['dog', 'cat', 'wolf', 'tiger'].contains('giraffe')
  false
  ```


^
{:#delete} _list_.**delete**(_lower_: number, _upper_: number)
: Deletes a range of items from the list starting from the lower to the upper limit and returns 
  the number of items removed. If the lower and upper are the same, this will be equivalent to 
  `list.remove_at(lower)`.

  For example:

  ```blade-repl
  %> var a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  %> a.delete(3, 6)
  4
  %> a
  [1, 2, 3, 8, 9]
  %> a.delete(1,1)  # equal upper and lower
  1
  %> a
  [1, 3, 8, 9]
  ```


^
{:#first} _list_.**first**()
: Returns the first item in the list or `nil` if the list is empty.

  For example:

  ```blade-repl
  %> ['c', 'd', 'a', 'b'].first()
  'c'
  ```


^
{:#last} _list_.**last**()
: Returns the last item in the list or `nil` if the list is empty.

  For example:

  ```blade-repl
  %> ['c', 'd', 'a', 'b'].last()
  'b'
  ```


^
{:#is_empty} _list_.**is_empty**()
: Returns `true` if the list is empty or `false` otherwise.

  For example:

  ```blade-repl
  %> [1, 2].is_empty()
  false
  %> [].is_empty()
  true
  ```


^
{:#take} _list_.**take**(_n_: number)
: Returns a new list containing the first _n_ items in the list or a new copy of the list if _n_ 
  greater than or equals to the `list.length()`. If `n < 0`, returns `list.take(list.length() - n)`.

  For example:

  ```blade-repl
  %> var a = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  %> a.take(4)
  [10, 11, 12, 13]
  %> a.take(11) # taking more than the size of the list
  [10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  %> a.take(-5)   # taking n < 0
  [10, 11, 12, 13, 14, 15]
  ```


^
{:#get} _list_.**get**(_index_: number)
: Returns the value at the specified index in the list. If _index_ is outside the boundary of 
  the list indexes (`0..(list.length() - 1)`), an exception is thrown. This method is equivalent 
  to `list[index]`.

  For example:

  ```blade-repl
  %> [13, 14, 15, 16].get(1)
  14
  %> [13, 14, 15, 16].get(6)
  Unhandled Exception: list index 6 out of range at get()
    StackTrace:
      File: <repl>, Line: 1, In: <script>
  ```


^
{:#compact} _list_.**compact**()
: Returns a new list containing the items in the original list but with all `nil` values removed.

  For example:

  ```blade-repl
  %> [21, nil, 14, 'age', nil, nil, [], 11].compact()
  [21, 14, age, [], 11]
  ```


^
{:#unique} _list_.**unique**()
: Returns a new list containing the unique values from the original list.

  For example:

  ```blade-repl
  %> [1, 1, 3, 5].unique()
  [1, 3, 5]
  ```


^
{:#zip} _list_.**zip**(_items_... : list...)
: Returns a list that contains the items in the original list merged with corresponding items 
  from the individual arguments. This generates a list of length equal to the length of the 
  original argument.

  If the size of any of the arguments is less than the size of the original list, it's corresponding 
  entry will be `nil`.

  For example:

  ```blade-repl
  %> var a = [4, 5, 6]
  %> var b = [7, 8, 9]
  %> [1, 2, 3].zip(a, b)
  [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  %> [1, 2].zip(a, b)
  [[1, 4, 7], [2, 5, 8]]
  %> a.zip([1, 2], [8])
  [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
  %> [1, 2].zip([3])
  [[1, 3], [2, nil]]
  %> [1].zip([10, 11], [12, 13, 14])
  [[1, 10, 12]]
  %> [[1, 2], [3]].zip(a, b)
  [[[1, 2], 4, 7], [[3], 5, 8]]
  ```


^
{:#to_dict} _list_.**to_dict**()
: Returns a number indexed dictionary representing the list.

  For example:

  ```blade-repl
  %> ['English', 'French', 'Spanish'].to_dict()
  {0: English, 1: French, 2: Spanish}
  ```



<br><br>

[Previous Topic](./loops) | [Next Topic](./dictionaries){:class="float-right"}