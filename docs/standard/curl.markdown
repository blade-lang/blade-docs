---
layout: default
title: curl
parent: Standard Library
nav_order: 12
permalink: /standard/curl
---

# curl





<h2>Properties</h2><hr>

{:#curl__version} _curl._**version**
: The libcurl version.




<h2>Functions</h2><hr>

{:#curl__get_time} _curl_.**time**(_date_string_: string)
: Returns the number of seconds since the Epoch, January 1st 1970 00:00:00 in 
  the UTC time zone, for the date and time that the date_string parameter specifies.
  
  **PARSING DATES AND TIMES**
  
  A "date" is a string containing several items separated by whitespace.
  The order of the items is immaterial.  A date string may contain many
  flavors of items:
  
  - **Calendar date**
     Can be specified several ways. Month names can only be three-letter english 
     abbreviations, numbers can be zero-prefixed and the year may use 2 or 4 digits.  
     
     Examples: 06 Nov 1994, 06-Nov-94 and Nov-94 6.
  
  - **Time of the day**
     This string specifies the time on a given day. You must specify it with 6 digits 
     with two colons: HH:MM:SS. To not include the time in a date string, will make the 
     function assume 00:00:00.
  
     Example: 18:19:21.
  
  - **Time zone**
     Specifies international time zone. There are a few acronyms supported, but in 
     general you should instead use the specific relative time compared to UTC. 
     Supported formats include: -1200, MST, +0100.
  
  - **Day of the week items**
     Specifies a day of the week. Days of the week may be spelled out in full (using 
     english): Sunday, Monday, etc or they may be abbreviated to their first three 
     letters. This is usually not info that adds anything.
  
  - **Pure numbers**
     If a decimal number of the form YYYYMMDD appears, then YYYY is read as the year, 
     MM as the month number and DD as the day of the month, for the specified calendar 
     date.
  
  **EXAMPLES**
  
  ```sh
  Sun, 06 Nov 1994 08:49:37 GMT
  Sunday, 06-Nov-94 08:49:37 GMT
  Sun Nov  6 08:49:37 1994
  06 Nov 1994 08:49:37 GMT
  06-Nov-94 08:49:37 GMT
  Nov  6 08:49:37 1994
  06 Nov 1994 08:49:37
  06-Nov-94 08:49:37
  1994 Nov 6 08:49:37
  GMT 08:49:37 06-Nov-94 Sunday
  94 6 Nov 08:49:37
  1994 Nov 6
  06-Nov-94
  Sun Nov 6 94
  1994.Nov.6
  Sun/Nov/6/94/GMT
  Sun, 06 Nov 1994 08:49:37 CET
  06 Nov 1994 08:49:37 EST
  Sun, 12 Sep 2004 15:05:58 -0700
  Sat, 11 Sep 2004 21:32:11 +0200
  20040912 15:05:58 -0700
  20040911 +0200
  ```
  
  **STANDARDS**
  
  This parser was written to handle date formats specified in RFC 822 (including the 
  update in RFC 1123) using time zone name or time zone delta and RFC 850 (obsoleted 
  by RFC 1036) and ANSI C's asctime() format. These formats are the only ones RFC 7231 
  says HTTP applications may use.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>

   <div class="cite"><span class="hint">static</span> <span></span></div>





<h2>Classes</h2><hr>



### _class_ Info 
---

cURL request and response informations for `get_info()`


#### class Info properties
---

{:#Info_Info_EFFECTIVE_URL} _Info._**EFFECTIVE_URL**
: Gets the last used effective URL. If follow redirects is enabled, 
  it may very well not be the same value you set in the original request.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_RESPONSE_CODE} _Info._**RESPONSE_CODE**
: The last received HTTP, FTP or SMTP response code. The value will be 
  zero if no server response code has been received.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - A proxy's CONNECT response should be read with HTTP_CONNECTCODE and not this.


{:#Info_Info_TOTAL_TIME} _Info._**TOTAL_TIME**
: The total time in seconds for the previous transfer, including name resolving, 
  TCP connect etc. The value represents the time in seconds, including fractions.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_NAMELOOKUP_TIME} _Info._**NAMELOOKUP_TIME**
: The total time in seconds from the start until the name resolving was completed.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_CONNECT_TIME} _Info._**CONNECT_TIME**
: The total time in seconds from the start until the connection to the remote host 
  (or proxy) was completed.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_PRETRANSFER_TIME} _Info._**PRETRANSFER_TIME**
: The time, in seconds, it took from the start until a file transfer is just about 
  to begin.
  
  This time-stamp includes all pre-transfer commands and negotiations that are 
  specific to the particular protocol(s) involved. It includes the sending of the 
  protocol- specific protocol instructions that triggers a transfer.
  
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_SIZE_UPLOAD} _Info._**SIZE_UPLOAD**
: The total amount of bytes that were  uploaded.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - `SIZE_UPLOAD_T` might return a more sensible data.


{:#Info_Info_SIZE_UPLOAD_T} _Info._**SIZE_UPLOAD_T**
: The total amount of bytes that were uploaded.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_SIZE_DOWNLOAD} _Info._**SIZE_DOWNLOAD**
: The total amount of bytes that were  downloaded.  The amount is only for the 
  latest transfer and will be reset again for each new transfer. This counts actual 
  payload data, what's also commonly called body. All meta and header data are 
  excluded and will not be counted in this number.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - `SIZE_DOWNLOAD_T` might return a more sensible data.


{:#Info_Info_SIZE_DOWNLOAD_T} _Info._**SIZE_DOWNLOAD_T**
: The total amount of bytes that were  downloaded.  The amount is only for the 
  latest transfer and will be reset again for each new transfer. This counts actual 
  payload data, what's also commonly called body. All meta and header data are 
  excluded and will not be counted in this number.


{:#Info_Info_SPEED_DOWNLOAD} _Info._**SPEED_DOWNLOAD**
: The average download speed that curl measured for the complete download. Measured 
  in bytes/second.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - `SPEED_DOWNLOAD_T` might return a more sensible data.


{:#Info_Info_SPEED_DOWNLOAD_T} _Info._**SPEED_DOWNLOAD_T**
: The average download speed that curl measured for the complete download. Measured 
  in bytes/second.


{:#Info_Info_SPEED_UPLOAD} _Info._**SPEED_UPLOAD**
: The average upload speed that curl measured for the complete upload. Measured 
  in bytes/second.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - `CURLINFO_SPEED_UPLOAD_T` might return a more sensible data.


{:#Info_Info_SPEED_UPLOAD_T} _Info._**SPEED_UPLOAD_T**
: The average upload speed that curl measured for the complete upload. Measured 
  in bytes/second.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_HEADER_SIZE} _Info._**HEADER_SIZE**
: The total size of all the headers received. Measured in number of bytes.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_REQUEST_SIZE} _Info._**REQUEST_SIZE**
: The total size of the issued requests. This is so far only for HTTP requests. 
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - This may be  more than one request if `Options.FOLLOWLOCATION` is enabled.


{:#Info_Info_SSL_VERIFYRESULT} _Info._**SSL_VERIFYRESULT**
: The result of the server SSL certificate verification that was requested (using 
  the `Options.SSL_VERIFYPEER` option).
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - `0` is a positive result. Non-zero is an error.


{:#Info_Info_FILETIME} _Info._**FILETIME**
: The remote time of the retrieved document (in number of seconds since 1 jan 1970 
  in the GMT/UTC time zone). If you get -1, it can be because of many reasons (it might 
  be unknown, the server might hide it or the server doesn't support the command that 
  tells document time etc) and the time of the document is unknown.
  
  You _MUST_ to collect this information before the transfer is made, by using the 
  `Options.FILETIME` option to `set_option()` or you will unconditionally get a -1 back.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  
  > Consider using `FILETIME_T` to be able to extract dates beyond the year 2038 on 
  > systems using 32 bit longs.


{:#Info_Info_FILETIME_T} _Info._**FILETIME_T**
: The remote time of the retrieved document (in number of seconds since 1 jan 1970 
  in the GMT/UTC time zone). If you get -1, it can be because of many reasons (it might 
  be unknown, the server might hide it or the server doesn't support the command that 
  tells document time etc) and the time of the document is unknown.
  
  You _MUST_ to collect this information before the transfer is made, by using the 
  `Options.FILETIME` option to `set_option()` or you will unconditionally get a -1 back.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  
  > This option is an alternative to `FILETIME` to allow systems with 32 bit long 
  > variables to extract dates outside of the 32bit timestamp range.


{:#Info_Info_CONTENT_LENGTH_DOWNLOAD} _Info._**CONTENT_LENGTH_DOWNLOAD**
: The content-length of the download. This is the value read from the `Content-Length:` 
  field. It is -1 if the size isn't known.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - `CONTENT_LENGTH_DOWNLOAD_T` might return a more sensible data.


{:#Info_Info_CONTENT_LENGTH_DOWNLOAD_T} _Info._**CONTENT_LENGTH_DOWNLOAD_T**
: The content-length of the download. This is the value read from the `Content-Length:` 
  field. It is -1 if the size isn't known.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_CONTENT_LENGTH_UPLOAD} _Info._**CONTENT_LENGTH_UPLOAD**
: The content-length of the upload. It is -1 if the size isn't known.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - `CONTENT_LENGTH_UPLOAD_T` might return a more sensible data.


{:#Info_Info_CONTENT_LENGTH_UPLOAD_T} _Info._**CONTENT_LENGTH_UPLOAD_T**
: The content-length of the upload. It is -1 if the size isn't known.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_STARTTRANSFER_TIME} _Info._**STARTTRANSFER_TIME**
: The time, in seconds, it took from the start until the first byte is received by 
  `curl`. This includes `PRETRANSFER_TIME` and also the time the server needs to 
  calculate the result.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_CONTENT_TYPE} _Info._**CONTENT_TYPE**
: The content-type of the downloaded object. This is the value read from the 
  `Content-Type:` field. If you get `nil`, it means that the server didn't send a 
  valid Content-Type header or that the protocol used doesn't support this.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_REDIRECT_TIME} _Info._**REDIRECT_TIME**
: The total time, in seconds, it took for all redirection steps include name lookup, 
  connect, pretransfer and transfer before final transaction was started. 
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - It contains the complete execution time for multiple redirections.


{:#Info_Info_REDIRECT_COUNT} _Info._**REDIRECT_COUNT**
: The total number of redirections that were actually followed.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_HTTP_CONNECTCODE} _Info._**HTTP_CONNECTCODE**
: The last received HTTP proxy response code to a CONNECT request. The returned value 
  will be zero if no such response code was available.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_HTTPAUTH_AVAIL} _Info._**HTTPAUTH_AVAIL**
: A bitmask indicating the authentication method(s) available according to the 
  previous response.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_PROXYAUTH_AVAIL} _Info._**PROXYAUTH_AVAIL**
: A bitmask indicating the authentication method(s) available according to the 
  previous response.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_OS_ERRNO} _Info._**OS_ERRNO**
: The errno variable from a connect failure.  Note that the value is only set on 
  failure, it is not reset upon a successful operation. The number is OS and system 
  specific.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_NUM_CONNECTS} _Info._**NUM_CONNECTS**
: How many new connections `curl` had to create to achieve the previous transfer 
  (only the successful connects are counted). Combined with `REDIRECT_COUNT` you are 
  able to know how many times `curl` successfully reused existing connection(s) or not.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_COOKIELIST} _Info._**COOKIELIST**
: A list of all cookies curl knows (expired ones, too). If there are no cookies, an 
  empty list is returned.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  
  > Cookies that were imported in the Set-Cookie format without a domain name may not 
  > exported by this option.


{:#Info_Info_FTP_ENTRY_PATH} _Info._**FTP_ENTRY_PATH**
: A string holding the path of the entry path. That is the initial path `curl` ended up 
  in when logging on to the remote FTP server. This value is `nil` if something is wrong.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_REDIRECT_URL} _Info._**REDIRECT_URL**
: The URL a redirect would take you to if you would enable `FOLLOWLOCATION`. This can 
  come very handy if you think using the built-in `curl` redirect logic isn't good
  enough for you but you would still prefer to avoid implementing all the magic of 
  figuring out the new URL.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_PRIMARY_IP} _Info._**PRIMARY_IP**
: A string holding the IP address of the most recent connection done with this `curl` 
  handle. 
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - This string may be IPv6 when that is enabled.


{:#Info_Info_APPCONNECT_TIME} _Info._**APPCONNECT_TIME**
: The time, in seconds, it took from the start until the SSL/SSH connect/handshake to 
  the remote host was completed.  This time is most often very near to the 
  `PRETRANSFER_TIME` time, except for cases such as HTTP pipelining where the pretransfer
  time can be delayed due to waits in line for the pipeline and more.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_CERTINFO} _Info._**CERTINFO**
: Lists with info about the certificate chain, assuming you had `Options.CERTINFO` 
  enabled when the request was made. Information in each entry of the list is provided 
  in a series of data in the format "name:content" where the content is for the specific 
  named data.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_CONDITION_UNMET} _Info._**CONDITION_UNMET**
: The number `1` if the condition provided in the previous request didn't match 
  (see `Options.TIMECONDITION`). Alas, if this returns a `1` you know that the 
  reason you didn't get data in return is because it didn't fulfill the condition. 
  This value will be zero if the condition was met. This can also return `1` if the 
  server responded with a 304 HTTP status code, for example after sending a custom 
  "If-Match-*" header.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_RTSP_SESSION_ID} _Info._**RTSP_SESSION_ID**
: A string holding the most recent RTSP Session ID.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  
  > Applications wishing to resume an RTSP session on another connection should 
  > retrieve this info before closing the active connection.


{:#Info_Info_RTSP_CLIENT_CSEQ} _Info._**RTSP_CLIENT_CSEQ**
: The next CSeq that will be used by the application.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_RTSP_SERVER_CSEQ} _Info._**RTSP_SERVER_CSEQ**
: The next CSeq that is expected by the application.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  
  > Applications wishing to resume an RTSP session on another connection should retrieve 
  > this info before closing the active connection.


{:#Info_Info_RTSP_CSEQ_RECV} _Info._**RTSP_CSEQ_RECV**
: The most recently received CSeq from the server.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_PRIMARY_PORT} _Info._**PRIMARY_PORT**
: The destination port of the most recent connection done with the `curl` instance.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_LOCAL_IP} _Info._**LOCAL_IP**
: A string holding the IP address of the local end of most recent connection done 
  with the `curl` instance. 
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - This string may be IPv6 when that is enabled.


{:#Info_Info_LOCAL_PORT} _Info._**LOCAL_PORT**
: The local port number of the most recent connection done with the `curl` instance.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_HTTP_VERSION} _Info._**HTTP_VERSION**
: The HTTP version used in the last http connection.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_PROXY_SSL_VERIFYRESULT} _Info._**PROXY_SSL_VERIFYRESULT**
: The result of the certificate verification that was requested (using the 
  `Options.PROXY_SSL_VERIFYPEER` option. 
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - This is only used for HTTPS proxies.


{:#Info_Info_PROTOCOL} _Info._**PROTOCOL**
: The protocol used in the last request.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_SCHEME} _Info._**SCHEME**
: A string holding the URL scheme used for the most recent connection done with 
  this `curl` instance.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Info_Info_TOTAL_TIME_T} _Info._**TOTAL_TIME_T**
: The total time in microseconds for the previous transfer, including name resolving, 
  TCP connect etc.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_NAMELOOKUP_TIME_T} _Info._**NAMELOOKUP_TIME_T**
: The total time in microseconds from the start until the name resolving was completed.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_CONNECT_TIME_T} _Info._**CONNECT_TIME_T**
: The total time in microseconds from the start until the connection to the remote 
  host (or proxy) was completed.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_PRETRANSFER_TIME_T} _Info._**PRETRANSFER_TIME_T**
: The total time in microseconds from the start until the file transfer is just about 
  to begin. This includes all pre-transfer commands and negotiations that are specific 
  to the particular protocol(s) involved. It does not involve the sending of the 
  protocol- specific request that triggers a transfer.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_STARTTRANSFER_TIME_T} _Info._**STARTTRANSFER_TIME_T**
: The total time in microseconds from the start until the first byte is received by 
  `curl`. This includes `PRETRANSFER_TIME_T` and also the time the server needs to 
  calculate the result.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_REDIRECT_TIME_T} _Info._**REDIRECT_TIME_T**
: The total time in microseconds it took for all redirection steps include name lookup,
  connect, pretransfer and transfer before final transaction was started. It contains 
  the complete execution time for  multiple redirections.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_APPCONNECT_TIME_T} _Info._**APPCONNECT_TIME_T**
: The total time in microseconds from the start until the SSL/SSH connect/handshake 
  to the remote host was completed.  This time is most often very near to the 
  `PRETRANSFER_TIME_T` time, except for cases such as HTTP pipelining where the 
  pretransfer time can be delayed due to waits in line for the pipeline and more.
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - When a redirect is followed, the time from each request is added together.


{:#Info_Info_RETRY_AFTER} _Info._**RETRY_AFTER**
: The number of seconds the HTTP server suggests the client should wait until the 
  next request is issued. 
   <div class="cite"><span class="hint">static</span> <span></span></div>

  > - The information from the "Retry-After:" header.
  
  > While the HTTP header might contain a fixed date string, the `RETRY_AFTER` will 
  > always return number of seconds to wait - or zero if there was no header or the 
  > header couldn't be parsed.



^


### _class_ CurlMime 
---

cURL Mime object for multipart-data forms and POST requests.


#### class CurlMime methods
---

{:#_CurlMime_add} **add**(_name_: string, _value_: any)
: Adds a new mime part with the given name and value.


{:#_CurlMime_add_file} **add_file**(_name_: string, _file_: string)
: Adds a new mime part with the given name and file.


{:#_CurlMime_get_pointer} **get_pointer**()
: Returns the raw pointer object to the underlying libcurl mime implementation.



^


### _class_ CurlList 
---

cURL list interface.


#### class CurlList methods
---

{:#_CurlList_CurlList} **CurlList**(_items_: list)
:  <div class="cite"><span class="hint">constrctor</span> <span></span></div>



{:#_CurlList_close} **close**()
: Close and disposes the pointer to the list


{:#_CurlList_get_pointer} **get_pointer**()
: Returns the raw pointer object to the underlying libcurl list implementation.



^


### _class_ Curl 
---

cURL class


#### class Curl methods
---

{:#_Curl_Curl} **Curl**()
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_Curl_set_option} **set_option**(_option_: Option, _value_: any)
: This function is used to tell `curl` how to behave. By setting the
  appropriate options, the application can change `curl`'s behavior.  
  All options are set with an option followed by a parameter. That parameter
  can be a number, boolean, string, or an object pointer, depending on what 
  the specific option expects. Read this `cURL` manual carefully as bad input 
  values may cause `curl` to behave badly!  You can only set one option in each 
  function call. A typical application uses many `set_option()` calls in the 
  setup phase.
  
  Options set with this function call are valid for all forthcoming
  transfers performed using this instance.  The options are not in any way
  reset between transfers, so if you want subsequent transfers with
  different options, you must change them between the transfers. You can
  optionally reset all options back to internal default with `reset()`.
  
  > - Strings passed to `curl` as arguments, must not exceed 8MB in size.
  > - The order in which the options are set does not matter.
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



{:#_Curl_get_info} **get_info**(_info_: Info)
: Requests internal information from the `curl` session with this function.
  Use this function AFTER performing a transfer if you want to get transfer 
  related data.
   <div class="cite"><span class="hint">return</span> <span>string | number | list</span></div>



{:#_Curl_escape} **escape**(_str_: string)
: This function converts the given input string to a URL encoded string and
  returns that as a new allocated string. All input characters that are not
  a-z, A-Z, 0-9, '-', '.', '_' or '~' are converted to their "URL escaped"
  version (%NN where NN is a two-digit hexadecimal number).
  
   <div class="cite"><span class="hint">return</span> <span>string</span></div>

  > - This function does not accept a strings longer than 8 MB.


{:#_Curl_unescape} **unescape**(_str_: string)
: This function converts the given URL encoded input string to a "plain
  string" and returns that in an allocated memory area. All input characters 
  that are URL encoded (%XX where XX is a two-digit hexadecimal number) are 
  converted to their decoded versions.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_Curl_send} **send**()
: Performs the entire request in a blocking manner and returns when done, or 
  if it failed. It returns a dictionary containing the `headers` and `body` key.
   <div class="cite"><span class="hint">return</span> <span>dict</span></div>

  
  > You must never call this function simultaneously from two places using
  > the same instance. Let the function return first before invoking it
  > another time.


{:#_Curl_reset} **reset**()
: Re-initializes the instace to the default values. This puts back the
  instance to the same state as it was in when it was just created.
  
  > It keeps live connections, the Session ID cache, the DNS cache, the
  > cookies , the shares or the alt-svc cache.


{:#_Curl_close} **close**()
: Closes the current Curl instance.
  
  This might close all connections this instance has used and possibly has
  kept open until now - unless it was attached to a multi handle while
  doing the transfers. Don't call this function if you intend to transfer
  more files, re-using Curl instances is a key to good performance.
  
  > - Calling a function on the instance after this function has been called is illegal


{:#_Curl_get_pointer} **get_pointer**()
: Returns the raw pointer object to the underlying libcurl.



^


### _class_ Auth 
---

Auth values for `Options.HTTPAUTH` and `Options.PROXYAUTH`


#### class Auth properties
---

{:#Auth_Auth_NONE} _Auth._**NONE**
: No HTTP authentication
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_BASIC} _Auth._**BASIC**
: HTTP Basic authentication (default)
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_DIGEST} _Auth._**DIGEST**
: HTTP Digest authentication
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_NEGOTIATE} _Auth._**NEGOTIATE**
: HTTP Negotiate (SPNEGO) authentication
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_GSSNEGOTIATE} _Auth._**GSSNEGOTIATE**
: Alias for CURLAUTH_NEGOTIATE (deprecated)
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_NTLM} _Auth._**NTLM**
: HTTP NTLM authentication
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_DIGEST_IE} _Auth._**DIGEST_IE**
: HTTP Digest authentication with IE flavour
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_NTLM_WB} _Auth._**NTLM_WB**
: HTTP NTLM authentication delegated to winbind helper
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_BEARER} _Auth._**BEARER**
: HTTP Bearer token authentication
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_ONLY} _Auth._**ONLY**
: Use together with a single other type to force no authentication or 
  just that single type.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_ANY} _Auth._**ANY**
: All fine types set
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_ANYSAFE} _Auth._**ANYSAFE**
: All fine types except Basic
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_SSH_ANY} _Auth._**SSH_ANY**
: All types of SSH authentication supported by the server
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_SSH_NONE} _Auth._**SSH_NONE**
: No SSH allowed
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_SSH_PUBLICKEY} _Auth._**SSH_PUBLICKEY**
: Public/private key files for SSH authentication.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_SSH_PASSWORD} _Auth._**SSH_PASSWORD**
: Password for SSH authentication.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_SSH_HOST} _Auth._**SSH_HOST**
: Host key files for SSH authentication.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_SSH_KEYBOARD} _Auth._**SSH_KEYBOARD**
: Keyboard interactive SSH authentication.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_SSH_AGENT} _Auth._**SSH_AGENT**
: Agent (ssh-agent, pageant, etc.) for SSH authentication.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_SSH_GSSAPI} _Auth._**SSH_GSSAPI**
: gssapi (kerberos, etc.) for SSH authentication.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Auth_Auth_SSH_DEFAULT} _Auth._**SSH_DEFAULT**
: The default SSH authentication (same as ANY).
   <div class="cite"><span class="hint">static</span> <span></span></div>




^


### _class_ FileType 
---

cURL file types


#### class FileType properties
---

{:#FileType_FileType_FILE} _FileType._**FILE**
: File
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#FileType_FileType_DIRECTORY} _FileType._**DIRECTORY**
: Directory
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#FileType_FileType_SYMLINK} _FileType._**SYMLINK**
: Symbolic Link
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#FileType_FileType_DEVICE_CHAR} _FileType._**DEVICE_CHAR**
:  <div class="cite"><span class="hint">static</span> <span></span></div>



{:#FileType_FileType_NAMEDPIPE} _FileType._**NAMEDPIPE**
: Named Pipe
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#FileType_FileType_SOCKET} _FileType._**SOCKET**
: Socket
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#FileType_FileType_DOOR} _FileType._**DOOR**
: Door. This is only possible on Sun Solaris now
   <div class="cite"><span class="hint">static</span> <span></span></div>




^


### _class_ Option 
---

cURL request options for `set_option()`


#### class Option properties
---

{:#Option_Option_URL} _Option._**URL**
: The full URL to get/put 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PORT} _Option._**PORT**
: Port number to connect to, if other than default. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY} _Option._**PROXY**
: Name of proxy to use. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_USERPWD} _Option._**USERPWD**
: "user:password;options" to use when fetching. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXYUSERPWD} _Option._**PROXYUSERPWD**
: "user:password" to use with proxy. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_RANGE} _Option._**RANGE**
: Range to get, specified as an ASCII string. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_ERRORBUFFER} _Option._**ERRORBUFFER**
: Buffer to receive error messages in, must be at least CURL_ERROR_SIZE
  bytes big. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TIMEOUT} _Option._**TIMEOUT**
: Time-out the read operation after this amount of seconds 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_INFILESIZE} _Option._**INFILESIZE**
: If the CURLOPT_INFILE is used, this can be used to inform libcurl about
  how large the file being sent really is. That allows better error
  checking and better verifies that the upload was successful. -1 means
  unknown size.
 
  For large file support, there is also a _LARGE version of the key
  which takes an off_t type, allowing platforms with larger off_t
  sizes to handle larger files.  See below for INFILESIZE_LARGE.  
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_POSTFIELDS} _Option._**POSTFIELDS**
: POST static input fields. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_REFERER} _Option._**REFERER**
: Set the referrer page (needed by some CGIs) 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FTPPORT} _Option._**FTPPORT**
: Set the FTP PORT string (interface name, named or numerical IP address)
        Use i.e '-' to use default address.  <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_USERAGENT} _Option._**USERAGENT**
: Set the User-Agent string (examined by some CGIs) 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_LOW_SPEED_LIMIT} _Option._**LOW_SPEED_LIMIT**
: Set the "low speed limit" 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_LOW_SPEED_TIME} _Option._**LOW_SPEED_TIME**
: Set the "low speed time" 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_RESUME_FROM} _Option._**RESUME_FROM**
: Set the continuation offset.
 
  Note there is also a _LARGE version of this key which uses
  off_t types, allowing for large file offsets on platforms which
  use larger-than-32-bit off_t's.  Look below for RESUME_FROM_LARGE.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_COOKIE} _Option._**COOKIE**
: Set cookie in request: 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HTTPHEADER} _Option._**HTTPHEADER**
: This points to a linked list of headers, struct curl_slist kind. This
  list is also used for RTSP (in spite of its name) 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HTTPPOST} _Option._**HTTPPOST**
: This points to a linked list of post entries, struct curl_httppost 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSLCERT} _Option._**SSLCERT**
: name of the file keeping your private SSL-certificate 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_KEYPASSWD} _Option._**KEYPASSWD**
: password for the SSL or SSH private key 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_CRLF} _Option._**CRLF**
: send TYPE parameter? 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_QUOTE} _Option._**QUOTE**
: send linked-list of QUOTE commands 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_COOKIEFILE} _Option._**COOKIEFILE**
: point to a file to read the initial cookies from, also enables
  "cookie awareness" 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSLVERSION} _Option._**SSLVERSION**
: What version to specifically try to use.
  See CURL_SSLVERSION defines below. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TIMECONDITION} _Option._**TIMECONDITION**
: What kind of HTTP time condition to use, see defines 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TIMEVALUE} _Option._**TIMEVALUE**
: Time to use with the above condition. Specified in number of seconds
  since 1 Jan 1970 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_CUSTOMREQUEST} _Option._**CUSTOMREQUEST**
: Custom request, for customizing the get command like
  HTTP: DELETE, TRACE and others
  FTP: to use a different list command
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_STDERR} _Option._**STDERR**
: FILE handle to use instead of stderr 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_POSTQUOTE} _Option._**POSTQUOTE**
: send linked-list of post-transfer QUOTE commands 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_VERBOSE} _Option._**VERBOSE**
: talk a lot 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HEADER} _Option._**HEADER**
: throw the header out too 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_NOPROGRESS} _Option._**NOPROGRESS**
: shut off the progress meter 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_NOBODY} _Option._**NOBODY**
: use HEAD to get http document 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FAILONERROR} _Option._**FAILONERROR**
: no output on http error codes >= 400 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_UPLOAD} _Option._**UPLOAD**
: this is an upload 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_POST} _Option._**POST**
: HTTP POST method 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_DIRLISTONLY} _Option._**DIRLISTONLY**
: bare names when listing directories 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_APPEND} _Option._**APPEND**
: Append instead of overwrite on upload! 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_NETRC} _Option._**NETRC**
: Specify whether to read the user+password from the .netrc or the URL.
  This must be one of the CURL_NETRC_* enums below. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FOLLOWLOCATION} _Option._**FOLLOWLOCATION**
: use Location: Luke! 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TRANSFERTEXT} _Option._**TRANSFERTEXT**
: transfer data in text/ASCII format 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PUT} _Option._**PUT**
: HTTP PUT 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_AUTOREFERER} _Option._**AUTOREFERER**
: We want the referrer field set automatically when following locations 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXYPORT} _Option._**PROXYPORT**
: Port of the proxy, can be set in the proxy string as well with:
  "[host]:[port]" 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_POSTFIELDSIZE} _Option._**POSTFIELDSIZE**
: size of the POST input data, if strlen() is not good to use 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HTTPPROXYTUNNEL} _Option._**HTTPPROXYTUNNEL**
: tunnel non-http operations through a HTTP proxy 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_INTERFACE} _Option._**INTERFACE**
: Set the interface string to use as outgoing network interface 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_KRBLEVEL} _Option._**KRBLEVEL**
: Set the krb4/5 security level, this also enables krb4/5 awareness.  This
  is a string, 'clear', 'safe', 'confidential' or 'private'.  If the string
  is set but doesn't match one of these, 'private' will be used.  
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSL_VERIFYPEER} _Option._**SSL_VERIFYPEER**
: Set if we should verify the peer in ssl handshake, set 1 to verify. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_CAINFO} _Option._**CAINFO**
: The CApath or CAfile used to validate the peer certificate
  this option is used only if SSL_VERIFYPEER is true 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_MAXREDIRS} _Option._**MAXREDIRS**
: Maximum number of http redirects to follow 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FILETIME} _Option._**FILETIME**
: Pass a long set to 1 to get the date of the requested document (if
  possible)! Pass a zero to shut it off. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TELNETOPTIONS} _Option._**TELNETOPTIONS**
: This points to a linked list of telnet options 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_MAXCONNECTS} _Option._**MAXCONNECTS**
: Max amount of cached alive connections 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FRESH_CONNECT} _Option._**FRESH_CONNECT**
: Set to explicitly use a new connection for the upcoming transfer.
  Do not use this unless you're absolutely sure of this, as it makes the
  operation slower and is less friendly for the network. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FORBID_REUSE} _Option._**FORBID_REUSE**
: Set to explicitly forbid the upcoming transfer's connection to be re-used
  when done. Do not use this unless you're absolutely sure of this, as it
  makes the operation slower and is less friendly for the network. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_RANDOM_FILE} _Option._**RANDOM_FILE**
: Set to a file name that contains random data for libcurl to use to
  seed the random engine when doing SSL connects. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_EGDSOCKET} _Option._**EGDSOCKET**
: Set to the Entropy Gathering Daemon socket pathname 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_CONNECTTIMEOUT} _Option._**CONNECTTIMEOUT**
: Time-out connect operations after this amount of seconds, if connects are
  OK within this time, then fine... This only aborts the connect phase. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HTTPGET} _Option._**HTTPGET**
: Set this to force the HTTP request to get back to GET. Only really usable
  if POST, PUT or a custom request have been used first.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSL_VERIFYHOST} _Option._**SSL_VERIFYHOST**
: Set if we should verify the Common name from the peer certificate in ssl
  handshake, set 1 to check existence, 2 to ensure that it matches the
  provided hostname. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_COOKIEJAR} _Option._**COOKIEJAR**
: Specify which file name to write all known cookies in after completed
  operation. Set file name to "-" (dash) to make it go to stdout. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSL_CIPHER_LIST} _Option._**SSL_CIPHER_LIST**
: Specify which SSL ciphers to use 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HTTP_VERSION} _Option._**HTTP_VERSION**
: Specify which HTTP version to use! This must be set to one of the
  CURL_HTTP_VERSION* enums set below. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FTP_USE_EPSV} _Option._**FTP_USE_EPSV**
: Specifically switch on or off the FTP engine's use of the EPSV command. By
  default, that one will always be attempted before the more traditional
  PASV command. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSLCERTTYPE} _Option._**SSLCERTTYPE**
: type of the file keeping your SSL-certificate ("DER", "PEM", "ENG") 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSLKEY} _Option._**SSLKEY**
: name of the file keeping your private SSL-key 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSLKEYTYPE} _Option._**SSLKEYTYPE**
: type of the file keeping your private SSL-key ("DER", "PEM", "ENG") 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSLENGINE} _Option._**SSLENGINE**
: crypto engine for the SSL-sub system 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSLENGINE_DEFAULT} _Option._**SSLENGINE_DEFAULT**
: set the crypto engine for the SSL-sub system as default
  the param has no meaning...
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_DNS_USE_GLOBAL_CACHE} _Option._**DNS_USE_GLOBAL_CACHE**
: DEPRECATED, do not use! 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_DNS_CACHE_TIMEOUT} _Option._**DNS_CACHE_TIMEOUT**
: DNS cache timeout 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PREQUOTE} _Option._**PREQUOTE**
: send linked-list of pre-transfer QUOTE commands 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_COOKIESESSION} _Option._**COOKIESESSION**
: mark this as start of a cookie session 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_CAPATH} _Option._**CAPATH**
: The CApath directory used to validate the peer certificate
  this option is used only if SSL_VERIFYPEER is true 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_BUFFERSIZE} _Option._**BUFFERSIZE**
: Instruct libcurl to use a smaller receive buffer 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_NOSIGNAL} _Option._**NOSIGNAL**
: Instruct libcurl to not use any signal/alarm handlers, even when using
  timeouts. This option is useful for multi-threaded applications.
  See libcurl-the-guide for more background information. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SHARE} _Option._**SHARE**
: Provide a CURLShare for mutexing non-ts data 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXYTYPE} _Option._**PROXYTYPE**
: indicates type of proxy. accepted values are CURLPROXY_HTTP (default),
  CURLPROXY_HTTPS, CURLPROXY_SOCKS4, CURLPROXY_SOCKS4A and
  CURLPROXY_SOCKS5. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_ACCEPT_ENCODING} _Option._**ACCEPT_ENCODING**
: Set the Accept-Encoding string. Use this to tell a server you would like
  the response to be compressed. Before 7.21.6, this was known as
  CURLOPT_ENCODING 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PRIVATE} _Option._**PRIVATE**
: Set pointer to private data 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HTTP200ALIASES} _Option._**HTTP200ALIASES**
: Set aliases for HTTP 200 in the HTTP Response header 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_UNRESTRICTED_AUTH} _Option._**UNRESTRICTED_AUTH**
: Continue to send authentication (user+password) when following locations,
  even when hostname changed. This can potentially send off the name
  and password to whatever host the server decides. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FTP_USE_EPRT} _Option._**FTP_USE_EPRT**
: Specifically switch on or off the FTP engine's use of the EPRT command (
  it also disables the LPRT attempt). By default, those ones will always be
  attempted before the good old traditional PORT command. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HTTPAUTH} _Option._**HTTPAUTH**
: Set this to a bitmask value to enable the particular authentications
  methods you like. Use this in combination with CURLOPT_USERPWD.
  Note that setting multiple bits may cause extra network round-trips. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FTP_CREATE_MISSING_DIRS} _Option._**FTP_CREATE_MISSING_DIRS**
: FTP Option that causes missing dirs to be created on the remote server.
  In 7.19.4 we introduced the convenience enums for this option using the
  CURLFTP_CREATE_DIR prefix.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXYAUTH} _Option._**PROXYAUTH**
: Set this to a bitmask value to enable the particular authentications
  methods you like. Use this in combination with CURLOPT_PROXYUSERPWD.
  Note that setting multiple bits may cause extra network round-trips. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FTP_RESPONSE_TIMEOUT} _Option._**FTP_RESPONSE_TIMEOUT**
: FTP option that changes the timeout, in seconds, associated with
  getting a response.  This is different from transfer timeout time and
  essentially places a demand on the FTP server to acknowledge commands
  in a timely manner. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SERVER_RESPONSE_TIMEOUT} _Option._**SERVER_RESPONSE_TIMEOUT**
: This option that changes the timeout, in seconds, associated with
  getting a response from a server.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_IPRESOLVE} _Option._**IPRESOLVE**
: Set this option to one of the CURL_IPRESOLVE_* defines (see below) to
  tell libcurl to use those IP versions only. This only has effect on
  systems with support for more than one, i.e IPv4 _and_ IPv6. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_MAXFILESIZE} _Option._**MAXFILESIZE**
: Set this option to limit the size of a file that will be downloaded from
  an HTTP or FTP server.
  
  > There is also _LARGE version which adds large file support for
  platforms which have larger off_t sizes.  See MAXFILESIZE_LARGE below. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_INFILESIZE_LARGE} _Option._**INFILESIZE_LARGE**
: See the comment for INFILESIZE above, but in short, specifies
  the size of the file being uploaded.  -1 means unknown.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_RESUME_FROM_LARGE} _Option._**RESUME_FROM_LARGE**
: Sets the continuation offset.  There is also a CURLOPTTYPE_LONG version
  of this; look above for RESUME_FROM.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_MAXFILESIZE_LARGE} _Option._**MAXFILESIZE_LARGE**
: Sets the maximum size of data that will be downloaded from
  an HTTP or FTP server.  See MAXFILESIZE above for the LONG version.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_NETRC_FILE} _Option._**NETRC_FILE**
: Set this option to the file name of your .netrc file you want libcurl
  to parse (using the CURLOPT_NETRC option). If not set, libcurl will do
  a poor attempt to find the user's home directory and check for a .netrc
  file in there. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_USE_SSL} _Option._**USE_SSL**
: Enable SSL/TLS for FTP, pick one of:
  CURLUSESSL_TRY     - try using SSL, proceed anyway otherwise
  CURLUSESSL_CONTROL - SSL for the control connection or fail
  CURLUSESSL_ALL     - SSL for all communication or fail
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_POSTFIELDSIZE_LARGE} _Option._**POSTFIELDSIZE_LARGE**
: The _LARGE version of the standard POSTFIELDSIZE option 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TCP_NODELAY} _Option._**TCP_NODELAY**
: Enable/disable the TCP Nagle algorithm 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FTPSSLAUTH} _Option._**FTPSSLAUTH**
: When FTP over SSL/TLS is selected (with CURLOPT_USE_SSL), this option
  can be used to change libcurl's default action which is to first try
  "AUTH SSL" and then "AUTH TLS" in this order, and proceed when a OK
  response has been received.
  
  Available parameters are:
  CURLFTPAUTH_DEFAULT - let libcurl decide
  CURLFTPAUTH_SSL     - try "AUTH SSL" first, then TLS
  CURLFTPAUTH_TLS     - try "AUTH TLS" first, then SSL
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FTP_ACCOUNT} _Option._**FTP_ACCOUNT**
: null-terminated string for pass on to the FTP server when asked for
  "account" info 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_COOKIELIST} _Option._**COOKIELIST**
: feed cookie into cookie engine 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_IGNORE_CONTENT_LENGTH} _Option._**IGNORE_CONTENT_LENGTH**
: ignore Content-Length 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FTP_SKIP_PASV_IP} _Option._**FTP_SKIP_PASV_IP**
: Set to non-zero to skip the IP address received in a 227 PASV FTP server
  response. Typically used for FTP-SSL purposes but is not restricted to
  that. libcurl will then instead use the same IP address it used for the
  control connection. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FTP_FILEMETHOD} _Option._**FTP_FILEMETHOD**
: Select "file method" to use when doing FTP, see the curl_ftpmethod
  above. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_LOCALPORT} _Option._**LOCALPORT**
: Local port number to bind the socket to 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_LOCALPORTRANGE} _Option._**LOCALPORTRANGE**
: Number of ports to try, including the first one set with LOCALPORT.
  Thus, setting it to 1 will make no additional attempts but the first.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_CONNECT_ONLY} _Option._**CONNECT_ONLY**
: no transfer, set up connection and let application use the socket by
  extracting it with CURLINFO_LASTSOCKET 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_MAX_SEND_SPEED_LARGE} _Option._**MAX_SEND_SPEED_LARGE**
: limit-rate: maximum number of bytes per second to send 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_MAX_RECV_SPEED_LARGE} _Option._**MAX_RECV_SPEED_LARGE**
: limit-rate: maximum number of bytes per second to receive 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FTP_ALTERNATIVE_TO_USER} _Option._**FTP_ALTERNATIVE_TO_USER**
: Pointer to command string to send if USER/PASS fails. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSL_SESSIONID_CACHE} _Option._**SSL_SESSIONID_CACHE**
: set to 0 to disable session ID re-use for this transfer, default is
  enabled (== 1) 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSH_AUTH_TYPES} _Option._**SSH_AUTH_TYPES**
: allowed SSH authentication methods 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSH_PUBLIC_KEYFILE} _Option._**SSH_PUBLIC_KEYFILE**
: Used by scp/sftp to do public key authentication 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSH_PRIVATE_KEYFILE} _Option._**SSH_PRIVATE_KEYFILE**
: Used by scp/sftp to do private key authentication 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FTP_SSL_CCC} _Option._**FTP_SSL_CCC**
: Send CCC (Clear Command Channel) after authentication 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TIMEOUT_MS} _Option._**TIMEOUT_MS**
: Same as TIMEOUT, but with ms resolution 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_CONNECTTIMEOUT_MS} _Option._**CONNECTTIMEOUT_MS**
: Same as CONNECTTIMEOUT, but with ms resolution 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HTTP_TRANSFER_DECODING} _Option._**HTTP_TRANSFER_DECODING**
: set to zero to disable the libcurl's decoding and thus pass the raw body
  data to the application even when it is encoded/compressed via transfter encoding
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HTTP_CONTENT_DECODING} _Option._**HTTP_CONTENT_DECODING**
: set to zero to disable the libcurl's decoding and thus pass the raw body
  data to the application even when it is encoded/compressed via content encoding
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_NEW_FILE_PERMS} _Option._**NEW_FILE_PERMS**
: Permission used when creating new files on the remote
  server for protocols that support it, SFTP/SCP/FILE 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_NEW_DIRECTORY_PERMS} _Option._**NEW_DIRECTORY_PERMS**
: Permission used when creating new directories on the remote
  server for protocols that support it, SFTP/SCP/FILE 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_POSTREDIR} _Option._**POSTREDIR**
: Set the behavior of POST when redirecting. Values must be set to one
  of CURL_REDIR* defines below. This used to be called CURLOPT_POST301 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSH_HOST_PUBLIC_KEY_MD5} _Option._**SSH_HOST_PUBLIC_KEY_MD5**
: used by scp/sftp to verify the host's public key 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_COPYPOSTFIELDS} _Option._**COPYPOSTFIELDS**
: POST volatile input fields. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_TRANSFER_MODE} _Option._**PROXY_TRANSFER_MODE**
: set transfer mode (;type=<a|i>) when doing FTP via an HTTP proxy 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_CRLFILE} _Option._**CRLFILE**
: CRL file 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_ISSUERCERT} _Option._**ISSUERCERT**
: Issuer certificate 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_ADDRESS_SCOPE} _Option._**ADDRESS_SCOPE**
: (IPv6) Address scope 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_CERTINFO} _Option._**CERTINFO**
: Collect certificate chain info and allow it to get retrievable with
  CURLINFO_CERTINFO after the transfer is complete. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_USERNAME} _Option._**USERNAME**
: "name" (username) to use when fetching. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PASSWORD} _Option._**PASSWORD**
: "pwd" (password) to use when fetching. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXYUSERNAME} _Option._**PROXYUSERNAME**
: "name" (username) to use with Proxy when fetching. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXYPASSWORD} _Option._**PROXYPASSWORD**
: "pwd" (password) to use with Proxy when fetching. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_NOPROXY} _Option._**NOPROXY**
: Comma separated list of hostnames defining no-proxy zones. These should
  match both hostnames directly, and hostnames within a domain. For
  example, local.com will match local.com and www.local.com, but NOT
  notlocal.com or www.notlocal.com. For compatibility with other
  implementations of this, .local.com will be considered to be the same as
  local.com. A single * is the only valid wildcard, and effectively
  disables the use of proxy. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TFTP_BLKSIZE} _Option._**TFTP_BLKSIZE**
: block size for TFTP transfers 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SOCKS5_GSSAPI_NEC} _Option._**SOCKS5_GSSAPI_NEC**
: Socks Service 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROTOCOLS} _Option._**PROTOCOLS**
: set the bitmask for the protocols that are allowed to be used for the
  transfer, which thus helps the app which takes URLs from users or other
  external inputs and want to restrict what protocol(s) to deal
  with. Defaults to CURLPROTO_ALL. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_REDIR_PROTOCOLS} _Option._**REDIR_PROTOCOLS**
: set the bitmask for the protocols that libcurl is allowed to follow to,
  as a subset of the CURLOPT_PROTOCOLS ones. That means the protocol needs
  to be set in both bitmasks to be allowed to get redirected to. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSH_KNOWNHOSTS} _Option._**SSH_KNOWNHOSTS**
: set the SSH knownhost file name to use 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_MAIL_FROM} _Option._**MAIL_FROM**
: set the SMTP mail originator 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_MAIL_RCPT} _Option._**MAIL_RCPT**
: set the list of SMTP mail receiver(s) 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_FTP_USE_PRET} _Option._**FTP_USE_PRET**
: FTP: send PRET before PASV 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_RTSP_REQUEST} _Option._**RTSP_REQUEST**
: RTSP request method (OPTIONS, SETUP, PLAY, etc...) 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_RTSP_SESSION_ID} _Option._**RTSP_SESSION_ID**
: The RTSP session identifier 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_RTSP_STREAM_URI} _Option._**RTSP_STREAM_URI**
: The RTSP stream URI 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_RTSP_TRANSPORT} _Option._**RTSP_TRANSPORT**
: The Transport: header to use in RTSP requests 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_RTSP_CLIENT_CSEQ} _Option._**RTSP_CLIENT_CSEQ**
: Manually initialize the client RTSP CSeq for this handle 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_RTSP_SERVER_CSEQ} _Option._**RTSP_SERVER_CSEQ**
: Manually initialize the server RTSP CSeq for this handle 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_WILDCARDMATCH} _Option._**WILDCARDMATCH**
: Turn on wildcard matching 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_RESOLVE} _Option._**RESOLVE**
: send linked-list of name:port:address sets 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TLSAUTH_USERNAME} _Option._**TLSAUTH_USERNAME**
: Set a username for authenticated TLS 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TLSAUTH_PASSWORD} _Option._**TLSAUTH_PASSWORD**
: Set a password for authenticated TLS 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TLSAUTH_TYPE} _Option._**TLSAUTH_TYPE**
: Set authentication type for authenticated TLS 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TRANSFER_ENCODING} _Option._**TRANSFER_ENCODING**
: Set to 1 to enable the "TE:" header in HTTP requests to ask for
  compressed transfer-encoded responses. Set to 0 to disable the use of TE:
  in outgoing requests. The current default is 0, but it might change in a
  future libcurl release.
  
  libcurl will ask for the compressed methods it knows of, and if that
  isn't any, it will not ask for transfer-encoding at all even if this
  option is set to 1.
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_GSSAPI_DELEGATION} _Option._**GSSAPI_DELEGATION**
: allow GSSAPI credential delegation 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_DNS_SERVERS} _Option._**DNS_SERVERS**
: Set the name servers to use for DNS resolution 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_ACCEPTTIMEOUT_MS} _Option._**ACCEPTTIMEOUT_MS**
: Time-out accept operations (currently for FTP only) after this amount
  of milliseconds. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TCP_KEEPALIVE} _Option._**TCP_KEEPALIVE**
: Set TCP keepalive 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TCP_KEEPIDLE} _Option._**TCP_KEEPIDLE**
: non-universal keepalive idle time (Linux, AIX, HP-UX, more) 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TCP_KEEPINTVL} _Option._**TCP_KEEPINTVL**
: non-universal keepalive interval (Linux, AIX, HP-UX, more) 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSL_OPTIONS} _Option._**SSL_OPTIONS**
: Enable/disable specific SSL features with a bitmask, see CURLSSLOPT_* 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_MAIL_AUTH} _Option._**MAIL_AUTH**
: Set the SMTP auth originator 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SASL_IR} _Option._**SASL_IR**
: Enable/disable SASL initial response 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_XOAUTH2_BEARER} _Option._**XOAUTH2_BEARER**
: The XOAUTH2 bearer token 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_DNS_INTERFACE} _Option._**DNS_INTERFACE**
: Set the interface string to use as outgoing network
  interface for DNS requests.
  Only supported by the c-ares DNS backend 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_DNS_LOCAL_IP4} _Option._**DNS_LOCAL_IP4**
: Set the local IPv4 address to use for outgoing DNS requests.
  Only supported by the c-ares DNS backend 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_DNS_LOCAL_IP6} _Option._**DNS_LOCAL_IP6**
: Set the local IPv6 address to use for outgoing DNS requests.
  Only supported by the c-ares DNS backend 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_LOGIN_OPTIONS} _Option._**LOGIN_OPTIONS**
: Set authentication options directly 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSL_ENABLE_NPN} _Option._**SSL_ENABLE_NPN**
: Enable/disable TLS NPN extension (http2 over ssl might fail without) 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSL_ENABLE_ALPN} _Option._**SSL_ENABLE_ALPN**
: Enable/disable TLS ALPN extension (http2 over ssl might fail without) 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_EXPECT_100_TIMEOUT_MS} _Option._**EXPECT_100_TIMEOUT_MS**
: Time to wait for a response to a HTTP request containing an
  Expect: 100-continue header before sending the data anyway. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXYHEADER} _Option._**PROXYHEADER**
: This points to a linked list of headers used for proxy requests only,
  struct curl_slist kind 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HEADEROPT} _Option._**HEADEROPT**
: Pass in a bitmask of "header options" 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PINNEDPUBLICKEY} _Option._**PINNEDPUBLICKEY**
: The public key in DER form used to validate the peer public key
        this option is used only if SSL_VERIFYPEER is true  <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_UNIX_SOCKET_PATH} _Option._**UNIX_SOCKET_PATH**
: Path to Unix domain socket 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSL_VERIFYSTATUS} _Option._**SSL_VERIFYSTATUS**
: Set if we should verify the certificate status. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSL_FALSESTART} _Option._**SSL_FALSESTART**
: Set if we should enable TLS false start. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PATH_AS_IS} _Option._**PATH_AS_IS**
: Do not squash dot-dot sequences 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_SERVICE_NAME} _Option._**PROXY_SERVICE_NAME**
: Proxy Service Name 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SERVICE_NAME} _Option._**SERVICE_NAME**
: Service Name 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PIPEWAIT} _Option._**PIPEWAIT**
: Wait/don't wait for pipe/mutex to clarify 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_DEFAULT_PROTOCOL} _Option._**DEFAULT_PROTOCOL**
: Set the protocol used when curl is given a URL without a protocol 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_STREAM_WEIGHT} _Option._**STREAM_WEIGHT**
: Set stream weight, 1 - 256 (default is 16) 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_STREAM_DEPENDS} _Option._**STREAM_DEPENDS**
: Set stream dependency on another CURL handle 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_STREAM_DEPENDS_E} _Option._**STREAM_DEPENDS_E**
: Set E-xclusive stream dependency on another CURL handle 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TFTP_NO_OPTIONS} _Option._**TFTP_NO_OPTIONS**
: Do not send any tftp option requests to the server 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_CONNECT_TO} _Option._**CONNECT_TO**
: Linked-list of host:port:connect-to-host:connect-to-port,
        overrides the URL's host:port (only for the network layer)  <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TCP_FASTOPEN} _Option._**TCP_FASTOPEN**
: Set TCP Fast Open 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_KEEP_SENDING_ON_ERROR} _Option._**KEEP_SENDING_ON_ERROR**
: Continue to send data if the server responds early with an
  HTTP status code >= 300 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_CAINFO} _Option._**PROXY_CAINFO**
: The CApath or CAfile used to validate the proxy certificate
  this option is used only if PROXY_SSL_VERIFYPEER is true 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_CAPATH} _Option._**PROXY_CAPATH**
: The CApath directory used to validate the proxy certificate
  this option is used only if PROXY_SSL_VERIFYPEER is true 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_SSL_VERIFYPEER} _Option._**PROXY_SSL_VERIFYPEER**
: Set if we should verify the proxy in ssl handshake,
  set 1 to verify. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_SSL_VERIFYHOST} _Option._**PROXY_SSL_VERIFYHOST**
: Set if we should verify the Common name from the proxy certificate in ssl
  handshake, set 1 to check existence, 2 to ensure that it matches
  the provided hostname. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_SSLVERSION} _Option._**PROXY_SSLVERSION**
: What version to specifically try to use for proxy.
  See CURL_SSLVERSION defines below. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_TLSAUTH_USERNAME} _Option._**PROXY_TLSAUTH_USERNAME**
: Set a username for authenticated TLS for proxy 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_TLSAUTH_PASSWORD} _Option._**PROXY_TLSAUTH_PASSWORD**
: Set a password for authenticated TLS for proxy 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_TLSAUTH_TYPE} _Option._**PROXY_TLSAUTH_TYPE**
: Set authentication type for authenticated TLS for proxy 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_SSLCERT} _Option._**PROXY_SSLCERT**
: name of the file keeping your private SSL-certificate for proxy 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_SSLCERTTYPE} _Option._**PROXY_SSLCERTTYPE**
: type of the file keeping your SSL-certificate ("DER", "PEM", "ENG") for
  proxy 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_SSLKEY} _Option._**PROXY_SSLKEY**
: name of the file keeping your private SSL-key for proxy 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_SSLKEYTYPE} _Option._**PROXY_SSLKEYTYPE**
: type of the file keeping your private SSL-key ("DER", "PEM", "ENG") for
  proxy 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_KEYPASSWD} _Option._**PROXY_KEYPASSWD**
: password for the SSL private key for proxy 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_SSL_CIPHER_LIST} _Option._**PROXY_SSL_CIPHER_LIST**
: Specify which SSL ciphers to use for proxy 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_CRLFILE} _Option._**PROXY_CRLFILE**
: CRL file for proxy 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_SSL_OPTIONS} _Option._**PROXY_SSL_OPTIONS**
: Enable/disable specific SSL features with a bitmask for proxy, see
  CURLSSLOPT_* 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PRE_PROXY} _Option._**PRE_PROXY**
: Name of pre proxy to use. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_PINNEDPUBLICKEY} _Option._**PROXY_PINNEDPUBLICKEY**
: The public key in DER form used to validate the proxy public key
  this option is used only if PROXY_SSL_VERIFYPEER is true 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_ABSTRACT_UNIX_SOCKET} _Option._**ABSTRACT_UNIX_SOCKET**
: Path to an abstract Unix domain socket 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SUPPRESS_CONNECT_HEADERS} _Option._**SUPPRESS_CONNECT_HEADERS**
: Suppress proxy CONNECT response headers from user callbacks 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_REQUEST_TARGET} _Option._**REQUEST_TARGET**
: The request target, instead of extracted from the URL 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SOCKS5_AUTH} _Option._**SOCKS5_AUTH**
: bitmask of allowed auth methods for connections to SOCKS5 proxies 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SSH_COMPRESSION} _Option._**SSH_COMPRESSION**
: Enable/disable SSH compression 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_MIMEPOST} _Option._**MIMEPOST**
: Post MIME data. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TIMEVALUE_LARGE} _Option._**TIMEVALUE_LARGE**
: Time to use with the CURLOPT_TIMECONDITION. Specified in number of
  seconds since 1 Jan 1970. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HAPPY_EYEBALLS_TIMEOUT_MS} _Option._**HAPPY_EYEBALLS_TIMEOUT_MS**
: Head start in milliseconds to give happy eyeballs. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HAPROXYPROTOCOL} _Option._**HAPROXYPROTOCOL**
: send HAProxy PROXY protocol header? 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_DNS_SHUFFLE_ADDRESSES} _Option._**DNS_SHUFFLE_ADDRESSES**
: shuffle addresses before use when DNS returns multiple 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_TLS13_CIPHERS} _Option._**TLS13_CIPHERS**
: Specify which TLS 1.3 ciphers suites to use 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_PROXY_TLS13_CIPHERS} _Option._**PROXY_TLS13_CIPHERS**
: Specify which TLS 1.3 ciphers suites to use with a proxy
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_DISALLOW_USERNAME_IN_URL} _Option._**DISALLOW_USERNAME_IN_URL**
: Disallow specifying username/login in URL. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_DOH_URL} _Option._**DOH_URL**
: DNS-over-HTTPS URL 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_UPLOAD_BUFFERSIZE} _Option._**UPLOAD_BUFFERSIZE**
: Preferred buffer size to use for uploads 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_UPKEEP_INTERVAL_MS} _Option._**UPKEEP_INTERVAL_MS**
: Time in ms between connection upkeep calls for long-lived connections. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_CURLU} _Option._**CURLU**
: Specify URL using CURL URL API. 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_HTTP09_ALLOWED} _Option._**HTTP09_ALLOWED**
: set this to 1L to allow HTTP/0.9 responses or 0L to disallow 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_ALTSVC_CTRL} _Option._**ALTSVC_CTRL**
: alt-svc control bitmask 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_ALTSVC} _Option._**ALTSVC**
: alt-svc cache file name to possibly read from/write to 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_MAXAGE_CONN} _Option._**MAXAGE_CONN**
: maximum age of a connection to consider it for reuse (in seconds) 
   <div class="cite"><span class="hint">static</span> <span></span></div>



{:#Option_Option_SASL_AUTHZID} _Option._**SASL_AUTHZID**
: SASL authorisation identity 
   <div class="cite"><span class="hint">static</span> <span></span></div>




