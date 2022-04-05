---
layout: default
title: hash
parent: Standard Library
nav_order: 11
permalink: /standard/hash
---

# hash

This module provides a framework for cryptographic and non-cryptographic encryption.

Examples,

```blade-repl
%> import hash
%> 
%> hash.md5('Hello, World')
'82bb413746aee42f89dea2b59614f9ef'
%> 
%> hash.sha256('Hello, World')
'03675ac53ff9cd1535ccc7dfcdfa2c458c5218371f418dc136f2d19ac1fbe8a5'
%> 
%> hash.siphash('mykey', 'Hello, World')
'd8e830a590c92b4c'
%> 
%> hash.hmac_sha256('mykey', 'Hello, World')
'61035d3d2119ffdfd710913bf4161d5fba1c2d9431f7de7ef398d359eb1d2481'
%> 
%> hash.hmac_sha256(bytes([10, 11, 12]), 'My secure text!')
'd782079145a3476fd4e018d44dd024034fa91f626f7f30f2009200c5ac757723'
```



<h2>Functions</h2><hr>

{:#hash__hash} _hash_.**hash**(_value_: any)
: returns the hash of a value as used in a dictionary underlying
  implementation.
 
  a class may override the result of this function by implementing the
  `hash` decorator
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#hash__adler32} _hash_.**adler32**(_str_: string | bytes, [_value_: number])
: returns the adler32 value of the given string or bytes
 
  if value is given, it is used as the base value of the adler32
  computation. Else, 1 is used.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#hash__crc32} _hash_.**crc32**(_str_: string | bytes, [_value_: number])
: returns the crc32 value of the given string or bytes
 
  if value is given, it is used as the base value of the crc32
  computation. Else, 0 is used.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#hash__md2} _hash_.**md2**(_str_: string | bytes)
: returns the md2 hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__md4} _hash_.**md4**(_str_: string | bytes)
: returns the md4 hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__md5} _hash_.**md5**(_str_: string | bytes)
: returns the md5 hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__md5_file} _hash_.**md5_file**(_str_: file)
: returns the md5 hash of the given file
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__sha1} _hash_.**sha1**(_str_: string | bytes)
: returns the sha1 hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__sha224} _hash_.**sha224**(_str_: string | bytes)
: returns the sha224 hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__sha256} _hash_.**sha256**(_str_: string | bytes)
: returns the sha256 hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__sha384} _hash_.**sha384**(_str_: string | bytes)
: returns the sha384 hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__sha512} _hash_.**sha512**(_str_: string | bytes)
: returns the sha512 hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__fnv1} _hash_.**fnv1**(_str_: string | bytes)
: returns the 32 bit fnv1 hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__fnv1_64} _hash_.**fnv1_64**(_str_: string | bytes)
: returns the 64 bit fnv1 hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__fnv1a} _hash_.**fnv1a**(_str_: string | bytes)
: returns the 32 bit fnv1a hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__fnv1a_64} _hash_.**fnv1a_64**(_str_: string | bytes)
: returns the 64 bit fnv1a hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__whirlpool} _hash_.**whirlpool**(_str_: string | bytes)
: returns the whirlpool hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__snefru} _hash_.**snefru**(_str_: string | bytes)
: returns the snefru cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__siphash} _hash_.**siphash**(_key_: string | bytes, _str_: string | bytes)
: returns the siphash cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__gost} _hash_.**gost**(_str_: string | bytes)
: returns the gost cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__hmac} _hash_.**hmac**(_method_: function, _key_: string | bytes, _str_: string | bytes)
: computes an HMAC with the key and str using the given method
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__hmac_md2} _hash_.**hmac_md2**(_key_: string | bytes, _str_: string | bytes)
: returns the HMAC-MD2 cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__hmac_md4} _hash_.**hmac_md4**(_key_: string | bytes, _str_: string | bytes)
: returns the HMAC-MD4 cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__hmac_md5} _hash_.**hmac_md5**(_key_: string | bytes, _str_: string | bytes)
: returns the HMAC-MD5 cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__hmac_sha1} _hash_.**hmac_sha1**(_key_: string | bytes, _str_: string | bytes)
: returns the HMAC-SHA1 cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__hmac_sha224} _hash_.**hmac_sha224**(_key_: string | bytes, _str_: string | bytes)
: returns the HMAC-SHA224 cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__hmac_sha256} _hash_.**hmac_sha256**(_key_: string | bytes, _str_: string | bytes)
: returns the HMAC-SHA256 cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__hmac_sha384} _hash_.**hmac_sha384**(_key_: string | bytes, _str_: string | bytes)
: returns the HMAC-SHA384 cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__hmac_sha512} _hash_.**hmac_sha512**(_key_: string | bytes, _str_: string | bytes)
: returns the HMAC-SHA512 cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__hmac_whirlpool} _hash_.**hmac_whirlpool**(_key_: string | bytes, _str_: string | bytes)
: returns the HMAC-WHIRLPOOL cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__hmac_snefru} _hash_.**hmac_snefru**(_key_: string | bytes, _str_: string | bytes)
: returns the HMAC-SNEFRU cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#hash__hmac_gost} _hash_.**hmac_gost**(_key_: string | bytes, _str_: string | bytes)
: returns the HMAC-GOST cyrptographic hash of the given string or bytes
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



