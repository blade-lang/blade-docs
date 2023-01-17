---
layout: default
title: zlib
parent: Standard Library
nav_order: 31
permalink: /standard/zlib.html
---

# zlib

The 'zlib' compression library provides in-memory compression and
uncompression functions, including integrity checks of the uncompressed data.
This version of the library supports only one compression method (deflation)
but other algorithms will be added later and will have the same stream
interface.

  Compression can be done in a single step if the buffers are large enough,
or can be done by repeated calls of the compression function.  In the latter
case, the application must provide more input and/or consume the output
(providing more output space) before each call.

  The compressed data format used by default by the in-memory functions is
the zlib format, which is a zlib wrapper documented in RFC 1950, wrapped
around a compress stream, which is itself documented in RFC 1951.

  The library also supports reading and writing files in gzip (.gz) format
with an interface similar to that of stdio using the functions that start
with "gz".  The gzip format is different from the zlib format.  gzip is a
gzip wrapper, documented in RFC 1952, wrapped around a compress stream.

  This library can optionally read and write gzip and raw compress streams in
memory as well.

  The zlib format was designed to be compact and fast for use in memory
and on communications channels.  The gzip format was designed for single-
file compression on file systems, has a larger header than zlib to maintain
directory information, and uses a different, slower check method than zlib.

  The library does not install any signal handler.  The decoder checks
the consistency of the compressed data, so the library should never crash
even in the case of corrupted input.



<h2>Properties</h2><hr>

{:#zlib__version} _zlib._**version**
: zLib version string


^
{:#zlib__NO_COMPRESSION} _zlib._**NO_COMPRESSION**
: no compression level


^
{:#zlib__BEST_SPEED} _zlib._**BEST_SPEED**
: best speed compression


^
{:#zlib__BEST_COMPRESSION} _zlib._**BEST_COMPRESSION**
: best compression level


^
{:#zlib__DEFAULT_COMPRESSION} _zlib._**DEFAULT_COMPRESSION**
: default compression level


^
{:#zlib__FILTERED} _zlib._**FILTERED**
: filtered compression strategy


^
{:#zlib__HUFFMAN_ONLY} _zlib._**HUFFMAN_ONLY**
: huffman only compression strategy


^
{:#zlib__RLE} _zlib._**RLE**
: rle compression strategy


^
{:#zlib__FIXED} _zlib._**FIXED**
: fixed compression strategy


^
{:#zlib__DEFAULT_STRATEGY} _zlib._**DEFAULT_STRATEGY**
: default compression strategy


^
{:#zlib__DEFAULT_MEMORY_LEVEL} _zlib._**DEFAULT_MEMORY_LEVEL**
: default memory level


^
{:#zlib__MAX_WBITS} _zlib._**MAX_WBITS**
: maximum windows bit




<h2>Functions</h2><hr>

{:#zlib__adler32} _zlib_.**adler32**(_data_: bytes | string [, _initial_: number])
: Updates a running Adler-32 checksum with the bytes buf[0..len-1] and
  return the updated checksum.
  
  > - An Adler-32 checksum is almost as reliable as a CRC-32 but can be computed much faster.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#zlib__crc32} _zlib_.**crc32**(_data_: bytes | string [, _initial_: number])
: Update a running CRC-32 cheksum with the bytes buf[0..len-1] and return the
  updated CRC-32 checksum.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#zlib__compress} _zlib_.**compress**(_data_: bytes | string [, _level_: int = Z_DEFAULT_COMPRESSION [, _strategy_: int = Z_DEFAULT_STRATEGY [, _wbits_: int = MAX_WBITS [, _memory_level_: int = Z_DEFAULT_MEMORY_LEVEL]]]])
: compress compresses as much data as possible, and stops when the input
  buffer becomes empty or the output buffer becomes full.
  
  -  The compression `level` must be DEFAULT_COMPRESSION, or between 0 and 9:
     1 gives best speed, 9 gives best compression, 0 gives no compression at all
     (the input data is simply copied a block at a time).  DEFAULT_COMPRESSION
     requests a default compromise between speed and compression (currently
     equivalent to level 6)
  
  -  The `wbits` parameter is the base two logarithm of the window size
     (the size of the history buffer).  It should be in the range 8..15 for this
     version of the library.  Larger values of this parameter result in better
     compression at the expense of memory usage.  The default value is 15.
  
     For the current implementation of compress(), a `wbits` value of 8 (a
     window size of 256 bytes) is not supported.  As a result, a request for 8
     will result in 9 (a 512-byte window).
  
     `wbits` can also be -8..-15 for raw compress.  In this case, `-wbits`
     determines the window size.  compress() will then generate raw compress data
     with no zlib header or trailer, and will not compute a check value.
  
     `wbits` can also be greater than 15 for optional gzip encoding.  Add
     16 to `wbits` to write a simple gzip header and trailer around the
     compressed data instead of a zlib wrapper.  The gzip header will have no
     file name, no extra data, no comment, no modification time (set to zero), no
     header crc, and the operating system will be set to the appropriate value,
     if the operating system can be determined by the runtime.
  
     For raw compress or gzip encoding, a request for a 256-byte window is
     rejected as invalid, since only the zlib header provides a means of
     transmitting the window size to the uncompressor.
  
  -  The `strategy` parameter is used to tune the compression algorithm.  Use the
     value DEFAULT_STRATEGY for normal data, FILTERED for data produced by a
     filter (or predictor), HUFFMAN_ONLY to force Huffman encoding only (no
     string match), or RLE to limit match distances to one (run-length
     encoding).  Filtered data consists mostly of small values with a somewhat
     random distribution.  In this case, the compression algorithm is tuned to
     compress them better.  The effect of FILTERED is to force more Huffman
     coding and less string matching; it is somewhat intermediate between
     DEFAULT_STRATEGY and HUFFMAN_ONLY.  RLE is designed to be almost as
     fast as HUFFMAN_ONLY, but give better compression for PNG image data.  The
     strategy parameter only affects the compression ratio but not the
     correctness of the compressed output even if it is not set appropriately.
     FIXED prevents the use of dynamic Huffman codes, allowing for a simpler
     decoder for special applications.
  
  -  The `memory_level` parameter specifies how much memory should be allocated
     for the internal compression state.  memory_level 1 uses minimum memory but is
     slow and reduces compression ratio; memory_level 9 uses maximum memory for
     optimal speed.  The default value is 8.
  
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



^
{:#zlib__uncompress} _zlib_.**uncompress**(_data_: bytes | string [, _wbits_: int = MAX_WBITS])
: uncompress decompresses as much data as possible, and stops when the input
  buffer becomes empty or the output buffer becomes full.
  
  -  In this implementation, uncompress() always flushes as much output as
     possible to the output buffer, and always uses the faster approach on the
     first call.
  
  -  The `wbits` parameter is the base two logarithm of the maximum window
     size (the size of the history buffer).  It should be in the range 8..15 for
     this version of the library.  The default value is 15.  `wbits` must be greater than or equal to the `wbits` value
     provided to compress() while compressing, or it must be equal to 15 if
     compress() is used with the default values.  If a compressed stream with a 
     larger window size is given as input, uncompress() will return with the error 
     code data error instead of trying to allocate a larger window.
  
     `wbits` can also be zero to request that uncompress use the window size in
     the zlib header of the compressed stream.
  
     `wbits` can also be -8..-15 for raw uncompress.  In this case, `-wbits`
     determines the window size.  uncompress() will then process raw compress data,
     not looking for a zlib or gzip header, not generating a check value, and not
     looking for any check values for comparison at the end of the stream.  This
     is for use with other formats that use the compress compressed data format
     such as zip.  Those formats provide their own check values.  If a custom
     format is developed using the raw compress format for compressed data, it is
     recommended that a check value such as an Adler-32 or a CRC-32 be applied to
     the uncompressed data as is done in the zlib, gzip, and zip formats.  For
     most applications, the zlib format should be used as is.  Note that comments
     on the use in compress() applies to the magnitude of `wbits`.
  
     `wbits` can also be greater than 15 for optional gzip decoding.  Add
     32 to `wbits` to enable zlib and gzip decoding with automatic header
     detection, or add 16 to decode only the gzip format (the zlib format will
     return a data error).  uncompress() will not automatically decode concatenated 
     gzip streams.
  
  -  uncompress() can uncompress either zlib-wrapped or gzip-wrapped compress data.
     If the compression uses gzip-wrapper, the correct `wbits` may need to be set.
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



^
{:#zlib__deflate} _zlib_.**deflate**(_data_: bytes | string)
: Compress data using the default options for Deflate
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



^
{:#zlib__undeflate} _zlib_.**undeflate**(_data_: bytes | string)
: uncompress a deflated data using default options
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



^
{:#zlib__gzip} _zlib_.**gzip**(_data_: bytes | string)
: Compress data using the default options for GZip
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



^
{:#zlib__ungzip} _zlib_.**ungzip**(_data_: bytes | string)
: uncompress a GZipped data using default options
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



^
{:#zlib__gzopen} _zlib_.**gzopen**(_path_: string [, _mode_: string = 'rb'])
: Opens a gzip (.gz) file for reading or writing.  The mode parameter is as
  in `file` ("rb" or "wb") but can also include a compression level ("wb9") or
  a strategy: 'f' for filtered data as in "wb6f", 'h' for Huffman-only
  compression as in "wb1h", 'R' for run-length encoding as in "wb1R", or 'F'
  for fixed code compression as in "wb9F".  (See the description of
  `compress()` for more information about the strategy parameter.)  'T' will
  request transparent writing or appending with no compression and not using
  the gzip format.
  
  "a" can be used instead of "w" to request that the gzip stream that will
  be written be appended to the file.  "+" will result in an error, since
  reading and writing to the same gzip file is not supported.  The addition of
  "x" when writing will create the file exclusively, which fails if the file
  already exists.  On systems that support it, the addition of "e" when
  reading or writing will set the flag to close the file on an execve() call.
  
  These functions, as well as gzip, will read and decode a sequence of gzip
  streams in a file.  The append function of gzopen() can be used to create
  such a file. When appending, gzopen does not test whether the file begins with 
  a gzip stream, nor does it look for the end of the gzip streams to begin 
  appending.  gzopen will simply append a gzip stream to the existing file.
  
  gzopen can be used to read a file which is not in gzip format; in this
  case read will directly read from the file without decompression.  When
  reading, this will be detected automatically by looking for the magic two-byte 
  gzip header.
  
  gzopen throws an error if the file could not be opened, if there was insufficient 
  memory to allocate the gzFile state, or if an invalid mode was specified (an 'r', 
  'w', or 'a' was not provided, or '+' was provided).
  
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>





<h2>Classes</h2><hr>



### _class_ GZ 
---

class GZ


#### class GZ methods
---

{:#_GZ_GZ} **GZ**(_path_: string [, _mode_: string = 'rb'])
:  <div class="cite"><span class="hint">see</span> <span>`gzopen()`</span></div>

   <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_GZ_read} **read**(_length_: number)
: Reads the given number of uncompressed bytes from the compressed file.  If
  the input file is not in gzip format, `read()` copies the given number of
  bytes into the buffer directly from the file.
  
  After reaching the end of a gzip stream in the input, _read_ will continue
  to read, looking for another gzip stream.  Any number of gzip streams may be
  concatenated in the input file, and will all be decompressed by `read()`.
  If something other than a gzip stream is encountered after a gzip stream,
  that remaining trailing garbage is ignored (and no error is returned).
  
  read can be used to read a gzip file that is being concurrently written.
  Upon reaching the end of the input, read will return with the available
  data. Note that read does not return -1 in the event of an incomplete gzip stream.  
  This error is deferred until `close()`, which will return false if the last read 
  ended in the middle of a gzip stream.  Alternatively, gzerror can be used before 
  close to detect this case.
  
  read returns the number of uncompressed bytes actually read, less than
  length for end of file, or -1 for error.  If len is too large to fit in an integer,
  then nothing is read, -1 is returned.
  
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



{:#_GZ_write} **write**(_data_: bytes | string)
: Writes the given number of uncompressed bytes into the compressed file.
  write returns the number of uncompressed bytes written or 0 in case of
  error.
  
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_GZ_eof} **eof**()
: Returns `true` if the end-of-file indicator has been set while reading,
  `false` otherwise.  Note that the end-of-file indicator is set only if the
  read tried to go past the end of the input, but came up short.  Therefore,
  `eof()` may return `false` even if there is no more data to read, in the event 
  that the last read request was for the exact number of bytes remaining in the 
  input file.  This will happen if the input file size is an exact multiple of 
  the buffer size.
 
  If eof() returns true, then the read functions will return no more data,
  unless the end-of-file indicator is reset by gzclearerr() and the input file
  has grown since the previous end of file was detected.
  
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_GZ_direct} **direct**()
: Returns `true` if file is being copied directly while reading, or `false`
  if file is a gzip stream being decompressed.
  
  If the input file is empty, direct() will return true, since the input
  does not contain a gzip stream.
  
  If direct() is used immediately after gzopen() it will cause buffers to be 
  allocated to allow reading the file to determine if it is a gzip file.
  
  When writing, direct() returns true if transparent writing was requested 
  ("wT" for the gzopen() mode), or false otherwise.
  
  > Note: direct() is not needed when writing.  Transparent writing must be 
  explicitly requested, so the application already knows the answer.
  
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_GZ_close} **close**()
: Flushes all pending output if necessary, closes the compressed file and
  deallocates the (de)compression state.  Note that once file is closed, you
  cannot call gzerror with file, since its structures have been deallocated.
  close must not be called more than once on the same file, just as free
  must not be called more than once on the same allocation.
  
  close will return `true` on success or `false` otherwise.
  
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_GZ_set_params} **set_params**(_level_: number, _strategy_: number)
: Dynamically update the compression level or strategy.  See the description
  of `compress()` for the meaning of these parameters.  Previously provided
  data is flushed before the parameter change.
  
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_GZ_seek} **seek**(_offset_: int [, _whence_: int = SEEK_SET])
: Sets the starting position for the next read or write on the given
  compressed file.  The offset represents a number of bytes in the
  uncompressed data stream. The whence parameter is defined as in `io` 
  module; the value SEEK_END is not supported.
  
  If the file is opened for reading, this function is emulated but can be
  extremely slow.  If the file is opened for writing, only forward seeks are
  supported; `seek()` then compresses a sequence of zeroes up to the new
  starting position.
  
  seek returns the resulting offset location as measured in bytes from
  the beginning of the uncompressed stream, or -1 in case of error, in
  particular if the file is opened for writing and the new starting position
  would be before the current position.
  
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_GZ_rewind} **rewind**()
: Rewinds the given file. This function is supported only for reading.
  
  > - `rewind()` is equivalent to `seek(0, SEEK_SET)`.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_GZ_tell} **tell**()
: Returns the starting position for the next read or write on the given
  compressed file.  This position represents a number of bytes in the
  uncompressed data stream, and is zero when starting.
  
  > - `tell()` is equivalent to `seek(0, SEEK_CUR)`.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_GZ_offset} **offset**()
: Returns the current offset in the file being read or written.  This offset
  includes the count of bytes that precede the gzip stream, for example when
  appending.  When reading, the offset does not include as yet unused buffered 
  input.  This information can be used for a progress indicator.  On error, 
  offset() returns -1.
  
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_GZ_clear_error} **clear_error**()
: Clears the error and end-of-file flags for file. This is useful for continuing 
  to read a gzip file that is being written concurrently.



