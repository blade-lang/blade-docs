---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Link Replace 
parent: Learn by Examples
description: Replaces links in a text with HTML anchor tags using the Blade programming language.
---

# Link Replace
{: .fs-9 }

Replaces links in a text with HTML anchor tags.
{: .fs-6 .fw-300 }

```blade
var data = 'http://www.google.com
http://google.com

<p>http://www.google.com<p>

this is a normal sentence. let\'s hope it\'s ok.

<a href="http://www.google.com">www.google.com</a>'

echo data.replace(
  '/((?<!href=")https?:\/\/[^\s\<]+)/',
  '<a href="$0" target="_blank">$0</a>'
)
```