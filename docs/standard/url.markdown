---
layout: default
title: url
parent: Standard Library
nav_order: 29
permalink: /standard/url
---

# url

This module provides classes and functions for parsing and processing URLs.
This module supports username and passwords in URLs in order to support an 
arbitrary number of RFC combinations but this does not strictly conform to 
RFC1738.

The scope of URL in this module have not been limited to HTTP or any protocol 
for that matter. However, where deducable, the module tries to conform to the 
most appropriate URL for the specified scheme.

Constructing a URL is vey simple. Here is an example.

### Example,

```blade-repl
%> import url
%> var link = url.Url('https', 'example.com', 9000)
%> link.absolute_url()
'https://example.com:9000'
```

What each function and class method does are easy to deduce from their names.

For example, we can use the `parse()` function to convert a URL string into a URL 
instance like below.

```blade-repl
%> link = url.parse('https://example.com:9000')
%> link.scheme
'https'
%> link.port
'9000'
```



<h2>Functions</h2><hr>

{:#url__encode} _url_.**encode**(_url_: string, _strict_: boolean)
: URL-encodes string
  
  this function is convenient when encoding a string to be used in 
  a query part of a URL, as a convenient way to pass variables to 
  the next page.
 
  if strict mode is enabled, space character is encoded with the 
  percent (%) sign in order to conform with RFC 3986. Otherwise,
  is is encoded with the plus (+) sign in order to align with
  the default encoding used by modern browsers.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>

   <div class="cite"><span class="hint">defualt</span> <span>strict: false</span></div>

  > - strict mode is disabled by default


^
{:#url__decode} _url_.**decode**(_url_: string)
: Decodes URL-encoded string
  
  decodes any %## encoding in the given string. 
  plus symbols ('+') are decoded to a space character.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



^
{:#url__parse} _url_.**parse**(_url_: string)
: parses given url string into a Url object
   <div class="cite"><span class="hint">return</span> <span>Url</span></div>





<h2>Classes</h2><hr>



### _class_ UrlMalformedException  < _Exception_
---

Excpetion thrown when a url is malformed


#### class UrlMalformedException methods
---

{:#_UrlMalformedException_UrlMalformedException} **UrlMalformedException**(_message_: string)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ Url 
---

The Url class provides functionalities for parsing and processing URLs
  @serializable
  @printable


#### class Url properties
---

{:#Url_Url_scheme} _Url._**scheme**
: The url scheme e.g. http, https, ftp, tcp etc.


{:#Url_Url_host} _Url._**host**
: The host information contained in the url


{:#Url_Url_port} _Url._**port**
: The port information contained in the url whenever the url doesn't 
  indicate, we try to make a best guess based on the scheme.


{:#Url_Url_path} _Url._**path**
: The path of the URL.
   <div class="cite"><span class="hint">default</span> <span>/</span></div>



{:#Url_Url_hash} _Url._**hash**
: Hash information contained in the url and it's beginning is indicated by the 
  hash (#) sign. This value is especially relevant to some http/https urls 
  and are usually references to the content of the document 
  at the given url


{:#Url_Url_query} _Url._**query**
: Query/Search information contained in the url and it's beginning is indicated by the 
  question (?) sign. This value is especially relevant to some http/https urls and are 
  usually used to convey data to endpoint based on the GET method.


{:#Url_Url_username} _Url._**username**
: Username information for authentication are sometimes embeded in urls. When such information 
  exist, this property holds the information


{:#Url_Url_password} _Url._**password**
: Password information for authentication are sometimes embeded in urls. When such information 
  exist, this property holds the information


#### class Url methods
---

{:#_Url_Url} **Url**(_scheme_: string, _host_: string [, _port_: string [, _path_: string [, _query_: string [, _hash_: string [, _username_: string [, _password_: string]]]]]])
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_Url_authority} **authority**()
: returns the url authority
  
  The authority component is preceded by a double slash ("//") and is
  terminated by the next slash ("/"), question mark ("?"), or number
  sign ("#") character, or by the end of the URI.
 
  > - mailto scheme does not have an authority. For this reason, mailto schemes return an empty string as authority.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_Url_host_is_ipv4} **host_is_ipv4**()
: returns true if the host of the url is a valid ipv4 address
  and false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Url_host_is_ipv6} **host_is_ipv6**()
: returns true if the host of the url is a valid ipv6 address
  and false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Url_absolute_url} **absolute_url**()
: returns absolute url string of the url object
   <div class="cite"><span class="hint">return</span> <span>string</span></div>




