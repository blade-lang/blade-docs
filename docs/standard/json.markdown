---
layout: default
title: json
parent: Standard Library
nav_order: 11
permalink: /standard/json
---

# json

Provides APIs for encoding and decoding json data



<h2>Functions</h2><hr>

{:#json__encode} _json_.**encode**(_value_: any [, _compact_: boolean = false [, _max_depth_: number = 1024]])
: JSON encodes the given value with a recursive depth up to `max_depth`.
  
   <div class="cite"><span class="hint">param</span> <span>compact indicates whether the resulting json string will be tightly packed. i.e. spaces will be trimmed from objects and arrays.</span></div>

   <div class="cite"><span class="hint">param</span> <span>max_depth is the maximum recursive depth for encoding, default = 1024.</span></div>

   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#json__decode} _json_.**decode**(_value_: string [, _allow_comments_: boolean = true])
: decodes the input JSON string into Blade objects
  
   <div class="cite"><span class="hint">param</span> <span>value is the string to decode</span></div>

   <div class="cite"><span class="hint">param</span> <span>allow_comments can be set to enable/disable C-style comments in json [default = true]</span></div>

   <div class="cite"><span class="hint">return</span> <span>object</span></div>



^
{:#json__parse} _json_.**parse**(_path_: string)
: parses a file containing json data.
   <div class="cite"><span class="hint">return</span> <span>object</span></div>





<h2>Classes</h2><hr>



### _class_ Encoder 
---

Blade to JSON encoding class


#### class Encoder methods
---

{:#_Encoder_Encoder} **Encoder**([_compact_: boolean = false, [_max_depth_: number = 1024]])
:  <div class="cite"><span class="hint">constructor</span> <span>@note that depth starts from zero</span></div>

   <div class="cite"><span class="hint">note</span> <span>set max_depth to `0` to disable max depth</span></div>



{:#_Encoder_encode} **encode**(_value_: any)
: main encode method



