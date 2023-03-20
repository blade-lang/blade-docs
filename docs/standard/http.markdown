---
layout: default
title: http
parent: Standard Library
nav_order: 15
permalink: /standard/http.html
---

# http

The `http` module provides a rich library to help in building HTTP 
clients and servers. The module also provides a few generic abstractions 
for simple HTTP operations such as a GET request.

### Examples

The example below shows making a GET request to fetch a webpage.

```blade
import http

echo http.get('http://example.com')
# <class HttpResponse instance at 0x600002adacd0>
```

There is a `post()` and `put()` alternative to the `get()` method called 
above and they are documented below.

For a more controlled HTTP request, you should use the HttpClient class. 
Below is an example of such implementation that sets the timeout for 
receiving response back from the server to 30 seconds.

```blade
import http

var client = http.HttpClient()
client.receive_timeout = 30000
var res = client.send_request('http://example/endpoint?query=1', 'GET')
echo res.body
```

Creating a server with the `http` module is also a breeze. 
The example below shows an implementation of an HTTP API server listening on port 
3000 and simple returns the JSON of the request object itself.

```blade
import http
import json

var server = http.server(3000)
server.on_receive(|request, response| {
  echo 'Request from ${request.ip} to ${request.path}.'
  response.headers['Content-Type'] = 'application/json'
  response.write(json.encode(request))
})

echo 'Listening on Port 3000...'
server.listen()
```

The `http` module does not make any assumption as to the type of data to be sent 
in request bodies and for this reason, it should not be expected to automatically 
convert dictionaries into JSON objects or create multipart/form-data request for you. 
Rather, it gives the tools required to craft any request body of your choice.



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


^
{:#http__map} _http._**map**
: A map of status code to their string representation.




<h2>Functions</h2><hr>

{:#http__set_headers} _http_.**set_headers**(_headers_: dict)
: Sets the request headers for the current module instance.
   
  This function returns HttpClient in order to allow for idiomatic 
  chaining such as:
  
  ```blade
  import http
  var client = http.set_headers({
    'Authorization': 'Bearer SomeAPIBearerToken',
    'Host': 'example.com',
  })
  
  echo client.get('/current-user').body.to_string()
  ```
   <div class="cite"><span class="hint">returns</span> <span>HttpClient</span></div>

   <div class="cite"><span class="hint">throws</span> <span>Exception</span></div>



^
{:#http__get} _http_.**get**(_url_: string)
: sends an Http GET request and returns an HttpResponse
  or throws one of SocketException or Exception if it fails.
   <div class="cite"><span class="hint">returns</span> <span>HttpResponse</span></div>

   <div class="cite"><span class="hint">throws</span> <span>Exception, SocketExcepion, HttpException</span></div>



^
{:#http__post} _http_.**post**(_url_: string, [_data_: string | bytes])
: sends an Http POST request and returns an HttpResponse.
   <div class="cite"><span class="hint">returns</span> <span>HttpResponse</span></div>

   <div class="cite"><span class="hint">throws</span> <span>Exception, SocketExcepion, HttpException</span></div>



^
{:#http__put} _http_.**put**(_url_: string, [_data_: string | bytes])
: sends an Http PUT request and returns an HttpResponse.
   <div class="cite"><span class="hint">returns</span> <span>HttpResponse</span></div>

   <div class="cite"><span class="hint">throws</span> <span>Exception, SocketExcepion, HttpException</span></div>



^
{:#http__delete} _http_.**delete**(_url_: string)
: sends an Http DELETE request and returns an HttpResponse.
   <div class="cite"><span class="hint">returns</span> <span>HttpResponse</span></div>

   <div class="cite"><span class="hint">throws</span> <span>Exception, SocketExcepion, HttpException</span></div>



^
{:#http__server} _http_.**server**(_port_: int, _address_: string)
: Creates an new HttpServer instance.
   <div class="cite"><span class="hint">returns</span> <span>HttpServer</span></div>

   <div class="cite"><span class="hint">throws</span> <span>Exception, SocketExcepion, HttpException</span></div>





<h2>Classes</h2><hr>



### _class_ HttpRequest 
---

Http request handler and object.
  @serializable
  @printable


#### class HttpRequest properties
---

{:#HttpRequest_HttpRequest_request_uri} _HttpRequest._**request_uri**
: The original request URL as sent in the raw request.
   <div class="cite"><span class="hint">type</span> <span>string</span></div>



{:#HttpRequest_HttpRequest_path} _HttpRequest._**path**
: The requested path or file. E.g. if the Request URI is `/users?sort=desc`, 
  then the path is `/users`.
   <div class="cite"><span class="hint">type</span> <span>string</span></div>



{:#HttpRequest_HttpRequest_method} _HttpRequest._**method**
: The HTTP method of the request: GET, POST, PUT, etc.
   <div class="cite"><span class="hint">type</span> <span>string</span></div>

   <div class="cite"><span class="hint">default</span> <span>GET</span></div>



{:#HttpRequest_HttpRequest_host} _HttpRequest._**host**
: The hostname derived from the `Host` header or the first instance of 
  `X-Forwarded-Host` if set.
   <div class="cite"><span class="hint">type</span> <span>string</span></div>



{:#HttpRequest_HttpRequest_ip} _HttpRequest._**ip**
: The IP address of the remote client that initiated the request.
   <div class="cite"><span class="hint">type</span> <span>string</span></div>



{:#HttpRequest_HttpRequest_headers} _HttpRequest._**headers**
: A dictionary containing the headers sent with the request.
   <div class="cite"><span class="hint">type</span> <span>dictionary</span></div>



{:#HttpRequest_HttpRequest_queries} _HttpRequest._**queries**
: A dictionary containing the entries of the URI query string.
   <div class="cite"><span class="hint">type</span> <span>dictionary</span></div>



{:#HttpRequest_HttpRequest_cookies} _HttpRequest._**cookies**
: A dictionary containing the cookies sent with the request.
   <div class="cite"><span class="hint">type</span> <span>dictionary</span></div>



{:#HttpRequest_HttpRequest_body} _HttpRequest._**body**
: A dictionary containing all data submitted in the request body.
   <div class="cite"><span class="hint">type</span> <span>dictionary</span></div>



{:#HttpRequest_HttpRequest_files} _HttpRequest._**files**
: A dictionary containing the data of all files uploaded in the request.
   <div class="cite"><span class="hint">type</span> <span>dictionary</span></div>



{:#HttpRequest_HttpRequest_http_version} _HttpRequest._**http_version**
: The HTTP version used for the request.
   <div class="cite"><span class="hint">type</span> <span>string</span></div>



{:#HttpRequest_HttpRequest_auth_method} _HttpRequest._**auth_method**
: The HTTP authentication method to use when the uri contains a credential.
   <div class="cite"><span class="hint">type</span> <span>Auth</span></div>

   <div class="cite"><span class="hint">default</span> <span>Auth.ANY</span></div>



#### class HttpRequest methods
---

{:#_HttpRequest_parse} **parse**(_raw_data_: string [, _client_: Socket | TLSSocket])
: Parses a raw HTTP request string into a correct HttpRequest
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



{:#_HttpRequest_send} **send**(_uri_: Url, _method_: string [, _data_: string | bytes [, _options_: dict]])
:  <div class="cite"><span class="hint">default</span> <span>follow_redirect: true</span></div>




^


### _class_ HttpException  < _Exception_
---

HTTP related Exceptions
  @printable



^


### _class_ HttpServer 
---

HTTP server
  @printable


#### class HttpServer properties
---

{:#HttpServer_HttpServer_host} _HttpServer._**host**
: The host address to which this server will be bound
   <div class="cite"><span class="hint">default</span> <span>socket.IP_LOCAL (127.0.0.1)</span></div>



{:#HttpServer_HttpServer_port} _HttpServer._**port**
: The port to which this server will be bound to on the host.


{:#HttpServer_HttpServer_socket} _HttpServer._**socket**
: The working Socket instance for the HttpServer.


{:#HttpServer_HttpServer_resuse_address} _HttpServer._**resuse_address**
: A boolean value indicating whether to reuse socket addresses or not.
   <div class="cite"><span class="hint">default</span> <span>true</span></div>



{:#HttpServer_HttpServer_read_timeout} _HttpServer._**read_timeout**
: The timeout in milliseconds after which an attempt to read clients 
  request data will be terminated.
   <div class="cite"><span class="hint">default</span> <span>2000 (2 seconds)</span></div>



{:#HttpServer_HttpServer_write_timeout} _HttpServer._**write_timeout**
: The timeout in milliseconds after which an attempt to write response data to 
  clients will be terminated. 
  
  If we cannot send response to a client after the stipulated time, it will be 
  assumed such clients have disconnected and existing connections for that 
  client will be closed and their respective sockets will be discarded.
  
   <div class="cite"><span class="hint">default</span> <span>2000 (2 seconds)</span></div>



#### class HttpServer methods
---

{:#_HttpServer_HttpServer} **HttpServer**(_port_: int [, _host_: string])
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_HttpServer_close} **close**()
: stops the server


{:#_HttpServer_on_connect} **on_connect**(_fn_: function)
: Adds a function to be called when a new client connects.
  > - Function _fn_ MUST accept at one parameter which will be passed the client Socket object.
  > - multiple `on_connect()` may be set on a single instance.


{:#_HttpServer_on_disconnect} **on_disconnect**(_fn_: function)
: Adds a function to be called when a new client disconnects.
  > - Function _fn_ MUST accept at one parameter which will be passed the client information.
  > - multiple `on_disconnect()` may be set on a single instance.


{:#_HttpServer_on_receive} **on_receive**(_fn_: function)
: Adds a function to be called when the server receives a message from a client.
  
  > Function _fn_ MUST accept TWO parameters. First parameter will accept the HttpRequest 
  > object and the second will accept the HttpResponse object.
  
  > - multiple `on_receive()` may be set on a single instance.


{:#_HttpServer_on_reply} **on_reply**(_fn_: function)
: Adds a function to be called when the server sends a reply to a client.
  
  > Function _fn_ MUST accept one parameter which will be passed the HttpResponse object.
  
  > - multiple `on_sent()` may be set on a single instance.


{:#_HttpServer_on_error} **on_error**(_fn_: function)
: Adds a function to be called when the server encounters an error with a client.
  
  > Function _fn_ MUST accept two parameters. The first argument will be passed the 
  > `Exception` object and the second will be passed the client `Socket` object.
  
  > - multiple `on_error()` may be set on a single instance.


{:#_HttpServer_listen} **listen**()
: Binds to the instance port and host and starts listening for incoming 
  connection from HTTP clients.



^


### _class_ HttpClient 
---

Handles http requests.
  @note This client do not currently support the compress, deflate and gzip transfer encoding.


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
  
   <div class="cite"><span class="hint">default</span> <span>method: GET</span></div>

   <div class="cite"><span class="hint">return</span> <span>HttpResponse</span></div>

   <div class="cite"><span class="hint">throws</span> <span>SocketException, Exception</span></div>



{:#_HttpClient_get} **get**(_url_: string)
: sends an Http GET request and returns an HttpResponse.
   <div class="cite"><span class="hint">returns</span> <span>HttpResponse</span></div>

   <div class="cite"><span class="hint">throws</span> <span>Exception, SocketExcepion, HttpException</span></div>



{:#_HttpClient_post} **post**(_url_: string, [_data_: string | bytes])
: sends an Http POST request and returns an HttpResponse.
   <div class="cite"><span class="hint">returns</span> <span>HttpResponse</span></div>

   <div class="cite"><span class="hint">throws</span> <span>Exception, SocketExcepion, HttpException</span></div>



{:#_HttpClient_put} **put**(_url_: string, [_data_: string | bytes])
: sends an Http PUT request and returns an HttpResponse.
   <div class="cite"><span class="hint">returns</span> <span>HttpResponse</span></div>

   <div class="cite"><span class="hint">throws</span> <span>Exception, SocketExcepion, HttpException</span></div>



{:#_HttpClient_delete} **delete**(_url_: string)
: sends an Http DELETE request and returns an HttpResponse.
   <div class="cite"><span class="hint">returns</span> <span>HttpResponse</span></div>

   <div class="cite"><span class="hint">throws</span> <span>Exception, SocketExcepion, HttpException</span></div>




^


### _class_ HttpResponse 
---

Represents the response to an Http request
  @serializable
  @printable


#### class HttpResponse properties
---

{:#HttpResponse_HttpResponse_version} _HttpResponse._**version**
: The HTTP version of the response
   <div class="cite"><span class="hint">type</span> <span>string</span></div>



{:#HttpResponse_HttpResponse_status} _HttpResponse._**status**
: The HTTP response status code
   <div class="cite"><span class="hint">type</span> <span>number</span></div>



{:#HttpResponse_HttpResponse_headers} _HttpResponse._**headers**
: The HTTP response headers
   <div class="cite"><span class="hint">type</span> <span>dictionary</span></div>



{:#HttpResponse_HttpResponse_time_taken} _HttpResponse._**time_taken**
: Total time taken for the HTTP request that generated this HttpResponse to complete
   <div class="cite"><span class="hint">type</span> <span>number</span></div>



{:#HttpResponse_HttpResponse_redirects} _HttpResponse._**redirects**
: The number of times the HTTP request that generated this HttpResponse was redirected.
   <div class="cite"><span class="hint">type</span> <span>number</span></div>



{:#HttpResponse_HttpResponse_responder} _HttpResponse._**responder**
: The final URL that provided the HttpResponse
   <div class="cite"><span class="hint">type</span> <span>string</span></div>

  > - This might differ from the original request URI.


{:#HttpResponse_HttpResponse_body} _HttpResponse._**body**
: The content of the HTTP response as bytes
   <div class="cite"><span class="hint">type</span> <span>bytes</span></div>



{:#HttpResponse_HttpResponse_cookies} _HttpResponse._**cookies**
: The cookies to be sent back to the client
   <div class="cite"><span class="hint">type</span> <span>list</span></div>



#### class HttpResponse methods
---

{:#_HttpResponse_HttpResponse} **HttpResponse**(_body_: string, _status_: int, _headers_: dict, _cookies_: list, _version_: string, _time_taken_: number, _redirects_: int, _responder_: string)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_HttpResponse_write} **write**(_data_: string | bytes)
: Writes data to the response response. 
  
  > This method should be prefered over writing directly to the body 
  > property to prevent unexpected behaviors.


{:#_HttpResponse_set_cookie} **set_cookie**(_key_: string, _value_: string [, _domain_: string [, _path_: string [, _expires_: string [, _secure_: bool [, extras]]]]])
: Sets a cookie to be send back to a client with the given _key_ and _value_. 
  When other parameters are given, they are used to construct a correct Set-Cookie 
  header based on their named properties.
   <div class="cite"><span class="hint">throw</span> <span>HttpException</span></div>



{:#_HttpResponse_redirect} **redirect**(_location_: string [, _status_: string])
: Redirects the client to a new location. This function simultaneously sets 
  the `Location` header and returns a 30x status code. If the `status` 
  parameter is not given, the function defaults to `302`.
   <div class="cite"><span class="hint">throw</span> <span>HttpException</span></div>

  
  > - when supplying a status, it must be a 30x



