---
layout: default
title: process
parent: Standard Library
nav_order: 22
permalink: /standard/process
---

# process

This module allows parallel processing by providing classes and functions 
that allows for spawning operating system processes thereby leveraging multiple 
processors on a machine. 

Example Usage:

```blade
var shared = SharedValue()

var pr = Process(|p, s| {
  echo 'It works!'
  echo p.id()
  s.set({name: 'Richard', age: 3.142})
}, shared)

pr.on_complete(||{
  echo shared.get()
})

pr.start()
echo 'It works fine!'
# pr.await()  # this can be used to wait for completion.
echo 'It works fine again!'
```

Output:

```sh
It works fine!
It works fine again!
It works!
75608
{name: Richard, age: 3.142}
```



<h2>Properties</h2><hr>

{:#process__cpu_count} _process._**cpu_count**
: The number of CPU cores available on the current device.
   <div class="cite"><span class="hint">type</span> <span>number</span></div>





<h2>Functions</h2><hr>

{:#process__process} _process_.**process**(_fn_: function [, _shared_: SharedValue])
: Creates a new instance of Process for the function _`fn`_. This 
  constructor accepts an optional SharedValue.
  
  The function passed to a process must accept at least one parameter which 
  will be passed the instance of the process itself and at most two parameters 
  if the process was intitalized with a SharedValue.




<h2>Classes</h2><hr>



### _class_ SharedValue 
---

The SharedValue object allows the sharing of single value/state between 
  processes and the main application or one another. 
  
  SharedValue supports the following types:
  
  - Boolean
  - Number
  - String
  - List
  - Dictionary
  
  @note Lists and Dictionaries cannot be nested in a SharedValue.


#### class SharedValue methods
---

{:#_SharedValue_SharedValue} **SharedValue**()
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_SharedValue_lock} **lock**()
: Locks the SharedValue and disallows updating the value.


{:#_SharedValue_unlock} **unlock**()
: Unlocks the SharedValue to allow for updating the value.


{:#_SharedValue_is_locked} **is_locked**()
: Returns `true` if the SharedValue is locked for updating or `false` otherwise.
  
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>

  > - a SharedValue is locked if in an invalid state.


{:#_SharedValue_set} **set**(_value_: boolean | number | string | list | dictionary)
: Sets the value of the SharedValue to the given value. It returns the number of 
  bytes written or `false` if the SharedValue is in an invalid state.
  
   <div class="cite"><span class="hint">return</span> <span>number | boolean</span></div>



{:#_SharedValue_locked_set} **locked_set**(_value_: boolean | number | string | list | dictionary)
: Locks the SharedValue for writing then sets the value to the given value and unlocks it. 
  It returns the number of bytes written or `false` if the SharedValue is in an invalid state.
  
   <div class="cite"><span class="hint">return</span> <span>number | boolean</span></div>



{:#_SharedValue_get} **get**()
: Returns the value stored in the SharedValue or `nil` if no value has been set.
  
   <div class="cite"><span class="hint">return</span> <span>any</span></div>




^


### _class_ Process 
---

This class allows creating and spawning operating system processes 
  and using them to run functions.


#### class Process methods
---

{:#_Process_Process} **Process**(_fn_: function [, _shared_: SharedValue])
: Creates a new instance of Process for the function _`fn`_. This 
  constructor accepts an optional SharedValue.
  
  The function passed to a process must accept at least one parameter which 
  will be passed the instance of the process itself and at most two parameters 
  if the process was intitalized with a SharedValue.
   <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_Process_id} **id**()
: Returns the ID of the process or `-1` if the process is in an invalid 
  state or has not been started.
  
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Process_on_complete} **on_complete**(_fn_: function)
: Adds a new listener to be called when the process finishes execution.


{:#_Process_start} **start**()
: Starts/runs the process. This function returns `true` or `false` if the 
  process is in an invalid state.
  
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



{:#_Process_await} **await**()
: Awaits for the process to finish running and returns it's exit code or `-1` 
  if the process is in an invalid state.
  
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Process_is_alive} **is_alive**()
: Returns `true` if the process is running or `false` if not.
  
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



{:#_Process_kill} **kill**()
: Kills the running process. Returns `true` if the process was successfully 
  killed or `false` otherwise.
  
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>




