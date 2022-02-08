---
layout: default
title: io
parent: Standard Library
nav_order: 10
permalink: /standard/io
---

# io

Provides Blade's interface to I/O stream handling and operations



<h2>Properties</h2><hr>

{:#io__stdin} _io._**stdin**
: stdin is a file handle to the standard input file of the system


^
{:#io__stdout} _io._**stdout**
: stdout is a file handle to the standard output file of the system


^
{:#io__stderr} _io._**stderr**
: stderr is a file handle to the standard error file of the system




<h2>Functions</h2><hr>

{:#io__flush} _io_.**flush**(_file_: file)
: flushes the content of the given file handle
   <div class="cite"><span class="hint">returns</span> <span>nil</span></div>



^
{:#io__putc} _io_.**putc**(_c_: char)
: writes character c to the screen
   <div class="cite"><span class="hint">return</span> <span>nil</span></div>



^
{:#io__getc} _io_.**getc**()
: reads character(s) from standard input
 
  when length is given, gets `length` number of characters
  else, gets a single character
   <div class="cite"><span class="hint">returns</span> <span>char | string</span></div>



^
{:#io__readline} _io_.**readline**()
: reads an entire line from standard input
   <div class="cite"><span class="hint">returns</span> <span>string</span></div>





<h2>Classes</h2><hr>



### _class_ TTY 
---

class TTY is an interface to TTY terminals this class contains definitions 
  to control TTY terminals


#### class TTY methods
---

{:#_TTY_TTY} **TTY**(_std_: file)
:  <div class="cite"><span class="hint">constructor</span> <span>@note file must be one of stdout and stderr</span></div>



{:#_TTY_get_attr} **get_attr**()
: Returns the attribute of the current tty session
  The returned a attributes is a dict containing the TTY_ flags


{:#_TTY_set_attr} **set_attr**(_option_: number, _attrs_: dict)
: sets the attributes of the current tty session
  - option: one ot the TCSA options above (see their description above)
  - attrs a dictionary of the TTY_ flags listed above
  
  one can safely omit any of the TTY_ flags listed above and
  Blade will fill in the default values as it exists.
  -  <div class="cite"><span class="hint">note</span> <span>this flags will be merged and not overwritten</span></div>



{:#_TTY_set_raw} **set_raw**()
: sets the current tty to raw mode


{:#_TTY_exit_raw} **exit_raw**()
: disables the raw mode flags on the current tty


{:#_TTY_flush} **flush**()
: flushes the standard output and standard error interface
   <div class="cite"><span class="hint">return</span> <span>nil</span></div>




