---
layout: default
title: io
parent: Standard Library
nav_order: 16
permalink: /standard/io
---

# io

This module provides interfaces for working with to I/O stream and TTYs 
as well as expose the operating system standard I/O for easy access.

Some I/O operations that should belong to this module have been merged as 
core features and offered as built-in functions for Blade. Specifically 
file I/O features that can be accessed via the built-in `file()` function. 

The standard I/O streams are also files and you can call almost all file 
methods on them. Whenever a file method is not supported, you'll get an error 
message telling you that such operation is not supported for standard streams.

### Example

The following example shows how to use the `io` module for accepting user name 
and printing the result.

```blade
import io

var name = io.readline('What is your name?')
echo name
```



<h2>Properties</h2><hr>

{:#io__SEEK_SET} _io._**SEEK_SET**
: Set I/O position from the beginning


^
{:#io__SEEK_CUR} _io._**SEEK_CUR**
: Set I/O position from the current position


^
{:#io__SEEK_END} _io._**SEEK_END**
: Set I/O position from the end


^
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
{:#io__getch} _io_.**getch**()
: reads character(s) from standard input without printing to standard output
 
  when length is given, gets `length` number of characters
  else, gets a single character
   <div class="cite"><span class="hint">returns</span> <span>char | string</span></div>



^
{:#io__readline} _io_.**readline**([_message_: string [, _secure_: bool = false [, obscure_text = '*']]])
: reads an entire line from standard input. If a _messagge_ is given, the 
  message will be printed before it begins to wait for a user input. If 
  _secure_ is `true`, the user's input will not be printing and _obscure_text_ 
  will be printed instead.
  
  > - newlines will not be added automatically for messages.
   <div class="cite"><span class="hint">returns</span> <span>string</span></div>





<h2>Classes</h2><hr>



### _class_ TTY 
---

class TTY is an interface to TTY terminals this class contains definitions 
  to control TTY terminals


#### class TTY properties
---

{:#TTY_TTY_TTY_IFLAG} _static_ _TTY._**TTY_IFLAG**
: TTY attribute for input flags
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_TTY_OFLAG} _static_ _TTY._**TTY_OFLAG**
: TTY attribute for output flags
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_TTY_CFLAG} _static_ _TTY._**TTY_CFLAG**
: TTY attribute for control flags
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_TTY_LFLAG} _static_ _TTY._**TTY_LFLAG**
: TTY attribute for local flags
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_TTY_ISPEED} _static_ _TTY._**TTY_ISPEED**
: TTY attribute for input speed
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_TTY_OSPEED} _static_ _TTY._**TTY_OSPEED**
: TTY attribute for output speed
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_IGNBRK} _static_ _TTY._**IGNBRK**
: ignore BREAK condition
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_BRKINT} _static_ _TTY._**BRKINT**
: map BREAK to SIGINTR 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_IGNPAR} _static_ _TTY._**IGNPAR**
: ignore (discard) parity errors
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_PARMRK} _static_ _TTY._**PARMRK**
: mark parity and framing errors 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_INPCK} _static_ _TTY._**INPCK**
: enable checking of parity errors
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_ISTRIP} _static_ _TTY._**ISTRIP**
: strip 8th bit off chars 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_INLCR} _static_ _TTY._**INLCR**
: map NL into CR
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_IGNCR} _static_ _TTY._**IGNCR**
: ignore CR 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_ICRNL} _static_ _TTY._**ICRNL**
: map CR to NL (ala CRMOD)
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_IXON} _static_ _TTY._**IXON**
: enable output flow control 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_IXOFF} _static_ _TTY._**IXOFF**
: enable input flow control
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_IXANY} _static_ _TTY._**IXANY**
: any char will restart after stop 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_IUTF8} _static_ _TTY._**IUTF8**
: maintain state for UTF-8 VERASE
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_OPOST} _static_ _TTY._**OPOST**
: enable following output processing
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_ONLCR} _static_ _TTY._**ONLCR**
: map NL to CR-NL (ala CRMOD)
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_CSIZE} _static_ _TTY._**CSIZE**
: character size mask 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_CS5} _static_ _TTY._**CS5**
: 5 bits (pseudo)
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_CS6} _static_ _TTY._**CS6**
: 6 bits 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_CS7} _static_ _TTY._**CS7**
: 7 bits 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_CS8} _static_ _TTY._**CS8**
: 8 bits
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_CSTOPB} _static_ _TTY._**CSTOPB**
: send 2 stop bits 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_CREAD} _static_ _TTY._**CREAD**
: enable receiver 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_PARENB} _static_ _TTY._**PARENB**
: parity enable 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_PARODD} _static_ _TTY._**PARODD**
: odd parity, else even 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_HUPCL} _static_ _TTY._**HUPCL**
: hang up on last close 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_CLOCAL} _static_ _TTY._**CLOCAL**
: ignore modem status lines 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_ECHOE} _static_ _TTY._**ECHOE**
: visually erase chars 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_ECHOK} _static_ _TTY._**ECHOK**
: echo NL after line kill 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_ECHO} _static_ _TTY._**ECHO**
: enable echoing 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_ECHONL} _static_ _TTY._**ECHONL**
: echo NL even if ECHO is off 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_ISIG} _static_ _TTY._**ISIG**
: enable signals INTR, QUIT, [D]SUSP 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_ICANON} _static_ _TTY._**ICANON**
: canonicalize input lines 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_IEXTEN} _static_ _TTY._**IEXTEN**
: enable DISCARD and LNEXT 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_TOSTOP} _static_ _TTY._**TOSTOP**
: stop background jobs from output 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_NOFLSH} _static_ _TTY._**NOFLSH**
: don't flush after interrupt 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_TCSANOW} _static_ _TTY._**TCSANOW**
: make change immediate 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_TCSADRAIN} _static_ _TTY._**TCSADRAIN**
: drain output, then change 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_TCSAFLUSH} _static_ _TTY._**TCSAFLUSH**
: drain output, flush input 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_VEOF} _static_ _TTY._**VEOF**
: ICANON
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_VEOL} _static_ _TTY._**VEOL**
: ICANON
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_VERASE} _static_ _TTY._**VERASE**
: ICANON
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_VKILL} _static_ _TTY._**VKILL**
: ICANON
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_VINTR} _static_ _TTY._**VINTR**
: ISIG
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_VQUIT} _static_ _TTY._**VQUIT**
: ISIG
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_VSUSP} _static_ _TTY._**VSUSP**
: ISIG
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_VSTART} _static_ _TTY._**VSTART**
: IXON, IXOFF 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_VSTOP} _static_ _TTY._**VSTOP**
: IXON, IXOFF 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_VMIN} _static_ _TTY._**VMIN**
: !ICANON 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#TTY_TTY_VTIME} _static_ _TTY._**VTIME**
: !ICANON
   <div class="cite"><span class="hint">static</span> <span></span></div>



#### class TTY methods
---

{:#_TTY_TTY} **TTY**(_std_: file)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>

  > - file must be one of stdout and stderr


{:#_TTY_get_attr} **get_attr**()
: Returns the attribute of the current tty session
  The returned a attributes is a dict containing the TTY_ flags


{:#_TTY_set_attr} **set_attr**(_option_: number, _attrs_: dict)
: sets the attributes of the current tty session
  
  - option: one ot the TCSA options above (see their description above)
  - attrs a dictionary of the TTY_ flags listed above
  - one can safely omit any of the TTY_ flags listed above and Blade will fill in the default values as it exists.
  > - this flags will be merged and not overwritten


{:#_TTY_set_raw} **set_raw**()
: sets the current tty to raw mode
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_TTY_exit_raw} **exit_raw**()
: disables the raw mode flags on the current tty
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_TTY_flush} **flush**()
: flushes the standard output and standard error interface



