---
layout: default
title: mime
parent: Standard Library
nav_order: 13
permalink: /standard/mime
---

# mime

Provides mimetype detection capabilities.



<h2>Functions</h2><hr>

{:#mime__detect_from_name} _mime_.**detect_from_name**(_name_: string)
: Detects the mimetype of a file based on the
  extension defined in it's path.
 
   <div class="cite"><span class="hint">note</span> <span>For popular files such as Jpeg and Pngs, calling this method directly is more efficient and provides a faster lookup</span></div>



^
{:#mime__detect_from_header} _mime_.**detect_from_header**(_file_: file)
: Detects the mimetype of a file based on it's file header.
 
  When multiple file formats share very similar or shadowing
  file headers (such as the relationship between Zip files and Docx files),
  this method will perform an extension before returning it's result.
 
   <div class="cite"><span class="hint">note</span> <span>For dealing with files without extension, or where the accuracy of the file extension cannot be trusted, this method provides a more efficient lookup.</span></div>

   <div class="cite"><span class="hint">note</span> <span>This method may produce slightly more rigorous results</span></div>

   <div class="cite"><span class="hint">note</span> <span>This method requires that the file must be opened in binary mode</span></div>



^
{:#mime__detect} _mime_.**detect**(_file_: file)
: Performs mimetype detection on a file.
  
  this method is capable of detecting file mimetypes even
  in the abscence of an extension.
 
  If the file is opened in binary mode, it first attempt the more
  accurate header check. If the header check returns a generic result 
  (i.e. application/octet-stream), it performs an extension lookup.
 
   <div class="cite"><span class="hint">note</span> <span>this method gives the best result, but slightly slower than a direct lookup of name or header.</span></div>

  
   <div class="cite"><span class="hint">example</span> <span><pre></span></div>

  var f = file('myfile', 'rb')
  
  # using 'rb' here for two reasons: 
  # 1. Our file has no extension, so extension based detection is impossible
  # 2. We want more accuracy by having Mime check file headers
  
  echo mime.detect(f)
  </pre>


