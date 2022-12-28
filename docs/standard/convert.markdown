---
layout: default
title: convert
parent: Standard Library
nav_order: 11
permalink: /standard/convert.html
---

# convert

This module provides extra data conversion features between non-standard 
object types as well as different number bases.



<h2>Functions</h2><hr>

{:#convert__hex_to_bytes} _convert_.**hex_to_bytes**(str)
: converts hexadecimal string of any length to bytes
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



^
{:#convert__decimal_to_hex} _convert_.**decimal_to_hex**(_n_: number)
: converts the given decimal based number to an hexadeccimal string
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#convert__hex_to_decimal} _convert_.**hex_to_decimal**(_str_: string)
: converts the given hexadecimal string to a decimal base 10 number
  > - string must either contain the plain hexadecimal string or be in the format 0x[hex string].
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#convert__unicode_to_hex} _convert_.**unicode_to_hex**(_chr_: char)
: converts a unicode character to it's equivalent hexadecimal string.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



