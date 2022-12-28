---
layout: default
title: os
parent: Standard Library
nav_order: 21
permalink: /standard/os.html
---

# os

This module provides functions for interfacing with the underlying operating system and directories.



<h2>Properties</h2><hr>

{:#os__platform} _os._**platform**
: The name of the current platform in string or `unknown` if 
  the platform name could not be determined.
  
  Example,
  
  ```blade-repl
  %> import os
  %> os.platform
  'osx'
  ```


^
{:#os__args} _os._**args**
: A list containing the command line arguments passed to the startup script.


^
{:#os__path_separator} _os._**path_separator**
: The standard path separator for the current operating system.




<h2>Functions</h2><hr>

{:#os__exec} _os_.**exec**(_cmd_: string)
: Executes the given shell (or command prompt for Windows) commands and 
  returns the output as string.
  
   <div class="cite"><span class="hint">return</span> <span>string</span></div>

  
  Example,
  
  ```blade-repl
  %> os.exec('ls -l')
  'total 48
  -rw-r--r--@ 1 username  staff  705 Aug 27  2021 buggy.b
  -rw-r--r--  1 username  staff  197 Mar  5 05:13 myprogram.b'
  ```


^
{:#os__info} _os_.**info**()
: Returns information about the current operation system and machine as a dictionary.
  The returned dictionary will contain:
  
  - `sysname`: The name of the operating system
  - `nodename` The name of the current machine
  - `version`: The operating system version
  - `release`: The release level/version
  - `machine`: The hardware/processor type.
  
   <div class="cite"><span class="hint">return</span> <span>dict</span></div>

  
  Example,
  
  ```blade-repl
  %> os.info()
  {sysname: Darwin, nodename: MacBook-Pro.local, version: Darwin Kernel Version 
  21.1.0: Wed Oct 13 17:33:24 PDT 2021; root:xnu-8019.41.5~1/RELEASE_ARM64_T8101, 
  release: 21.1.0, machine: arm64}
  ```


^
{:#os__sleep} _os_.**sleep**(_duration_: number)
: Causes the current thread to sleep for the specified number of seconds.


^
{:#os__get_env} _os_.**get_env**(_name_: string)
: Returns the given environment variable if exists or nil otherwise
   <div class="cite"><span class="hint">return</span> <span>string</span></div>

  
  Example,
  
  ```blade-repl
  %> import os
  %> os.get_env('ENV1')
  '20'
  ```


^
{:#os__set_env} _os_.**set_env**(_name_: string, _value_: string, _overwrite_: bool = true)
: Sets the named environment variable to the given value.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>

  
  Example,
  
  ```blade-repl
  %> os.set_env('ENV1', 'New value')
  true
  %> os.get_env('ENV1')
  'New value'
  ```
  
  If you are in the REPL and have tried the last example in `get_env()`, 
  you may notice that the value of `ENV1` doesn't change. This is because 
  unless you specify, `set_env()` will not overwrite existing environment variables. 
  For that, you will need to specify `true` as the third parameter to `set_env()`.
  
  For example,
  
  ```blade-repl
  %> os.set_env('ENV1', 'New value again', true)
  true
  %> os.get_env('ENV1')
  'New value again'
  ```
  
  > - Environment variables set will not persist after application exists.


^
{:#os__create_dir} _os_.**create_dir**(_path_: string, [_permission_: number = 0c777 [, _recursive_: boolean = true]])
: Creates the given directory with the specified permission and optionaly 
  add new files into it if any is given.
  
  > - if the directory already exists, it returns `false` otherwise, it returns `true`.
  > - permission should be given as octal number.
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



^
{:#os__read_dir} _os_.**read_dir**(_path_: string)
: Scans the given directory and returns a list of all matched files
   <div class="cite"><span class="hint">return</span> <span>list[string]</span></div>

  
  Example,
  
  ```blade-repl
  %> os.read_dir('./tests')
  [., .., myprogram.b, single_thread.b, test.b, buggy.b]
  ```
  
  > - `.` indicates current directory and can be used as argument to _os.path_ as well.
  > - `..` indicates parent directory and can be used as argument to _os.path_ as well.


^
{:#os__chmod} _os_.**chmod**(_path_: string, _mod_: number)
: Changes the permission set on a directory
  
  > - mod should be octal number (e.g. 0c777)
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



^
{:#os__is_dir} _os_.**is_dir**(_path_: string)
: Returns `true` if the path is a directory or `false` otherwise.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#os__remove_dir} _os_.**remove_dir**(_path_: string [, _recursive_: boolean = false])
: Deletes a non-empty directory. If recursive is `true`, non-empty directories 
  will have their contents deleted first.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#os__cwd} _os_.**cwd**()
: Returns the current working directory
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#os__change_dir} _os_.**change_dir**(_path_: string)
: Navigates the working directory into the specified path.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#os__dir_exists} _os_.**exists**(_path_: string)
: Returns `true` if the directory exists or `false` otherwise.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#os__exit} _os_.**exit**(_code_: number)
: Exit the current process and quits the Blade runtime.
   <div class="cite"><span class="hint">return</span> <span></span></div>



^
{:#os__join_paths} _os_.**join_paths**(paths...)
: Concatenates the given paths together into a format that is valied on the 
  current operating system.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>

  
  Example,
  
  ```blade-repl
  %> os.join_paths('/home/user', 'path/to/myfile.ext')
  '/home/user/path/to/myfile.ext'
  ```


^
{:#os__real_path} _os_.**real_path**(_path_: string)
: returns the original path to a relative path.
  > - if the path is a file, see `abs_path()`
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#os__abs_path} _os_.**abs_path**(_path_: string)
: returns the original path to a relative path.
  > - unlike real_path(), this function returns full path for a file
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#os__dir_name} _os_.**dir_name**(_path_: string)
: Returns the parent directory of the pathname pointed to by `path`.  Any trailing
  `/` characters are not counted as part of the directory name.  If `path` is an
  empty string, or contains no `/` characters, dir_name() returns the string ".", 
  signifying the current directory.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#os__base_name} _os_.**base_name**(_path_: string)
: The base_name() function returns the last component from the pathname pointed to by 
  `path`, deleting any trailing `/` characters.  If path consists entirely of `/` 
  characters, the string '/' is returned.  If path is an empty string, the string '.' 
  is returned.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



