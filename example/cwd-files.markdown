---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Get files in directory
parent: Learn by Examples
description: Lists the aboslute path of all files in the given path using the Blade programming language.
---

# Advanced LS
{: .fs-9 }

Lists the aboslute path of all files in the given path.
{: .fs-6 .fw-300 }

```blade
import os

var path = os.args.length() > 2 ? os.args[2] : '.'
var files = os.read_dir(path)
var dir = os.real_path(path)

for f in files {
  if f echo '${dir}${os.path_separator}${f}'
}
```
