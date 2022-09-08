---
layout: default
title: json
parent: Standard Library
nav_order: 18
permalink: /standard/json
---

# json

Provides APIs for encoding and decoding JSON data.

JavaScript Object Notation (JSON) is a lightweight, text-based,
language-independent data interchange format.  It was derived from
the ECMAScript Programming Language Standard.  JSON defines a small
set of formatting rules for the portable representation of structured
data.

This implementation complies with [RFC 8259](https://datatracker.ietf.org/doc/html/rfc8259).

### JSON to Blade value mapping

| JSON | Blade |
|------|-------|
| Null | Nil |
| String | String |
| Number | Number |
| Boolean | Boolean |
| Array | List |
| Object | Dict |


### Blade to JSON object mapping

| Blade | JSON |
|-------|------|
| `nil` | Null |
| Integer | Number |
| Number | Number |
| Char | String |
| String | String |
| List | Array |
| Dict | Object |
| Instance of class implementing `to_json()` decorator | Any |


Example,

```blade-repl
%> import json
%> json.encode([1, 2, 3])
'[1,2,3]'
%> 
%> json.encode({name: 'Blade', version: '0.0.7'})
'{"name":"Blade","version":"0.0.7"}'
%> 
%> json.encode({name: 'Blade', version: '0.0.7'}, false)
'{
  "name": "Blade", 
  "version": "0.0.7"
}'
```



<h2>Functions</h2><hr>

{:#json__encode} _json_.**encode**(_value_: any [, _compact_: boolean = true [, _max_depth_: number = 1024]])
: JSON encodes the given value with a recursive depth up to `max_depth`.
  
  If _compact_ is `false`, the resulting json string will be 
  tightly packed. i.e. spaces will be trimmed from objects and arrays. Otherwise, 
  the JSON output will be pretty formatted.
  
   <div class="cite"><span class="hint">param</span> <span>max_depth is the maximum recursive depth for encoding, default = 1024.</span></div>

  > - pretty formatting use 2 spaces instead of tabs.
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
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>

  > - that depth starts from zero
  > - set max_depth to `0` to disable max depth


{:#_Encoder_encode} **encode**(_value_: any)
: main encode method



