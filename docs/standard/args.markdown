---
layout: default
title: args
parent: Standard Library
nav_order: 4
permalink: /standard/args.html
---

# args

This module provides functionalities that makes writing command-line 
interfaces easy. A user can define the options and commands available 
in a program and this module can automatically figure out how to parse 
those options and commands out of the CLI arguments. It also provides 
automatic help and usage messages as well as error/warnings generation 
for valid/invalid arguments.

### Example

The below is a simple program that shows a typical use of the module.

```blade
import args

var parser = args.Parser('myprogram')
parser.add_option('name', 'The name of person to call', {type: args.STRING})
parser.add_command('call', 'Make a phone call')
parser.parse()
```

We can simply print help information for the above program if it were saved 
in a file `myprogram.b` as follows.

```sh
$ blade myprogram.b -h 
Usage: myprogram [ [-h] | [--name NAME] ] [COMMAND]

OPTIONS:
  -h, --help                 Show this help message and exit
      --name <value>         The name of person to call

COMMANDS:
  call                       Make a phone call
```

if we change the last line of the program to `echo parser.parse()` so that we 
can see the result of the parsing, the following CLI call will yield the given result.

```terminal
$ blade myprogram.b --name 25
{options: {name: 25}, command: nil}

$ blade myprogram.b call  
{options: {}, command: {name: call, value: nil}}

$ blade myprogram.b call --name 25
{options: {name: 25}, command: {name: call, value: nil}}
```

Calling name without an option will yield the following result/error.

```sh
$ blade myprogram.b --name   
error: Option "name" expects a value
```

You may even get help on a command directly like below:

```sh
$ blade myprogram.b --help call
Usage: myprogram call

  Make a phone call
```



<h2>Properties</h2><hr>

{:#args__NONE} _args._**NONE**
: value type none


^
{:#args__INT} _args._**INT**
: value type integer (allows numbers, but floors them to integers)


^
{:#args__NUMBER} _args._**NUMBER**
: value type number


^
{:#args__BOOL} _args._**BOOL**
: value type boolean (accepts `1` and `0` as well as `true` 
  and `false` as valid values).


^
{:#args__STRING} _args._**STRING**
: value type string


^
{:#args__LIST} _args._**LIST**
: value type for list


^
{:#args__CHOICE} _args._**CHOICE**
: value type enumeration choices.




<h2>Classes</h2><hr>



### _class_ ArgsException  < _Exception_
---

Commandline argument exception.


#### class ArgsException methods
---

{:#_ArgsException_ArgsException} **ArgsException**(_message_: string)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ Parser  < __Optionable_
---

A configurable commandline parser.


#### class Parser properties
---

{:#Parser_Parser_commands} _Parser._**commands**
: A list of commands supported by the parser.


{:#Parser_Parser_indexes} _Parser._**indexes**
: A list of positional values supported by the parser.


#### class Parser methods
---

{:#_Parser_Parser} **Parser**(_name_: string [, _default_help_: bool = true])
:  <div class="cite"><span class="hint">param</span> <span>`name` refers to the name of the cli program.</span></div>

   <div class="cite"><span class="hint">param</span> <span>`default_help` whether to show help when no command or option is matched or not.</span></div>

   <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_Parser_add_option} **add_option**(_name_: string [, _help_: string [, _opts_: dict]])
: adds a support for a new command to the parser.
  
  The `opts` dictionary can contain one or more of:
  
  - `short_name`: A shorter version of the option name parsed via 
  single hyphens (`-`) without the hyphen. For example, short_name `v` 
  will match `-v` in the commandline.
  - `type`: type must be one of the args types and will indicate 
  how the parsed data should be interpreted in the final result.
  - `value`: tells the parser the default value for this option.
  - `choices`: a list of allowed options or a dictionary of allowed 
  options with their respective descriptions.
  
  > - the `choices` option only works for type `CHOICE`.


{:#_Parser_add_command} **add_command**(_name_: string [, _help_: string [, _opts_: dict]])
: adds a support for a new command to the parser.
  
  The `opts` dictionary can contain property `type` and `action`.
  
  - The `type` property a must be one of the args types and will indicate 
  how the parsed data should be interpreted in the final result.
  - The `action` property must be a function.
  
  The `opts` dictionary can contain one or more of:
  
  - `type`: type must be one of the args types and will indicate 
  how the parsed data should be interpreted in the final result.
  - `choices`: a list of allowed options or a dictionary of allowed 
  options with their respective descriptions.
  
  > - the `choices` option only works for type `CHOICE`.


{:#_Parser_add_index} **add_index**(_name_: string [, _help_: string [, _opts_: dict]])
: adds a support for a new positional argument to the parser.
  
  The `opts` dictionary can contain property `type` and `action`.
  
  - The `type` property a must be one of the args types and will indicate 
  how the parsed data should be interpreted in the final result.
  
  The `opts` dictionary can contain one or more of:
  
  - `type`: type must be one of the args types and will indicate 
  how the parsed data should be interpreted in the final result.
  - `value`: tells the parser the default value for this index.
  - `choices`: a list of allowed options or a dictionary of allowed 
  values with their respective descriptions.
  
  > - the `choices` option only works for type `CHOICE`.


{:#_Parser_parse} **parse**()
: Parses the commandline arguments and returns a dictionary of command 
  and options.
  
  For example, parsing the commandline
  `blade test.b install 5 --verbose` may yeild such a result as 
  `{options: {verbose: true}, command: {name: install, value: 5}}`.
  
   <div class="cite"><span class="hint">return</span> <span>dict</span></div>




