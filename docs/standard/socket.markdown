---
layout: default
title: socket
parent: Standard Library
nav_order: 22
permalink: /standard/socket
---

# socket

This module provides access to the underlying system socket management 
implementations. It is meant to be used to provide more controlled and 
specific operating system features and for implementing various standard 
and custom network protocols and specifications for which Blade does not 
provide a built-in implementation for.

This module defines a lot of constant that whose value complies with the 
operating system specification and they should be used instead of a finite 
value wherever available as values for these constants can change across 
different OS implementations.

### What's a Socket

Sockets are bidrectional communication medias for information exchange between 
various processes within the same machine or different machines.

There are three important concepts that must important to know when working with 
sockets.

1. `Family`: This refer to the general group of sockets that a specific 
protocol handled by a socket belongs to. This is any of the `AF_` constants.
2. `Types`: The type of communication between the two processes involved. And can 
only be one of `SOCK_STREAM` or `SOCK_DGRAM`.
3. `Protocol`: This is to identify the variant protocol on which one or more 
network protocols are based on. Typically `0` or any of the `IP_` constants.

A simple socket may be instanciated as follows:

```blade
import socket { Socket }
var sock = Socket()
```
> The `{ Socket }` in the import statement means we are only importing the `Socket` 
> class and not the entire `socket` module. Other examples here will skip the assume 
> you are importing just what you need out of the package but will not show the import 
> statement.

The example above instantiates a socket without any arguments, and it is equivalent to:

```blade
Socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)
```

You can establish a connection with another socket with a known address and port 
as follows:

```blade
var socket = Socket()
socket.connect('127.0.0.1', 4000)
```

The above example connects to the process listening at port 4000 on host with IP 
address 127.0.0.1. A connection is a pre-requisite to writing or reading from a socket.

After connecting to a socket, you can read and write data as follows:

```blade
var socket = Socket()
socket.connect('127.0.0.1', 4000)

var message_from_client = socket.receive()
socket.send('You sent: ' + message_from_client)
```

The above example simply replies the client with `You sent: ` + whatever the client 
acutally sent.

Due to resource limitations, its good practice to always ensure to close sockets when 
done with it. Doing this is pretty simple.

```blade
socket.close()
```



<h2>Properties</h2><hr>

{:#socket__SOCK_STREAM} _socket._**SOCK_STREAM**
: stream socket


^
{:#socket__SOCK_DGRAM} _socket._**SOCK_DGRAM**
: datagram socket


^
{:#socket__SOCK_RAW} _socket._**SOCK_RAW**
: raw-protocol interface


^
{:#socket__SOCK_RDM} _socket._**SOCK_RDM**
: reliably-delivered message


^
{:#socket__SOCK_SEQPACKET} _socket._**SOCK_SEQPACKET**
: sequenced packet stream


^
{:#socket__SO_DEBUG} _socket._**SO_DEBUG**
: Turn on debugging info recording


^
{:#socket__SO_ACCEPTCONN} _socket._**SO_ACCEPTCONN**
: Socket has had listen()


^
{:#socket__SO_REUSEADDR} _socket._**SO_REUSEADDR**
: Allow local address reuse


^
{:#socket__SO_KEEPALIVE} _socket._**SO_KEEPALIVE**
: Keep connections alive


^
{:#socket__SO_DONTROUTE} _socket._**SO_DONTROUTE**
: Just use interface addresses


^
{:#socket__SO_BROADCAST} _socket._**SO_BROADCAST**
: Permit sending of broadcast msgs


^
{:#socket__SO_USELOOPBACK} _socket._**SO_USELOOPBACK**
: Bypass hardware when possible


^
{:#socket__SO_LINGER} _socket._**SO_LINGER**
: Linger on close if data present (in ticks)


^
{:#socket__SO_OOBINLINE} _socket._**SO_OOBINLINE**
: Leave received OOB data in line


^
{:#socket__SO_REUSEPORT} _socket._**SO_REUSEPORT**
: Allow local address & port reuse


^
{:#socket__SO_TIMESTAMP} _socket._**SO_TIMESTAMP**
: Timestamp received dgram traffic


^
{:#socket__SO_SNDBUF} _socket._**SO_SNDBUF**
: Send buffer size


^
{:#socket__SO_RCVBUF} _socket._**SO_RCVBUF**
: Receive buffer size


^
{:#socket__SO_SNDLOWAT} _socket._**SO_SNDLOWAT**
: Send low-water mark


^
{:#socket__SO_RCVLOWAT} _socket._**SO_RCVLOWAT**
: Receive low-water mark


^
{:#socket__SO_SNDTIMEO} _socket._**SO_SNDTIMEO**
: Send timeout


^
{:#socket__SO_RCVTIMEO} _socket._**SO_RCVTIMEO**
: Receive timeout


^
{:#socket__SO_ERROR} _socket._**SO_ERROR**
: Get error status and clear


^
{:#socket__SO_TYPE} _socket._**SO_TYPE**
: Get socket type


^
{:#socket__SOL_SOCKET} _socket._**SOL_SOCKET**
: Options for socket level


^
{:#socket__AF_UNSPEC} _socket._**AF_UNSPEC**
: Unspecified


^
{:#socket__AF_UNIX} _socket._**AF_UNIX**
: Local to host (pipes)


^
{:#socket__AF_LOCAL} _socket._**AF_LOCAL**
: Backward compatibility with AF_UNIX


^
{:#socket__AF_INET} _socket._**AF_INET**
: Internetwork: UDP, TCP, etc.


^
{:#socket__AF_IMPLINK} _socket._**AF_IMPLINK**
: Arpanet imp addresses


^
{:#socket__AF_PUP} _socket._**AF_PUP**
: PUP protocols: e.g. BSP


^
{:#socket__AF_CHAOS} _socket._**AF_CHAOS**
: MIT CHAOS protocols


^
{:#socket__AF_NS} _socket._**AF_NS**
: XEROX NS protocols


^
{:#socket__AF_ISO} _socket._**AF_ISO**
: ISO protocols


^
{:#socket__AF_OSI} _socket._**AF_OSI**
: ISO protocols (same as AF_ISO)


^
{:#socket__AF_ECMA} _socket._**AF_ECMA**
: European computer manufacturers


^
{:#socket__AF_DATAKIT} _socket._**AF_DATAKIT**
: Datakit protocols


^
{:#socket__AF_CCITT} _socket._**AF_CCITT**
: CCITT protocols, X.25 etc


^
{:#socket__AF_SNA} _socket._**AF_SNA**
: IBM SNA


^
{:#socket__AF_DECnet} _socket._**AF_DECnet**
: DECnet


^
{:#socket__AF_DLI} _socket._**AF_DLI**
: DEC Direct data link interface


^
{:#socket__AF_LAT} _socket._**AF_LAT**
: LAT


^
{:#socket__AF_HYLINK} _socket._**AF_HYLINK**
: NSC Hyperchannel


^
{:#socket__AF_APPLETALK} _socket._**AF_APPLETALK**
: Apple Talk


^
{:#socket__AF_INET6} _socket._**AF_INET6**
: IPv6


^
{:#socket__IPPROTO_IP} _socket._**IPPROTO_IP**
: IPPROTO_IP


^
{:#socket__IPPROTO_ICMP} _socket._**IPPROTO_ICMP**
: IPPROTO_ICMP


^
{:#socket__IPPROTO_IGMP} _socket._**IPPROTO_IGMP**
: IPPROTO_IGMP


^
{:#socket__IPPROTO_IPIP} _socket._**IPPROTO_IPIP**
: IPPROTO_IPIP


^
{:#socket__IPPROTO_TCP} _socket._**IPPROTO_TCP**
: IPPROTO_TCP


^
{:#socket__IPPROTO_EGP} _socket._**IPPROTO_EGP**
: IPPROTO_EGP


^
{:#socket__IPPROTO_PUP} _socket._**IPPROTO_PUP**
: IPPROTO_PUP


^
{:#socket__IPPROTO_UDP} _socket._**IPPROTO_UDP**
: IPPROTO_UDP


^
{:#socket__IPPROTO_IDP} _socket._**IPPROTO_IDP**
: IPPROTO_IDP


^
{:#socket__IPPROTO_TP} _socket._**IPPROTO_TP**
: IPPROTO_TP


^
{:#socket__IPPROTO_DCCP} _socket._**IPPROTO_DCCP**
: IPPROTO_DCCP


^
{:#socket__IPPROTO_IPV6} _socket._**IPPROTO_IPV6**
: IPPROTO_IPV6


^
{:#socket__IPPROTO_RSVP} _socket._**IPPROTO_RSVP**
: IPPROTO_RSVP


^
{:#socket__IPPROTO_GRE} _socket._**IPPROTO_GRE**
: IPPROTO_GRE


^
{:#socket__IPPROTO_ESP} _socket._**IPPROTO_ESP**
: IPPROTO_ESP


^
{:#socket__IPPROTO_AH} _socket._**IPPROTO_AH**
: IPPROTO_AH


^
{:#socket__IPPROTO_MTP} _socket._**IPPROTO_MTP**
: IPPROTO_MTP


^
{:#socket__IPPROTO_BEETPH} _socket._**IPPROTO_BEETPH**
: IPPROTO_BEETPH


^
{:#socket__IPPROTO_ENCAP} _socket._**IPPROTO_ENCAP**
: IPPROTO_ENCAP


^
{:#socket__IPPROTO_PIM} _socket._**IPPROTO_PIM**
: IPPROTO_PIM


^
{:#socket__IPPROTO_COMP} _socket._**IPPROTO_COMP**
: IPPROTO_COMP


^
{:#socket__IPPROTO_SCTP} _socket._**IPPROTO_SCTP**
: IPPROTO_SCTP


^
{:#socket__IPPROTO_UDPLITE} _socket._**IPPROTO_UDPLITE**
: IPPROTO_UDPLITE


^
{:#socket__IPPROTO_MPLS} _socket._**IPPROTO_MPLS**
: IPPROTO_MPLS


^
{:#socket__IPPROTO_RAW} _socket._**IPPROTO_RAW**
: IPPROTO_RAW


^
{:#socket__IPPROTO_MAX} _socket._**IPPROTO_MAX**
: IPPROTO_MAX


^
{:#socket__SHUT_RD} _socket._**SHUT_RD**
: Shut down the reading side


^
{:#socket__SHUT_WR} _socket._**SHUT_WR**
: Shut down the writing side


^
{:#socket__SHUT_RDWR} _socket._**SHUT_RDWR**
: Shut down both sides


^
{:#socket__SOMAXCONN} _socket._**SOMAXCONN**
: Maximum queue length specifiable by listen.


^
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

The SocketException class is the general Exception type thrown from sockets


#### class SocketException methods
---

{:#_SocketException_SocketException} **SocketException**(_message_: string)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ Socket 
---

The Socket class provides interface for working with Socket clients
  and servers.
  @printable


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


{:#Socket_Socket_is_blocking} _Socket._**is_blocking**
: `true` when the socket is running in a blocking mode, `false` otherwise.


{:#Socket_Socket_shutdown_reason} _Socket._**shutdown_reason**
: The property holds the reason for which the last `shutdown` operation 
  was called or `-1` if `shutdown` was never requested.


{:#Socket_Socket_send_timeout} _Socket._**send_timeout**
: The amount of time in milliseconds that the socket waits before it 
  terminates a `send` operation. This is equal to the `SO_SNDTIMEO`.


{:#Socket_Socket_receive_timeout} _Socket._**receive_timeout**
: The amount of time in milliseconds that the socket waits before it 
  terminates a `receive` operation. This is equal to the `SO_RCVTIMEO`.


#### class Socket methods
---

{:#_Socket_Socket} **Socket**(_family_: number [, _type_: number [, _protocol_: number]])
:  <div class="cite"><span class="hint">example</span> <span>Socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)</span></div>

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
  
  > - the flags parameter is currently redundant and is kept only to remanin compatible with future plans for this method.
   <div class="cite"><span class="hint">return</span> <span>number greater than -1 if successful indicating the total number of bytes sent or -1 if it fails.</span></div>



{:#_Socket_receive} **receive**([_length_: int [, _flags_: int]])
: Receives bytes of the given length from the socket. If the length is not given, it default length of 
  -1 indicating that the total available data on the socket stream will be read. 
  If no data is available for read on the socket, the socket will wait to receive data or until the 
  `receive_timeout` which is also equal to the `SO_RCVTIMEO` setting of the socket has elapsed before or 
  until it has received the total number of bytes required (whichever comes first).
  
  > - the flags parameter is currently redundant and is kept only to remanin compatible with future plans for this method.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_Socket_read} **read**([_length_: int])
: Reads bytes of the given length from the socket. If the length is not given, it default length of 
  -1 indicating that the total available data on the socket stream will be read. 
  
  > This method differs from `receive()` in that it does not check for a socket having data to 
  > read or not and will block until data of _length_ have been read or no more data is available for 
  > reading.
  > - Only use this function after a call to `receive()` has succeeded.
   <div class="cite"><span class="hint">default</span> <span>Length = 1024</span></div>

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
  
  > - listen() call applies only to sockets of type `SOCK_STREAM` (which is the default)
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Socket_accept} **accept**()
: Accepts a connection on a socket
  
  This method extracts the first connection request on the queue of pending connections, creates a new socket 
  with the same properties of the current socket, and allocates a new file descriptor for the socket.  If no 
  pending connections are present on the queue, and the socket is not marked as non-blocking, accept() blocks 
  the caller until a connection is present.  If the socket is marked non-blocking and no pending connections 
  are present on the queue, accept() returns an error as described below.  
  
  The accepted socket may not be used to accept more connections.  The original socket remains open.
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
  > - Only `SO_` variables are valid option types
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




