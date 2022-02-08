---
layout: default
title: socket
parent: Standard Library
nav_order: 16
permalink: /standard/socket
---

# socket

Provides interface for working with Socket clients
and servers.



<h2>Properties</h2><hr>

{:#socket__IP_ANY} _socket._**IP_ANY**
: The non-designated address used to represent "no particular address"
  (also referred to as "any address")


^
{:#socket__IP_LOCAL} _socket._**IP_LOCAL**
: The loopback address (also known as localhost)




<h2>Functions</h2><hr>

{:#socket__get_address_info} _socket_.**get_address_info**(_address_: number [, _type_: string [, _family_: int]])
: returns ip and name information of a given address
   <div class="cite"><span class="hint">return</span> <span>dictionary</span></div>





<h2>Classes</h2><hr>



### _class_ SocketException  < _Exception_
---

The SocketExceptio class is the general Exception type thrown from sockets


#### class SocketException methods
---

{:#_SocketException_SocketException} **SocketException**(_message_: string)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



^


### _class_ Socket 
---

The Socket class provides interface for working with Socket clients
  and servers.


#### class Socket properties
---

{:#Socket_Socket_host} _Socket._**host**
: This property holds the host bound, to be bound to or connected to by the current socket.
  Whenever a host is not given, the host will default to localhost.


{:#Socket_Socket_port} _Socket._**port**
: The port currently bound or connected to by the socket


{:#Socket_Socket_family} _Socket._**family**
: The socket family (which must be one of the `AF_` variables).
  The default family for the socket is AF_INET


{:#Socket_Socket_type} _Socket._**type**
: The type of socket stream used by the socket.
  The default socket type is `SOCK_STREAM`


{:#Socket_Socket_protocol} _Socket._**protocol**
: The current operating protocol of the socket that controls the 
  underlying behavior of the socket. The default is `IPPROTO_TCP`.


{:#Socket_Socket_id} _Socket._**id**
: The file descriptor id of the current socket on the host machine.


{:#Socket_Socket_is_client} _Socket._**is_client**
: `true` when the socket is a client to a server socket, `false` otherwise.


{:#Socket_Socket_is_bound} _Socket._**is_bound**
: `true` when the socket is bound to a given port on the device, `false` 
  otherwise.


{:#Socket_Socket_is_connected} _Socket._**is_connected**
: `true` when the socket is connected to a server socket, `false` otherwise.


{:#Socket_Socket_is_listening} _Socket._**is_listening**
: `true` when the socket is currently listening on a host device port as a 
  server, `false` otherwise.


{:#Socket_Socket_is_closed} _Socket._**is_closed**
: `true` when the socket is closed, `false` otherwise.


{:#Socket_Socket_is_shutdown} _Socket._**is_shutdown**
: `true` when the socket is shutdown, `false` otherwise.


{:#Socket_Socket_shutdown_reason} _Socket._**shutdown_reason**
: The property holds the reason for which the last `shutdown` operation 
  was called or `-1` if `shutdown` was never requested.


{:#Socket_Socket_send_timeout} _Socket._**send_timeout**
: The amount of time in milliseconds that the socket waits before it 
  terminates a `send` operation. This is equal to the `SO_SNDTIMEO`.


{:#Socket_Socket_receive_timeout} _Socket._**receive_timeout**
: The amount of time in milliseconds that the socket waits before it 
  terminates a `receive` operation. This is equal to the `SO_RCVTIMEO`.


{:#Socket_Socket_is_blocking} _Socket._**is_blocking**
: `true` when the socket is running in a blocking mode, `false` otherwise.


#### class Socket methods
---

{:#_Socket_Socket} **Socket**(_family_: number [, _type_: number, _protocol_: number [, _id_: number]])
:  <div class="cite"><span class="hint">example</span> <span>Socket(AF_INET, SOCK_STREAM, 0)</span></div>

   <div class="cite"><span class="hint">constructor</span> <span></span></div>


{:#_Socket_connect} **connect**(_host_: string, _port_: int [, _timeout_: int])
: Initiates a connection to the given host on the specified port. If host is `nil`, it will 
  connect on to the current hostn specified on the socket.
  
   <div class="cite"><span class="hint">default</span> <span>timeout = 300,000ms (i.e. 300 seconds)</span></div>

   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Socket_bind} **bind**(_port_: int [, _host_: string])
: Binds this socket to the given port on the given host. If host is `nil` or not specified, it will connect 
  on to the current hostn specified on the socket. 
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Socket_send} **send**(_message_: string | file | bytes, _flags_: int)
: Sends the specified message to the socket. When this methods accepts a file as a message, 
  the file is read and the resultant bytes of the file content is streamed to the socket.
  
   <div class="cite"><span class="hint">note</span> <span>the flags parameter is currently redundant and is kept only to remanin compatible with future plans for this method.</span></div>

   <div class="cite"><span class="hint">return</span> <span>number greater than -1 if successful indicating the total number of bytes sent or -1 if it fails.</span></div>



{:#_Socket_receive} **receive**([_length_: int [, _flags_: int]])
: Receives bytes of the given length from the socket. If the length is not given, it default length of 
  -1 indicating that the total available data on the socket stream will be read. 
  If no data is available for read on the socket, the socket will wait to receive data or until the 
  `receive_timeout` which is also equal to the `SO_RCVTIMEO` setting of the socket has elapsed before or 
  until it has received the total number of bytes required (whichever comes first).
  
   <div class="cite"><span class="hint">note</span> <span>the flags parameter is currently redundant and is kept only to remanin compatible with future plans for this method.</span></div>

   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_Socket_listen} **listen**([_queue_length_: int])
: Listen for connections on a socket
  
  This method puts the socket in a state where it is willing to accept incoming connections and creates 
  a queue limit of `queue_length` for incoming connections. If a connection request arrives with 
  the queue full, the client may receive an error with an indication of `ECONNREFUSED`. 
  Alternatively, if the underlying protocol supports retransmission, the request may be ignored 
  so that retries may succeed.
  
  When the `queue_length` is ommited or set to -1, the method will use the default queue limit of 
  the current platform which is usually equal to `SOMAXCONN`.
  
   <div class="cite"><span class="hint">note</span> <span>listen() call applies only to sockets of type `SOCK_STREAM` (which is the default)</span></div>

   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Socket_accept} **accept**()
: Accepts a connection on a socket
  
  This method extracts the first connection request on the queue of pending connections, creates a new socket 
  with the same properties of the current socket, and allocates a new file descriptor for the socket.  If no 
  pending connections are present on the queue, and the socket is not marked as non-blocking, accept() blocks 
  the caller until a connection is present.  If the socket is marked non-blocking and no pending connections 
  are present on the queue, accept() returns an error as described below.  
  
  The accepted socket may not be used to accept more connections.  The original socket socket, remains open.
   <div class="cite"><span class="hint">return</span> <span>Socket</span></div>



{:#_Socket_close} **close**()
: Closes the socket
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Socket_shutdown} **shutdown**([_how_: int])
: The shutdown() call causes all or part of a full-duplex connection on the socket associated with 
  socket to be shut down.  If how is `SHUT_RD`, further receives will be disallowed.  If how is `SHUT_WR`, 
  further sends will be disallowed.  If how is `SHUT_RDWR`, further sends and receives will be disallowed.
  
  When _how_ is not specified, it defaults to `SHUT_RD`.
  
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Socket_set_option} **set_option**(_option_: int, _value_: any)
: Sets the options of the current socket.
   <div class="cite"><span class="hint">note</span> <span>Only `SO_` variables are valid option types</span></div>

   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Socket_get_option} **get_option**(_option_: int)
: Gets the options set on the current socket
   <div class="cite"><span class="hint">return</span> <span>any</span></div>



{:#_Socket_set_blocking} **set_blocking**(_mode_: bool)
: Sets if the socket should operate in blocking or non-blocking mode. `true` for blocking 
  (default) and `false` for non-blocking.


{:#_Socket_info} **info**()
: Returns a dictionary containing the address, port and family of the current socket or an 
  empty dictionary if the socket information could not be retrieved.
   <div class="cite"><span class="hint">return</span> <span>dictionary</span></div>




