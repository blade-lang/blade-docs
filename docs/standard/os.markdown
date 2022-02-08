---
layout: default
title: os
parent: Standard Library
nav_order: 14
permalink: /standard/os
---

# os

Provides functionalities for interfacing with the underlying operating system



<h2>Properties</h2><hr>

{:#os__platform} _os._**platform**
: stores the name of the current platform in string


^
{:#os__args} _os._**args**
: stores the command line arguments passed to the startup script


^
{:#os__path_separator} _os._**path_separator**
: the standard path separator for the current os




<h2>Functions</h2><hr>

{:#os__exec} _os_.**exec**(_cmd_: string)
: exec executes the given shell commands
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#os__info} _os_.**info**()
: returns information about the current os
   <div class="cite"><span class="hint">return</span> <span>dict</span></div>



^
{:#os__sleep} _os_.**sleep**(_duration_: number)
: causes the current thread to sleep for the specified number of seconds
   <div class="cite"><span class="hint">return</span> <span>nil</span></div>



^
{:#os__get_env} _os_.**get_env**(_name_: string)
: returns the given environment variable if exists or nil otherwise
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#os__set_env} _os_.**set_env**(_name_: string, _value_: string, _overwrite_: bool = true)
: sets the named environment variable to the given value.
 
  on Unix, if overwrite is false, it doesn't set a value if the variable
  exists before.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#os__create_dir} _os_.**create_dir**(_path_: string, [_permission_: number = 0c777 [, _recursive_: boolean = true]])
: creates the given directory with the specified permission and optionaly 
  add new files into it if any is given.
  
   <div class="cite"><span class="hint">note</span> <span>if the directory already exists, it returns `false` otherwise, it returns `true`.</span></div>

   <div class="cite"><span class="hint">note</span> <span>permission should be given as octal number.</span></div>

   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



^
{:#os__read_dir} _os_.**read_dir**(_path_: string)
: scans the given directory returns a list of all matched files
   <div class="cite"><span class="hint">return</span> <span>DirectoryEntry[]</span></div>



^
{:#os__chmod} _os_.**chmod**(_path_: string, _mod_: number)
: changes the permission set on a directory
   <div class="cite"><span class="hint">note</span> <span>mod should be octal number</span></div>

   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



^
{:#os__is_dir} _os_.**is_dir**(_path_: string)
: returns `true` if the path is a directory or `false` otherwise.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#os__remove_dir} _os_.**remove_dir**(_path_: string [, _recursive_: boolean = false])
: deletes a non-empty directory
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#os__cwd} _os_.**cwd**()
: returns the current working directory
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#os__change_dir} _os_.**change_dir**(_path_: string)
: navigates the working directory into the specified path
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#os__dir_exists} _os_.**exists**(_path_: string)
: returns `true` if the directory exists or `false` otherwise.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#os__exit} _os_.**exit**(_code_: number)
: exit the current process and quits the Blade runtime.
   <div class="cite"><span class="hint">return</span> <span></span></div>


^
{:#os__join_paths} _os_.**join_paths**(paths...)
: concatenates the given paths together into a format
  qualified on the current os


^
{:#os__real_path} _os_.**real_path**(_path_: string)
: returns the original path to a relative path


