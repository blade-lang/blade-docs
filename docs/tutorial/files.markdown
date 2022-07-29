---
layout: default
title: Working with Files
parent: Tutorial
nav_order: 16
permalink: /tutorial/working-with-files
---

# Working with Files

Blade provides the built-in `File` class accessible via the `file()` function for working with files easily. In Blade, 
it's pretty easy to create, read and/or modify files.

```blade-repl
%> file('sample.txt')
<file at sample.txt in mode r>
```

The _`file`_ function accepts an optional second parameter specifying the mode in which the file should be opened. 
Below is a list of supported modes.

| Mode | Name          | Description |
|:----:| --------------|-------------|
| `r`  | Read          | Opens the file for reading it's content. The file must exist.  |
| `w`  | Write         | Opens the file for writing to it. Creates file it does not exist. |
| `a`  | Append        | Opens a file for writing to it starting from the end. This mode ignores any previous mode to `seek()`. Creates file if it does not exist.  |
| `r+` | Read/Update   | Opens a file for update. The file must exist. |
| `w+` | Write/Update  | Opens a file for update. If the file does not exits, it creates it. Unlike in C and Python, if the file exists, this method does not truncate the file. |
| `a+` | Append/Update | Opens a file for updating starting from the end. This mode ignores any previous mode to `seek()` for outputs, but it's input will respect any previous call to `seek()`. Creates file if it does not exist. |

Like in C, while not usually necessary, the modes can be mixed for clarity. For example, the mode `r+w` opens a file for 
reading and writing.

## Reading files
---

When the file function is called without the mode argument or with mode is set to `r`, the file is opened in the read-only 
mode. This is the most effective mode for reading files. 

For example:

```blade-repl
%> file('sample.txt').read()
'This is a sample file.
If you can read this file, then your code worked.'
```

When the length argument is not specifying in a call to the `read()` method, the entire file will be read and the file will 
be _automatically_ closed. Otherwise, the file will be read to the specified length, but a `close()` operation will not 
occur. A file object _MUST_ be manually closed after reading the entire file by calling the `close()` function.


## Writing to files
---

To write to a file, the file must be opened in a non read-only mode such as `w`, `a`, `r+`. An automatic `flush()` will be 
performed after writing to the file and if the entire data was successfully written, the `close()` method will be 
automatically called.

For example:

```blade-repl
%> file('test.txt', 'w').write('It works!')
true
%> file('test.txt').read()  # reading the file to confirm
'It works!'
```

## Working with binary files
---

To open a file object in the binary mode for reading and writing binary data such as images, the binary mark (`b`) must 
be appended to the mode.

For example:

```blade-repl
%> var data = bytes([
..   0x47, 0x49, 0x46, 0x38, 0x39, 0x61, 0x1, 0x0, 0x1, 0x0, 
..   0x80, 0x1, 0x0, 0xff, 0xff, 0xff, 0x0, 0x0, 0x0, 0x21, 
..   0xf9, 0x4, 0x1, 0xa, 0x0, 0x1, 0x0, 0x2c, 0x0, 0x0, 0x0, 
..   0x0, 0x1, 0x0, 0x1, 0x0, 0x0, 0x2, 0x2, 0x4c, 0x1, 0x0, 0x3b
.. ])
%> 
%> file('sample.gif', 'wb').write(data)
true
```

Now check your current directory and you should see the empty but valid gif image courtsey of [Probably Programming](http://probablyprogramming.com/2009/03/15/the-tiniest-gif-ever){:target="_blank"} there.

## File methods
---

The file object contains the following methods:

{:#file-exists} _file_.**exists**()
: Returns `true` if a file exists or `false` otherwise.

  For example:

  ```blade-repl
  %> file('sample.txt').exists()
  true
  ```

^
{:#file-close} _file_.**close**()
: Closes the stream to an opened file. You'll rarely ever need to call this method yourself in most use cases.

  For example:

  ```blade-repl
  %> var f = file('sample.txt')
  %> f.close()
  ```

^
{:#file-open} _file_.**open**()
: Opens the stream to a file for the operation originally specified on the file object during creation. You may need to 
  call this method after a call to read() if the length isn't specified or write() if you wish to read or write again as 
  the file will already be closed.

  For example:

  ```blade-repl
  %> f.open()
  ```

^
{:#file-read} _file_.**read**([_length_: number])
: Reads the content of an opened file up to the specified length and returns it as string or bytes if the file was opened 
  in the binary mode. If the length is not specified, the file will be read to the end.<br>
  
  This method requires that the file be opened in the read mode (default mode) or a mode that supports reading. If you 
  aren't reading the full length of the file, you'll need to call the `close()` method to free the file for further reading, 
  otherwise, the `close()` method will be automatically called for you.

  _An example has been given above._

^
{:#file-gets} _file_.**gets**([_length_: number])
: Same as `read()`, but doesn't open or close the file automatically.

^
{:#file-write} _file_.**write**(_data_: string | bytes)
: Writes a string or bytes to an opened file at the current insertion point. When the file is opened with the `a` mode 
  enabled, write will always start from the end of the file. If the `seek()` method has been previously called, write 
  will begin from the seeked position, otherwise it will start at the beginning of the file.

  _An example has been given above._

^
{:#file-puts} _file_.**puts**(_data_: string | bytes)
: Same as `write()`, but doesn't open or close the file automatically.

^
{:#file-number} _file_.**number**()
: Returns the integer file descriptor number that is used by the underlying implementation to request I/O operations from 
  the operating system. This can be very useful for low-level interfaces that uses or act as file descriptors.<br>

  For example:

  ```blade-repl
  %> file('sample.txt').number()
  6
  ```

^
{:#file-is_tty} _file_.**is_tty**()
: Returns `true` if the file is connected to a TTY like device or `false` otherwise.

  For example:

  ```blade-repl
  %> file('sample.txt').is_tty()
  false
  %> import io
  %> io.stdout.is_tty()   # io.stdin is a file...
  true
  ```

^
{:#file-is_open} _file_.**is_open**()
: Returns `true` if the file is open for reading or writing and `false` otherwise.

  > **_@note:_** `std` files are always open.

  For example:

  ```blade-repl
  %> file('sample.txt').is_open()
  true
  ```

^
{:#file-is_closed} _file_.**is_closed**()
: Returns `true` if the file is closed for reading or writing and `false` otherwise.

  For example:

  ```blade-repl
  %> file('sample.txt').is_closed()
  false
  ```

^
{:#file-flush} _file_.**flush**()
: Flushes the buffer held by a file. This could be useful for writable files as file 
  writes are buffered.<br>

  For example:

  ```blade-repl
  %> w.flush()
  ```

^
{:#file-stats} _file_.**stats**()
: Returns the statistics or details or a file.<br>

  For example:

  ```blade-repl
  %> file('sample.txt').stats()
  {is_readable: true, is_writable: true, is_executable: false, is_symbolic: false, size: 72, mode: 33188, dev: 16777230, ino: 4865113, nlink: 1, uid: 501, gid: 20, mtime: 1631395239, atime: 1631395271, ctime: 1631395239, blocks: 8, blksize: 4096}
  ```

^
{:#file-symlink} _file_.**symlink**(_path_: string)
: Creates a symbolic link for the original file at the specified path.<br>

  For example:

  ```blade-repl
  %> file('sample.txt').symlink('sample2.txt')
  true
  ```

^
{:#file-delete} _file_.**delete**()
: Deletes a file. 
  
  > **_@note:_** If the file is opened by one or more processes or threads outside of the current process or thread, 
  > the file will not be deleted until the last process frees it.<br>
  > **_@note:_** This method throws Exception on failure.

  For example:

  ```blade-repl
  %> file('test-2.b').delete()
  true
  ```

^
{:#file-rename} _file_.**rename**(_new_name_: string)
: Renames a file to to `new_name`. The new name can be a full path in another location in which case the file will 
  be moved.<br>

  > **_@note:_** The new name cannot be empty<br>
  > **_@note:_** This method throws Exception on failure.

  For example:

  ```blade-repl
  %> file('sample copy.txt').rename('sample-2.txt')
  true
  ```

^
{:#file-path} _file_.**path**()
: Returns the path to the file.<br>

  For example:

  ```blade-repl
  %> file('sample.txt').path()
  'sample.txt'
  ```

^
{:#file-abs_path} _file_.**abs_path**()
: Returns the absolute path to the file.<br>

  For example:

  ```blade-repl
  %> file('sample.txt').abs_path()
  'C:\Users\username\blade-docs\sample.txt'
  ```

^
{:#file-copy} _file_.**copy**(_path_: string)
: Copies a file from the path sepcified in the original file to the given path.<br>

  For example:

  ```blade-repl
  %> file('./sample.txt').copy('samp.txt')
  true
  ```

^
{:#file-truncate} _file_.**truncate**([_length_: number])
: Truncates the entire file if length is not given or truncates the file such that only length number of bytes is left 
  in it.<br>

  For example:

  ```blade-repl
  %> file('./samp.txt').truncate()
  true
  ```


^
{:#file-chmod} _file_.**chmod**(_mode_: number)
: Changes the permission on the file to the one specified in the number given.<br>

  > **_@note:_** The number is required to be an octal number. e.g. 0c755

  For example:

  ```blade-repl
  %> file('sample.txt').chmod(0c755)
  true
  ```


^
{:#file-set_times} _file_.**set_times**(_atime_: number, _mtime_: number)
: Sets the last access time and last modified time of the file.<br>

  > **_@note:_** Time is expected in UTC seconds<br>
  > **_@note:_** set argument -1 to leave the current value.

  For example:

  ```blade-repl
  %> file('sample.txt').set_times(time(), time())
  true
  %> file('sample.txt').stats()
  {is_readable: true, is_writable: true, is_executable: true, is_symbolic: false, size: 72, mode: 33261, dev: 16777230, ino: 4865113, nlink: 1, uid: 501, gid: 20, mtime: 1631477099, atime: 1631477100, ctime: 1631477099, blocks: 8, blksize: 4096}
  ```

^
{:#file-seek} _file_.**seek**(_position_: number, _seek_type_: number)
: Sets the position of a file reader or writer in a file. The position must be within the range of the file size. 
  _seek_type_ must be on of `SEEK_SET`, `SEEK_CUR` or `SEEK_END` from the `io` package.<br>

  For example:

  ```blade-repl
  %> f.seek(5, io.SEEK_SET)
  true
  ```

^
{:#file-tell} _file_.**tell**()
: Returns the current position of the reader/writer in a file.<br>

  For example:

  ```blade-repl
  %> import io
  %> var f = file('sample.txt')
  %> f.seek(5, io.SEEK_SET)
  true
  %> f.tell()
  5
  ```

^
{:#file-mode} _file_.**mode**()
: Returns the mode in which the current file was opened.<br>

  For example:

  ```blade-repl
  %> file('sample.txt').mode()
  'r'
  ```

^
{:#file-name} _file_.**name**()
: Returns the name of the current file.<br>

  For example:

  ```blade-repl
  %> file('./sample.txt').name()
  'sample.txt'
  ```





<br><br>

[Previous Topic](./class) | [Next Topic](./error-handling){:class="float-right"}