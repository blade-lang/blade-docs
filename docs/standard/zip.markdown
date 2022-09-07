---
layout: default
title: zip
parent: Standard Library
nav_order: 29
permalink: /standard/zip
---

# zip

The `zip` module contains classes and functions to make working with zip archives easy.



<h2>Properties</h2><hr>

{:#zip__ZIP_FILE_MAX} _zip._**ZIP_FILE_MAX**
: The maximum size of a single file in a zip archive when zip64 is not used
   <div class="cite"><span class="hint">type</span> <span>number</span></div>



^
{:#zip__ZIP_FILE_COUNT_LIMIT} _zip._**ZIP_FILE_COUNT_LIMIT**
: The maximum number of files in a zip archive when zip64 is not used
   <div class="cite"><span class="hint">type</span> <span>number</span></div>



^
{:#zip__ZIP_MAX} _zip._**ZIP_MAX**
: The maximum size of a zip archive when zip64 is not used
   <div class="cite"><span class="hint">type</span> <span>number</span></div>



^
{:#zip__ZIP_EXT} _zip._**ZIP_EXT**
: The default zip file extension
   <div class="cite"><span class="hint">type</span> <span>string</span></div>





<h2>Functions</h2><hr>

{:#zip__extract} _zip_.**extract**(_file_: string [, _destination_: string = os.**cwd**()
: Extracts the zip archive at the _file_ path to the given _destination_ directory. 
  If _destination_ is not given, the file will be extracted into the current working 
  directory.
 
  This function returns `true` if the extraction was successful and `false` otherwise.
  
  > **NOTE:**
  > Set `is_zip64` to true if the size of the zip file exceeds ZIP_MAX
  
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



^
{:#zip__compress} _zip_.**compress**(_path_: string [, _destination_: string [, _use_zip64_: bool = false]])
: Compresses the given path (file or directory) into the destination zip archive.
   <div class="cite"><span class="hint">throws</span> <span>Exception if file could not be written of zip max size exceeded.</span></div>

  
  > When an exception is thrown becase max size exceeded, some files could 
  > have already been compressed. In this case, the zip archive will should still 
  > be usable but not all desired files will be contained in it.
  
  > **NOTE:**
  > Set `use_zip64` to true when compressing files exceeding ZIP_FILE_MAX or 
  > ZIP_FILE_COUNT_LIMIT
  
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>





<h2>Classes</h2><hr>



### _class_ ZipItem 
---

ZipItem represents a single file or directory in a zip archive.


#### class ZipItem properties
---

{:#ZipItem_ZipItem_name} _ZipItem._**name**
: Name of the file or directory
   <div class="cite"><span class="hint">type</span> <span>string</span></div>



{:#ZipItem_ZipItem_directory} _ZipItem._**directory**
: The directory in which the file or subdirectory belongs
   <div class="cite"><span class="hint">type</span> <span>string</span></div>



{:#ZipItem_ZipItem_compression_method} _ZipItem._**compression_method**
: The compression method for this file
   <div class="cite"><span class="hint">type</span> <span>string</span></div>



{:#ZipItem_ZipItem_crc} _ZipItem._**crc**
: The crc32 checksum for the file
   <div class="cite"><span class="hint">type</span> <span>string</span></div>



{:#ZipItem_ZipItem_last_modified} _ZipItem._**last_modified**
: The last modified date for the file
   <div class="cite"><span class="hint">type</span> <span>Date</span></div>



{:#ZipItem_ZipItem_compressed_size} _ZipItem._**compressed_size**
: The size of the file as compressed in the archive
  > - The value is not often dependable
   <div class="cite"><span class="hint">type</span> <span>number</span></div>



{:#ZipItem_ZipItem_uncompressed_size} _ZipItem._**uncompressed_size**
: The size of the file when extracted from the archive
   <div class="cite"><span class="hint">type</span> <span>number</span></div>



{:#ZipItem_ZipItem_is_encrypted} _ZipItem._**is_encrypted**
: If this file is encrypted or not.
   <div class="cite"><span class="hint">type</span> <span>bool</span></div>



{:#ZipItem_ZipItem_error} _ZipItem._**error**
: Error encountered when attempting to read/extract the file
   <div class="cite"><span class="hint">type</span> <span>string</span></div>



{:#ZipItem_ZipItem_data} _ZipItem._**data**
: The decompressed value of the zip item
   <div class="cite"><span class="hint">type</span> <span>bytes</span></div>



#### class ZipItem methods
---

{:#_ZipItem_from_dict} **from_dict**(_dict_: dictionary)
: Creates a new ZipItem from a dictionary.
  The dictionary should contain the following keys:
  - `name`: string
  - `dir`: string &mdash; optional
  - `compress_method`: number
  - `crc`: number
  - `filemtime`: number
  - `size_compressed`: number
  - `size_uncompressed`: number
  - `encrypted`: boolean
  - `error`: string &mdash; optional
  - `data`: bytes
  
   <div class="cite"><span class="hint">return</span> <span>ZipItem</span></div>



{:#_ZipItem_export} **export**([_base_dir_: string = os.**cwd**()
: Exports the ZipItem to file. If base_dir is given, the file will be 
  exported into the base_dir and all ZipItem directories will be created 
  inside of base_dir to reflect the ZipItem's original structure.
  
  This function returns `true` if the operation succeeds or `false` otherwise.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>




^


### _class_ ZipFile 
---

ZipFile represents an instance of zip file.


#### class ZipFile properties
---

{:#ZipFile_ZipFile_name} _ZipFile._**name**
: The name of the zip file
   <div class="cite"><span class="hint">type</span> <span>string</span></div>



{:#ZipFile_ZipFile_last_modified} _ZipFile._**last_modified**
: The last modified date for the zip file
   <div class="cite"><span class="hint">type</span> <span>Date</span></div>



{:#ZipFile_ZipFile_time_created} _ZipFile._**time_created**
: The time when the zip file was created
   <div class="cite"><span class="hint">type</span> <span>Date</span></div>



{:#ZipFile_ZipFile_size} _ZipFile._**size**
: The size of the zip file
   <div class="cite"><span class="hint">type</span> <span>number</span></div>



{:#ZipFile_ZipFile_handle} _ZipFile._**handle**
: The file handle for this zip file
   <div class="cite"><span class="hint">type</span> <span>file</span></div>



{:#ZipFile_ZipFile_files} _ZipFile._**files**
: A list of the ZipItems in the zip file
   <div class="cite"><span class="hint">type</span> <span>List<ZipItem></span></div>



#### class ZipFile methods
---

{:#_ZipFile_export} **export**([_base_dir_: string])
: Exports the all files in the ZipFile to files on the machine. If base_dir is given, 
  the files will be exported into the base_dir and all directories will be 
  created inside of base_dir as is to reflect the ZipFile's original structure.
  
  This function returns `true` if the operation succeeds or `false` otherwise.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>




^


### _class_ ZipArchive 
---

ZipArchive provides a class for zip archive creation, 
  manuipulation and extraction.


#### class ZipArchive methods
---

{:#_ZipArchive_ZipArchive} **ZipArchive**(_file_: string [, _use_zip_64_: bool = false])
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_ZipArchive_create_dir} **create_dir**(_name_: string)
: Adds a directory to the zip with the given name
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_ZipArchive_create_file} **create_file**(_path_: string, _data_: bytes | string)
: Adds a file to the path specified with the contents given data
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_ZipArchive_add_file} **add_file**(_path_: string [, _destination_: string])
: Adds an existing file to the archive. If destination is given, the 
  file will be written to the destination path in the archive.


{:#_ZipArchive_add_directory} **add_directory**(_directory_: string [, _file_blacklist_: list = [] [, _ext_blacklist_: list = []]])
: Adds the specified `directory` recursively to the archive and set's it path in the archive to `dir`.
  
  - If `file_blacklist` is not empty, this function will ignore every file with a matching path.
  - If `ext_blacklist` is not empty, this function will ignore every file with a matching


{:#_ZipArchive_read} **read**(_path_: string)
: Reads the zip file in the specified path and returns a list of
  ZipFile describing it's contents.
   <div class="cite"><span class="hint">return</span> <span>ZipFile</span></div>



{:#_ZipArchive_save} **save**(_filename_: string)
: Saves the current Zip archive to file.



