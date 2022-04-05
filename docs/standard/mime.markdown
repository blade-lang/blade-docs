---
layout: default
title: mime
parent: Standard Library
nav_order: 18
permalink: /standard/mime
---

# mime

This module provides functions that allow easy mime type detection from files. 
It offers support for detecting file type based on name or file headers and it 
is completely extensible so that you can add declarations for your own custom 
file types.

_See defined functions for example._



<h2>Functions</h2><hr>

{:#mime__detect_from_name} _mime_.**detect_from_name**(_name_: string)
: Detects the mimetype of a file based on the
  extension defined in it's path.
 
   <div class="cite"><span class="hint">return</span> <span>string</span></div>

  > - For popular files such as Jpeg and Pngs, calling this method directly is more efficient and provides a faster lookup.
  
  Example,
  
  ```blade
  import mime
  echo mime.detect_from_name('myimage.png')
  ```


^
{:#mime__detect_from_header} _mime_.**detect_from_header**(_file_: file)
: Detects the mimetype of a file based on it's file header.
 
  When multiple file formats share very similar or shadowing
  file headers (such as the relationship between Zip files and Docx files),
  this method will perform an extension before returning it's result.
 
   <div class="cite"><span class="hint">return</span> <span>string</span></div>

  > - For dealing with files without extension, or where the accuracy of the file extension cannot be trusted, this method provides a more efficient lookup.
  > - This method may produce slightly more rigorous results
  > - This method requires that the file must be opened in binary mode
  
  Example,
  
  ```blade
  import mime
  var f = file('my_file.ext', 'rb')
  echo mime.detect_from_header(f)
  ```


^
{:#mime__detect} _mime_.**detect**(_file_: file)
: Performs mimetype detection on a file.
  
  this method is capable of detecting file mimetypes even
  in the abscence of an extension.
 
  If the file is opened in binary mode, it first attempt the more
  accurate header check. If the header check returns a generic result 
  (i.e. application/octet-stream), it performs an extension lookup.
 
   <div class="cite"><span class="hint">return</span> <span>string</span></div>

  > - this method gives the best result, but slightly slower than a direct lookup of name or header.
  
  Example,
  
  ```blade
  import mime
  var f = file('myfile', 'rb')
  
  # using 'rb' here for two reasons: 
  # 1. Our file has no extension, so extension based detection is impossible
  # 2. We want more accuracy by having Mime check file headers
  
  echo mime.detect(f)
  ```


^
{:#mime__extend} _mime_.**extend**(_extension_: string, _format_: MimeFormat)
: Extends the mime module with support for files with the given _extension_ as 
  defined in the given _format_.
  
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>

  > - the extension MUST start with `.`
  
  Example,
  
  ```blade-repl
  %> import mime
  %> mime.detect_from_name('myfile.ppk')
  'application/octet-stream'
  %> mime.extend('.ppk', mime.MimeFormat('file/ppk'))
  true
  %> mime.detect_from_name('myfile.ppk')
  'file/ppk'
  ```




<h2>Classes</h2><hr>



### _class_ MimeFormat 
---

Mime format representation class.


#### class MimeFormat methods
---

{:#_MimeFormat_MimeFormat} **MimeFormat**(_mimetype_: string [, _header_: list | bytes])
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>

  > - only the first 16 bytes of a file header will be used.



