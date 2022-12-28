---
layout: default
title: ssl
parent: Standard Library
nav_order: 26
permalink: /standard/ssl.html
---

# ssl

Provides OpenSSL bindings for Blade



<h2>Properties</h2><hr>

{:#ssl__SSL_FILETYPE_PEM} _ssl._**SSL_FILETYPE_PEM**
: SSL_FILETYPE_PEM


^
{:#ssl__SSL_FILETYPE_ASN1} _ssl._**SSL_FILETYPE_ASN1**
: SSL_FILETYPE_ASN1


^
{:#ssl__SSL_VERIFY_NONE} _ssl._**SSL_VERIFY_NONE**
: - `Server mode`: the server will not send a client certificate request 
  to the client, so the client will not send a certificate.
  
  - `Client mode`: if not using an anonymous cipher (by default disabled), 
  the server will send a certificate which will be checked. The handshake 
  will be continued regardless of the verification result.


^
{:#ssl__SSL_VERIFY_PEER} _ssl._**SSL_VERIFY_PEER**
: - `Server mode`: the server sends a client certificate request to the client. 
  The certificate returned (if any) is checked. If the verification process fails, 
  the TLS/SSL handshake is immediately terminated with an alert message containing 
  the reason for the verification failure. The behaviour can be controlled by the 
  additional SSL_VERIFY_FAIL_IF_NO_PEER_CERT, SSL_VERIFY_CLIENT_ONCE and 
  SSL_VERIFY_POST_HANDSHAKE flags.
  
  - `Client mode`: the server certificate is verified. If the verification process 
  fails, the TLS/SSL handshake is immediately terminated with an alert message 
  containing the reason for the verification failure. If no server certificate is sent, 
  because an anonymous cipher is used, SSL_VERIFY_PEER is ignored.


^
{:#ssl__SSL_VERIFY_FAIL_IF_NO_PEER_CERT} _ssl._**SSL_VERIFY_FAIL_IF_NO_PEER_CERT**
: - `Server mode`: if the client did not return a certificate, the TLS/SSL handshake is 
  immediately terminated with a "handshake failure" alert. This flag must be used together 
  with SSL_VERIFY_PEER.
  
  - `Client mode`: ignored


^
{:#ssl__SSL_VERIFY_CLIENT_ONCE} _ssl._**SSL_VERIFY_CLIENT_ONCE**
: - `Server mode`: only request a client certificate once during the connection. Do not 
  ask for a client certificate again during renegotiation or post-authentication if a 
  certificate was requested during the initial handshake. This flag must be used together 
  with SSL_VERIFY_PEER.
  
  - `Client mode`: ignored


^
{:#ssl__SSL_VERIFY_POST_HANDSHAKE} _ssl._**SSL_VERIFY_POST_HANDSHAKE**
: - `Server mode`: the server will not send a client certificate request during the initial 
  handshake, but will send the request via SSL_verify_client_post_handshake(). This allows 
  the SSL_CTX or SSL to be configured for post-handshake peer verification before the 
  handshake occurs. This flag must be used together with SSL_VERIFY_PEER. TLSv1.3 only; no 
  effect on pre-TLSv1.3 connections.
  
  - `Client mode`: ignored


^
{:#ssl__TLS_method} _ssl._**TLS_method**
: TLS method


^
{:#ssl__TLS_client_method} _ssl._**TLS_client_method**
: TLS client method


^
{:#ssl__TLS_server_method} _ssl._**TLS_server_method**
: TLS server method


^
{:#ssl__SSLv23_method} _ssl._**SSLv23_method**
: SSLv23 method


^
{:#ssl__SSLv23_client_method} _ssl._**SSLv23_client_method**
: SSLv23 client method


^
{:#ssl__SSLv23_server_method} _ssl._**SSLv23_server_method**
: SSLv23 server method


^
{:#ssl__BIO_CLOSE} _ssl._**BIO_CLOSE**
: BIO_CLOSE


^
{:#ssl__BIO_NOCLOSE} _ssl._**BIO_NOCLOSE**
: BIO_NOCLOSE


^
{:#ssl__BIO_f_ssl} _ssl._**BIO_f_ssl**
: SSL BIO method f_ssl
  
  > I/O performed on an SSL BIO communicates using the SSL protocol 
  > with the SSLs read and write BIOs. If an SSL connection is not 
  > established then an attempt is made to establish one on the first 
  > I/O call.


^
{:#ssl__BIO_s_connect} _ssl._**BIO_s_connect**
: SSL BIO method connect
  
  > Using connect BIOs, TCP/IP connections can be made and data 
  > transferred using only BIO routines. In this way any platform 
  > specific operations are hidden by the BIO abstraction.


^
{:#ssl__BIO_s_accept} _ssl._**BIO_s_accept**
: SSL BIO method accept
  
  > Using accept BIOs, TCP/IP connections can be accepted and data 
  > transferred using only BIO routines. In this way any platform specific 
  > operations are hidden by the BIO abstraction.




<h2>Classes</h2><hr>



### _class_ SSL 
---

SSL interface class


#### class SSL methods
---

{:#_SSL_SSL} **SSL**(_context_: SSLContext)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_SSL_set_connect_state} **set_connect_state**()
: puts this SSL instance in the connected mode.


{:#_SSL_set_accept_state} **set_accept_state**()
: puts this SSL instance in the accept mode.


{:#_SSL_get_fd} **get_fd**()
: returns the current socket file descriptor.
  It returns `-1` on failure or a positive integer on success.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_SSL_set_fd} **set_fd**(_fd_: int)
: sets the socket file descriptor for this SSL


{:#_SSL_accept} **accept**()
: begins accepting data on SSL


{:#_SSL_accept} **connect**()
: connects to an SSL server instance


{:#_SSL_write} **write**(_data_: string | bytes)
: writes data to the current I/O stream.
   <div class="cite"><span class="hint">return</span> <span>int representing the total bytes written</span></div>



{:#_SSL_read} **read**([_length_: int])
: reads data off the I/O and returns it
   <div class="cite"><span class="hint">default</span> <span>length = -1</span></div>

   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_SSL_error} **error**([_code_: int])
: returns the last SSL error number
   <div class="cite"><span class="hint">return</span> <span>int</span></div>



{:#_SSL_shutdown} **shutdown**()
: shutdown the SSL object


{:#_SSL_free} **free**()
: frees this SSL and all associated resources


{:#_SSL_get_pointer} **get_pointer**()
: returns the raw OpenSSl SSL pointer
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>




^


### _class_ TLSSocket 
---

TLS enabled Socket version powered by OpenSSL.
  @printable


#### class TLSSocket properties
---

{:#TLSSocket_TLSSocket_host} _TLSSocket._**host**
: This property holds the host bound, to be bound to or connected to by the current socket.
  Whenever a host is not given, the host will default to localhost.


{:#TLSSocket_TLSSocket_port} _TLSSocket._**port**
: The port currently bound or connected to by the socket


{:#TLSSocket_TLSSocket_family} _TLSSocket._**family**
: The socket family (which must be one of the `AF_` variables).
  The default family for the socket is AF_INET


{:#TLSSocket_TLSSocket_type} _TLSSocket._**type**
: The type of socket stream used by the socket.
  The default socket type is `SOCK_STREAM`


{:#TLSSocket_TLSSocket_protocol} _TLSSocket._**protocol**
: The current operating protocol of the socket that controls the 
  underlying behavior of the socket. The default is `IPPROTO_TCP`.


{:#TLSSocket_TLSSocket_id} _TLSSocket._**id**
: The file descriptor id of the current socket on the host machine.


{:#TLSSocket_TLSSocket_is_client} _TLSSocket._**is_client**
: `true` when the socket is a client to a server socket, `false` otherwise.


{:#TLSSocket_TLSSocket_is_bound} _TLSSocket._**is_bound**
: `true` when the socket is bound to a given port on the device, `false` 
  otherwise.


{:#TLSSocket_TLSSocket_is_connected} _TLSSocket._**is_connected**
: `true` when the socket is connected to a server socket, `false` otherwise.


{:#TLSSocket_TLSSocket_is_listening} _TLSSocket._**is_listening**
: `true` when the socket is currently listening on a host device port as a 
  server, `false` otherwise.


{:#TLSSocket_TLSSocket_is_closed} _TLSSocket._**is_closed**
: `true` when the socket is closed, `false` otherwise.


{:#TLSSocket_TLSSocket_is_shutdown} _TLSSocket._**is_shutdown**
: `true` when the socket is shutdown, `false` otherwise.


{:#TLSSocket_TLSSocket_is_blocking} _TLSSocket._**is_blocking**
: `true` when the socket is running in a blocking mode, `false` otherwise.


{:#TLSSocket_TLSSocket_shutdown_reason} _TLSSocket._**shutdown_reason**
: The property holds the reason for which the last `shutdown` operation 
  was called or `-1` if `shutdown` was never requested.


{:#TLSSocket_TLSSocket_send_timeout} _TLSSocket._**send_timeout**
: The amount of time in milliseconds that the socket waits before it 
  terminates a `send` operation. This is equal to the `SO_SNDTIMEO`.


{:#TLSSocket_TLSSocket_receive_timeout} _TLSSocket._**receive_timeout**
: The amount of time in milliseconds that the socket waits before it 
  terminates a `receive` operation. This is equal to the `SO_RCVTIMEO`.


#### class TLSSocket methods
---

{:#_TLSSocket_TLSSocket} **TLSSocket**([_socket_: Socket [, _context_: SSLContext [, _ssl_: SSL]]])
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_TLSSocket_connect} **connect**(_host_: string, _port_: int [, _timeout_: int])
: Initiates a connection to the given host on the specified port. If host is `nil`, it will 
  connect on to the current hostn specified on the socket.
  
   <div class="cite"><span class="hint">default</span> <span>timeout = 300,000ms (i.e. 300 seconds)</span></div>

   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_TLSSocket_bind} **bind**(_port_: int [, _host_: string])
: Binds this socket to the given port on the given host. If host is `nil` or not specified, it will connect 
  on to the current hostn specified on the socket. 
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_TLSSocket_send} **send**(_message_: string | file | bytes, _flags_: int)
: Sends the specified message to the socket. When this methods accepts a file as a message, 
  the file is read and the resultant bytes of the file content is streamed to the socket.
  
  > - the flags parameter is currently redundant and is kept only to remanin compatible with future plans for this method.
   <div class="cite"><span class="hint">return</span> <span>number greater than -1 if successful indicating the total number of bytes sent or -1 if it fails.</span></div>



{:#_TLSSocket_receive} **receive**([_length_: int [, _flags_: int]])
: Receives bytes of the given length from the socket. If the length is not given, it default length of 
  -1 indicating that the total available data on the socket stream will be read. 
  If no data is available for read on the socket, the socket will wait to receive data or until the 
  `receive_timeout` which is also equal to the `SO_RCVTIMEO` setting of the socket has elapsed before or 
  until it has received the total number of bytes required (whichever comes first).
  
  > - the flags parameter is currently redundant and is kept only to remanin compatible with future plans for this method.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_TLSSocket_read} **read**([_length_: int])
: Reads bytes of the given length from the socket. If the length is not given, it default length of 
  -1 indicating that the total available data on the socket stream will be read. 
  
  > This method differs from `receive()` in that it does not check for a socket having data to 
  > read or not and will block until data of _length_ have been read or no more data is available for 
  > reading.
  > - Only use this function after a call to `receive()` has succeeded.
   <div class="cite"><span class="hint">default</span> <span>Length = 1024</span></div>

   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_TLSSocket_listen} **listen**([_queue_length_: int])
: Listen for connections on a socket
  
  This method puts the socket in a state where it is willing to accept incoming connections and creates 
  a queue limit of `queue_length` for incoming connections. If a connection request arrives with 
  the queue full, the client may receive an error with an indication of `ECONNREFUSED`. 
  Alternatively, if the underlying protocol supports retransmission, the request may be ignored 
  so that retries may succeed.
  
  When the `queue_length` is ommited or set to -1, the method will use the default queue limit of 
  the current platform which is usually equal to `SOMAXCONN`.
  
  > - listen() call applies only to sockets of type `SOCK_STREAM` (which is the default)
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_TLSSocket_accept} **accept**()
: Accepts a connection on a socket
  
  This method extracts the first connection request on the queue of pending connections, creates a new socket 
  with the same properties of the current socket, and allocates a new file descriptor for the socket.  If no 
  pending connections are present on the queue, and the socket is not marked as non-blocking, accept() blocks 
  the caller until a connection is present.  If the socket is marked non-blocking and no pending connections 
  are present on the queue, accept() returns an error as described below.  
  
  The accepted socket may not be used to accept more connections.  The original socket remains open.
   <div class="cite"><span class="hint">return</span> <span>TLSSocket</span></div>



{:#_TLSSocket_close} **close**()
: Closes the socket
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_TLSSocket_shutdown} **shutdown**()
: The shutdown() call causes all or part of a full-duplex connection on the socket associated with 
  socket to be shut down.
  
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_TLSSocket_set_option} **set_option**(_option_: int, _value_: any)
: Sets the options of the current socket.
  > - Only `SO_` variables are valid option types
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_TLSSocket_get_option} **get_option**(_option_: int)
: Gets the options set on the current socket
   <div class="cite"><span class="hint">return</span> <span>any</span></div>



{:#_TLSSocket_set_blocking} **set_blocking**(_mode_: bool)
: Sets if the socket should operate in blocking or non-blocking mode. `true` for blocking 
  (default) and `false` for non-blocking.


{:#_TLSSocket_info} **info**()
: Returns a dictionary containing the address, port and family of the current socket or an 
  empty dictionary if the socket information could not be retrieved.
   <div class="cite"><span class="hint">return</span> <span>dictionary</span></div>



{:#_TLSSocket_get_socket} **get_socket**()
: returns the underlying Socket instance
   <div class="cite"><span class="hint">return</span> <span>Socket</span></div>



{:#_TLSSocket_get_context} **get_context**()
: returns the underlying SSLContext instance
   <div class="cite"><span class="hint">return</span> <span>SSLContext</span></div>




^


### _class_ BIO 
---

SSL Binary Input/Output


#### class BIO methods
---

{:#_BIO_BIO} **BIO**(_method_: ptr)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>

  > - method must be a valid SSL BIO_* method


{:#_BIO_set_ssl} **set_ssl**(_ssl_: SSL [, _option_: int])
: sets the working SSL instance for this BIO
  > - option must be one of the BIO constants if given.
  > - default option = BIO_NOCLOSE


{:#_BIO_set_conn_hostname} **set_conn_hostname**(_name_: string)
: sets the hostname for the current connected BIO socket


{:#_BIO_set_accept_tname} **set_accept_name**(_name_: string)
: sets the address name for the current accepted BIO socket


{:#_BIO_set_conn_address} **set_conn_address**(_address_: string)
: sets the address for the current connected BIO socket


{:#_BIO_set_conn_port} **set_conn_port**(_port_: int | string)
: sets the port for the current connected BIO socket


{:#_BIO_set_accept_port} **set_accept_port**(_port_: int | string)
: sets the port for the current accepted BIO socket


{:#_BIO_set_conn_family} **set_conn_family**(_family_: int)
: sets the socket family for the current connected BIO socket


{:#_BIO_set_accept_family} **set_accept_family**(_family_: int)
: sets the socket family for the current accepted BIO socket


{:#_BIO_get_conn_hostname} **get_conn_hostname**()
: returns the hostname for the current connected BIO socket
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_BIO_get_accept_name} **get_accept_name**()
: returns the hostname for the current accepted BIO socket
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_BIO_get_conn_address} **get_conn_address**()
: returns the address for the current connected BIO socket
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_BIO_get_conn_port} **get_conn_port**()
: returns the port for the current connected BIO socket
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_BIO_get_accept_port} **get_accept_port**()
: returns the port for the current accepted BIO socket
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_BIO_get_conn_family} **get_conn_family**()
: returns the family for the current connected BIO socket
   <div class="cite"><span class="hint">return</span> <span>int</span></div>



{:#_BIO_get_accept_family} **get_accept_family**()
: returns the family for the current accepted BIO socket
   <div class="cite"><span class="hint">return</span> <span>int</span></div>



{:#_BIO_get_fd} **get_fd**()
: returns the current socket file descriptor.
  It returns `-1` on failure or a positive integer on success.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_BIO_set_fd} **set_fd**(_fd_: int [, _opt_: int])
: sets the socket file descriptor for this BIO
   <div class="cite"><span class="hint">default</span> <span>opt = BIO_NOCLOSE</span></div>



{:#_BIO_set_non_blocking} **set_non_blocking**([_b_: bool])
: converts the BIO into a non-blocking I/O stream if b is `true`, otherwise 
  converts it into a blocking stream.
   <div class="cite"><span class="hint">default</span> <span>true</span></div>



{:#_BIO_push} **push**(_b_: BIO)
: it appends b, which may be a single BIO or a chain of BIOs, 
  to the current BIO stack (unless the current pinter is `nil`). 
  It then makes a control call on BIO b and returns it.


{:#_BIO_pop} false
: 


{:#_BIO_write} **write**(_data_: string | bytes)
: writes data to the current I/O stream.
   <div class="cite"><span class="hint">return</span> <span>int representing the total bytes written</span></div>



{:#_BIO_read} **read**([_length_: int])
: reads data off the I/O and returns it
   <div class="cite"><span class="hint">default</span> <span>length = 1024</span></div>

   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_BIO_should_retry} **should_retry**()
: returns `true` if this BIO needs to retry its last operation. 
  `false` otherwise.


{:#_BIO_do_connect} **do_connect**()
: attempts to establish a connection to the host.


{:#_BIO_do_accept} **do_accept**()
: attempts to accept the connected socket.


{:#_BIO_error} **error**([_code_: int])
: returns the last SSL error number
   <div class="cite"><span class="hint">return</span> <span>int</span></div>



{:#_BIO_error_string} **error_string**([_code_: int])
: returns the last SSL error as string
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_BIO_free} **free**()
: frees this BIO and all associated resources


{:#_BIO_get_pointer} **get_pointer**()
: returns the raw OpenSSl BIO pointer
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>




^


### _class_ SSLBIO  < _BIO_
---

SSLBIO is a generic BIO for SSL I/O


#### class SSLBIO methods
---

{:#_SSLBIO_SSLBIO} **ConnectBIO**()
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ ConnectBIO  < _BIO_
---

ConnectBIO is a generic BIO for new secured connections


#### class ConnectBIO methods
---

{:#_ConnectBIO_ConnectBIO} **ConnectBIO**()
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ AcceptedBIO  < _BIO_
---

AcceptedBIO is a generic BIO for accepting new secured 
  connections from a TLS server


#### class AcceptedBIO methods
---

{:#_AcceptedBIO_AcceptedBIO} **AcceptedBIO**()
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ SSLContext 
---

SSL context representation class


#### class SSLContext methods
---

{:#_SSLContext_SSLContext} **SSLContext**(_method_: ptr)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>

  > - method must be a valid SSL method pointer


{:#_SSLContext_set_verify} **set_verify**(_mode_: int)
: sets the verification flags for ctx to be the given mode.
  > - The verification of certificates can be controlled by a set of logically or'ed mode flags.
  > - If the mode is SSL_VERIFY_NONE none of the other flags may be set.


{:#_SSLContext_set_verify_locations} **set_verify_locations**(_locations_: string)
: set default locations for trusted CA certificates


{:#_SSLContext_load_certs} **load_certs**(_cert_file_: string | file, _private_key_file_: string | file)
: loads the given SSL/TLS certificate pairs for the given SSL/TLS context.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_SSLContext_set_ciphers} **set_ciphers**(_ciphers_: string)
: sets the list of allowed ciphers. This list must be colon (:) separated.
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_SSLContext_free} **free**()
: frees this Context and all associated resources


{:#_SSLContext_get_pointer} **get_pointer**()
: returns the raw OpenSSl SSL_CTX pointer
   <div class="cite"><span class="hint">return</span> <span>ptr</span></div>




^


### _class_ TLSContext  < _SSLContext_
---

TLSContext is a specialized Context providing generic TLS support 
  for both client and server mode.


#### class TLSContext methods
---

{:#_TLSContext_TLSContext} **TLSContext**()
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ TLSClientContext  < _SSLContext_
---

TLSClientContext is a specialized Context for supporting TLS clients.


#### class TLSClientContext methods
---

{:#_TLSClientContext_TLSClientContext} **TLSClientContext**()
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ TLSServerContext  < _SSLContext_
---

TLSServerContext is a specialized Context for supporting TLS servers.


#### class TLSServerContext methods
---

{:#_TLSServerContext_TLSServerContext} **TLSServerContext**()
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ SSLv23Context  < _SSLContext_
---

SSLv23Context is a specialized Context providing generic SSLv23 support 
  for both client and server mode.


#### class SSLv23Context methods
---

{:#_SSLv23Context_SSLv23Context} **SSLv23Context**()
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ SSLv23ClientContext  < _SSLContext_
---

SSLv23ClientContext is a specialized Context for supporting SSLv23 clients.


#### class SSLv23ClientContext methods
---

{:#_SSLv23ClientContext_SSLv23ClientContext} **TLSClientContext**()
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ SSLv23ServerContext  < _SSLContext_
---

SSLv23ServerContext is a specialized Context for supporting SSLv23 servers.


#### class SSLv23ServerContext methods
---

{:#_SSLv23ServerContext_SSLv23ServerContext} **SSLv23ServerContext**()
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




