---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: List Files 
parent: Learn by Examples
description: Lists files in the current working directory using the Blade programming language.
---

# List Files 
{: .fs-9 }

Lists files in the current working directory.
{: .fs-6 .fw-300 }

```blade
import os

var is_windows = os.platform == 'windows'

# create the commands
var files_command = is_windows ? 'dir /b' : 'ls'
var cwd_command = is_windows ? 'cd' : 'pwd'
var separator = is_windows ? '\\' : '/'

# run the commands
var files = os.exec(files_command).split('\n')
var cwd = os.exec(cwd_command)

for f in files {
  if f echo '${cwd}${separator}${f}'
}
```