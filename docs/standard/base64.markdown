---
layout: default
title: base64
parent: Standard Library
nav_order: 7
permalink: /standard/base64.html
---

# base64

This module provides interface for encoding binary data into strings and 
decoding such encoded strings back into binary data based on the base64 
encoding specified in [RFC4648](https://datatracker.ietf.org/doc/html/rfc4648)



<h2>Functions</h2><hr>

{:#base64__encode} _base64_.**encode**(_data_: bytes)
: Encodes a byte array into a base64 string
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#base64__decode} _base64_.**decode**(_data_: string)
: Decodes a base64 string into it's corresponding bytes
   <div class="cite"><span class="hint">return</span> <span>bytes</span></div>



