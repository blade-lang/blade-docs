---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Http Server 
parent: Learn by Examples
description: Simple HTTP server simulating Apache's default page
---

# HTTP Server
{: .fs-9 }

Simple HTTP server simulating Apache's default page on port 3000.
{: .fs-6 .fw-300 }

```blade
import http

var server = http.server(3000)
server.on_receive(|req, res| {
  res.write('It works!')
})
server.listen()
```