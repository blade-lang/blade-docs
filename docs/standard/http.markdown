---
layout: default
title: http
parent: Standard Library
nav_order: 9
permalink: /standard/http
---

# http

Provides interfaces for working with Http client requests.



<h2>Properties</h2><hr>

{:#http__CONTINUE} _http._**CONTINUE**
: 100 continue


^
{:#http__SWITCHING_PROTOCOLS} _http._**SWITCHING_PROTOCOLS**
: 101 switching protocols


^
{:#http__PROCESSING} _http._**PROCESSING**
: 102 processing


^
{:#http__OK} _http._**OK**
: 200 ok


^
{:#http__CREATED} _http._**CREATED**
: 201 created


^
{:#http__ACCEPTED} _http._**ACCEPTED**
: 202 accepted


^
{:#http__NON_AUTHORITATIVE_INFORMATION} _http._**NON_AUTHORITATIVE_INFORMATION**
: 203 non authoritative information


^
{:#http__NO_CONTENT} _http._**NO_CONTENT**
: 204 no content


^
{:#http__RESET_CONTENT} _http._**RESET_CONTENT**
: 205 reset content


^
{:#http__PARTIAL_CONTENT} _http._**PARTIAL_CONTENT**
: 206 partial content


^
{:#http__MULTI_STATUS} _http._**MULTI_STATUS**
: 207 multi status


^
{:#http__ALREADY_REPORTED} _http._**ALREADY_REPORTED**
: 208 already reported


^
{:#http__IM_USED} _http._**IM_USED**
: 226 im used


^
{:#http__MULTIPLE_CHOICES} _http._**MULTIPLE_CHOICES**
: 300 multiple choices


^
{:#http__MOVED_PERMANENTLY} _http._**MOVED_PERMANENTLY**
: 301 moved permanently


^
{:#http__FOUND} _http._**FOUND**
: 302 found


^
{:#http__SEE_OTHER} _http._**SEE_OTHER**
: 303 see other


^
{:#http__NOT_MODIFIED} _http._**NOT_MODIFIED**
: 304 not modified


^
{:#http__USE_PROXY} _http._**USE_PROXY**
: 305 use proxy


^
{:#http__TEMPORARY_REDIRECT} _http._**TEMPORARY_REDIRECT**
: 307 temporary redirect


^
{:#http__PERMANENT_REDIRECT} _http._**PERMANENT_REDIRECT**
: 308 permanent redirect


^
{:#http__BAD_REQUEST} _http._**BAD_REQUEST**
: 400 bad request


^
{:#http__UNAUTHORIZED} _http._**UNAUTHORIZED**
: 401 unauthorized


^
{:#http__PAYMENT_REQUIRED} _http._**PAYMENT_REQUIRED**
: 402 payment required


^
{:#http__FORBIDDEN} _http._**FORBIDDEN**
: 403 forbidden


^
{:#http__NOT_FOUND} _http._**NOT_FOUND**
: 404 not found


^
{:#http__METHOD_NOT_ALLOWED} _http._**METHOD_NOT_ALLOWED**
: 405 method not allowed


^
{:#http__NOT_ACCEPTABLE} _http._**NOT_ACCEPTABLE**
: 406 not acceptable


^
{:#http__PROXY_AUTHENTICATION_REQUIRED} _http._**PROXY_AUTHENTICATION_REQUIRED**
: 407 proxy authentication required


^
{:#http__REQUEST_TIMEOUT} _http._**REQUEST_TIMEOUT**
: 408 request timeout


^
{:#http__CONFLICT} _http._**CONFLICT**
: 409 conflict


^
{:#http__GONE} _http._**GONE**
: 410 gone


^
{:#http__LENGTH_REQUIRED} _http._**LENGTH_REQUIRED**
: 411 length required


^
{:#http__PRECONDITION_FAILED} _http._**PRECONDITION_FAILED**
: 412 precondition failed


^
{:#http__PAYLOAD_TOO_LARGE} _http._**PAYLOAD_TOO_LARGE**
: 413 payload too large


^
{:#http__REQUEST_URI_TOO_LONG} _http._**REQUEST_URI_TOO_LONG**
: 414 request uri too long


^
{:#http__UNSUPPORTED_MEDIA_TYPE} _http._**UNSUPPORTED_MEDIA_TYPE**
: 415 unsupported media type


^
{:#http__REQUESTED_RANGE_NOT_SATISFIABLE} _http._**REQUESTED_RANGE_NOT_SATISFIABLE**
: 416 requested range not satisfiable


^
{:#http__EXPECTATION_FAILED} _http._**EXPECTATION_FAILED**
: 417 expectation failed


^
{:#http__TEAPOT} _http._**TEAPOT**
: 418 teapot


^
{:#http__MISDIRECTED_REQUEST} _http._**MISDIRECTED_REQUEST**
: 421 misdirected request


^
{:#http__UNPROCESSABLE_ENTITY} _http._**UNPROCESSABLE_ENTITY**
: 422 unprocessable entity


^
{:#http__LOCKED} _http._**LOCKED**
: 423 locked


^
{:#http__FAILED_DEPENDENCY} _http._**FAILED_DEPENDENCY**
: 424 failed dependency


^
{:#http__UPGRADE_REQUIRED} _http._**UPGRADE_REQUIRED**
: 426 upgrade required


^
{:#http__PRECONDITION_REQUIRED} _http._**PRECONDITION_REQUIRED**
: 428 precondition required


^
{:#http__TOO_MANY_REQUESTS} _http._**TOO_MANY_REQUESTS**
: 429 too many requests


^
{:#http__REQUEST_HEADER_FIELDS_TOO_LARGE} _http._**REQUEST_HEADER_FIELDS_TOO_LARGE**
: 431 request header fields too large


^
{:#http__CONNECTION_CLOSED_WITHOUT_RESPONSE} _http._**CONNECTION_CLOSED_WITHOUT_RESPONSE**
: 444 connection closed without response


^
{:#http__UNAVAILABLE_FOR_LEGAL_REASONS} _http._**UNAVAILABLE_FOR_LEGAL_REASONS**
: 451 unavailable for legal reasons


^
{:#http__CLIENT_CLOSED_REQUEST} _http._**CLIENT_CLOSED_REQUEST**
: 499 client closed request


^
{:#http__INTERNAL_SERVER_ERROR} _http._**INTERNAL_SERVER_ERROR**
: 500 internal server error


^
{:#http__NOT_IMPLEMENTED} _http._**NOT_IMPLEMENTED**
: 501 not implemented


^
{:#http__BAD_GATEWAY} _http._**BAD_GATEWAY**
: 502 bad gateway


^
{:#http__SERVICE_UNAVAILABLE} _http._**SERVICE_UNAVAILABLE**
: 503 service unavailable


^
{:#http__GATEWAY_TIMEOUT} _http._**GATEWAY_TIMEOUT**
: 504 gateway timeout


^
{:#http__HTTP_VERSION_NOT_SUPPORTED} _http._**HTTP_VERSION_NOT_SUPPORTED**
: 505 http version not supported


^
{:#http__VARIANT_ALSO_NEGOTIATES} _http._**VARIANT_ALSO_NEGOTIATES**
: 506 variant also negotiates


^
{:#http__INSUFFICIENT_STORAGE} _http._**INSUFFICIENT_STORAGE**
: 507 insufficient storage


^
{:#http__LOOP_DETECTED} _http._**LOOP_DETECTED**
: 508 loop detected


^
{:#http__NOT_EXTENDED} _http._**NOT_EXTENDED**
: 510 not extended


^
{:#http__NETWORK_AUTHENTICATION_REQUIRED} _http._**NETWORK_AUTHENTICATION_REQUIRED**
: 511 network authentication required


^
{:#http__NETWORK_CONNECT_TIMEOUT_ERROR} _http._**NETWORK_CONNECT_TIMEOUT_ERROR**
: 599 network connect timeout error




<h2>Functions</h2><hr>

{:#http__get} _http_.**get**(_url_: string)
: sends an Http GET request and returns an HttpResponse
  or throws one of SocketException or Exception if it fails


^
{:#http__post} _http_.**post**(_url_: string, [_data_: string])
: sends an Http POST request and returns an HttpResponse
  or throws one of SocketException or Exception if it fails


^
{:#http__put} _http_.**put**(_url_: string, [_data_: string])
: sends an Http PUT request and returns an HttpResponse
  or throws one of SocketException or Exception if it fails




<h2>Classes</h2><hr>



### _class_ HttpClient 
---

Handles http requests.


#### class HttpClient properties
---

{:#HttpClient_HttpClient_user_agent} _HttpClient._**user_agent**
: The user agent of the client used to make the request
   <div class="cite"><span class="hint">default</span> <span>Blade HTTP Client/1.0</span></div>



{:#HttpClient_HttpClient_follow_redirect} _HttpClient._**follow_redirect**
: Indicates if we receive a redirect from a server, this flag tells us whether 
  we should follow it or not.
   <div class="cite"><span class="hint">default</span> <span>true</span></div>



{:#HttpClient_HttpClient_skip_hostname_verification} _HttpClient._**skip_hostname_verification**
: Indicates if the site you're connecting to uses a different host name that what
  they have mentioned in their server certificate's commonName (or subjectAltName) 
  fields, connection will fail. You can skip this check by setting to true, but this 
  will make the connection less secure.
   <div class="cite"><span class="hint">default</span> <span>false</span></div>



{:#HttpClient_HttpClient_skip_peer_verification} _HttpClient._**skip_peer_verification**
: Indicates if you want to connect to a site who isn't using a certificate that is
  signed by one of the certs in the CA bundle you have, you can skip the verification 
  of the server's certificate. This makes the connection A LOT LESS SECURE.
   <div class="cite"><span class="hint">default</span> <span>false</span></div>



{:#HttpClient_HttpClient_referer} _HttpClient._**referer**
: the site that refers us to the current site
   <div class="cite"><span class="hint">default</span> <span>nil</span></div>



{:#HttpClient_HttpClient_ca_cert} _HttpClient._**ca_cert**
: If you have a CA cert for the server stored someplace else than in the default bundle


{:#HttpClient_HttpClient_connect_timeout} _HttpClient._**connect_timeout**
: The connect timeout duration in milliseconds
   <div class="cite"><span class="hint">default</span> <span>60s</span></div>



{:#HttpClient_HttpClient_send_timeout} _HttpClient._**send_timeout**
: The send timeout duration in milliseconds
   <div class="cite"><span class="hint">default</span> <span>300s</span></div>



{:#HttpClient_HttpClient_receive_timeout} _HttpClient._**receive_timeout**
: The receive timeout duration in milliseconds
   <div class="cite"><span class="hint">default</span> <span>300s</span></div>



{:#HttpClient_HttpClient_headers} _HttpClient._**headers**
: A dictionary of headers sent along with the request


{:#HttpClient_HttpClient_no_expect} _HttpClient._**no_expect**
: Indicates whether to remove the expect header or not only applies to requests with 
  files in the body
   <div class="cite"><span class="hint">default</span> <span>false</span></div>



#### class HttpClient methods
---

{:#_HttpClient_send_request} **send_request**(_url_: string, [_method_: string = 'GET', _data_: string])
: Sends an Http request and returns a HttpResponse.
  
   <div class="cite"><span class="hint">return</span> <span>HttpResponse</span></div>

   <div class="cite"><span class="hint">throws</span> <span>SocketException, Exception</span></div>




^


### _class_ HttpResponse 
---

Represents the response to an Http request


#### class HttpResponse methods
---

{:#_HttpResponse_HttpResponse} **HttpResponse**(body, status, headers, version, time_taken, redirects, responder)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



