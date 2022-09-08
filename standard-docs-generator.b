import os
import ast
import json
import colors

class ParsedFile {
  var classes = []
  var functions  = []
  var variables = []
}

class ParsedClass {
  var methods = []
  var properties = []
  var doc
}

def cite(str) {
  return (str + '\n').
            replace('/\\@note/', '> -').
            replace('/\\@([a-zA-Z_]+)[ ]*([^\\n]*)/', 
              ' <div class="cite"><span class="hint">$1</span> <span>$2</span></div>\n')
}

def get_class_docs(module, klass) {
  var result = "\n\n### _class_ ${klass.name} ${klass.superclass ? ' < _${klass.superclass}_' : nil}\n---\n\n${klass.doc}\n\n"

  if klass.properties {
    var props = []

    for prop in klass.properties {
      if prop.doc {
        props.append(get_var_docs(klass.name, klass.name, prop, prop.is_static))
      }
    }


    if props {
      result += '\n#### class ${klass.name} properties\n---\n\n'
      result += '\n\n'.join(props) + '\n'
    }
  }

  if klass.methods {
    var methods = []

    for method in klass.methods {
      if method.doc {
        methods.append(get_function_docs(nil, klass.name, method, method.is_static))
      }
    }

    if methods {
      result += '\n#### class ${klass.name} methods\n---\n\n'
      result += '\n\n'.join(methods) + '\n'
    }
  }

  return result
}

def get_function_docs(module, klass, function, is_static) {
  var line1 = function.doc.match('/^[^)]+\)/')

  if line1{
    line1 = line1[0].
          replace('/([a-zA-Z0-9_]+):/', '_$1_:').
          replace('/([a-zA-Z0-9_]+)\(/', is_static ? '_static_ **$1**(' : '**$1**(')
  }

  var body = cite('\n'.join(function.doc.split('\n')[1,]).trim())

  return "{:#${module}_${klass}_${function.name}} ${module ? '_${module}_.' : nil}${line1}\n: ${body}"
}

def get_var_docs(module, klass, var_data, is_static) {
  return '{:#${module}_${klass}_${var_data.name}}${is_static ? " _static_" : nil} _${module ? module + '.' : nil}_**${var_data.name}**\n: ${cite(var_data.doc)}'
}

def get_docs(module, parse_list) {
  var result = ParsedFile()

  for parse_item in parse_list {
    # we are only interested in declarations
    if instance_of(parse_item, ast.Decl) {

      if(parse_item.doc) {

        if instance_of(parse_item, ast.VarDecl) {
          if !parse_item.name.starts_with('_') and parse_item.doc
            result.variables.append(get_var_docs(module, nil, parse_item))
        } else if instance_of(parse_item, ast.FunctionDecl) {
          if !parse_item.name.starts_with('_') and! parse_item.name.starts_with('@') and parse_item.doc
            result.functions.append(get_function_docs(module, nil, parse_item))
        } else if instance_of(parse_item, ast.ClassDecl) { 
          if !parse_item.name.starts_with('_') and parse_item.doc
            result.classes.append(get_class_docs(module, parse_item))
        }
      }
    }
  }

  return result
}

def get_module_desc(f) {
  var lines = file(f).read().split('\n')

  var result = ''

  var i = 0
  while lines[i].starts_with('#') {
    if !lines[i].match('/^\\s*#\\s*@(module|copyright)/') {
      result += lines[i].replace('/^#\\s?/', '') + '\n'
    }
    i++
  }

  return result.trim()
}

def create_module_doc(index_file, i, module_name, docs) {
  var module_description = get_module_desc(index_file)
  # var module_description = ''

  var content = '---\n'+
  'layout: default\n'+
  'title: ${module_name}\n'+
  'parent: Standard Library\n'+
  'nav_order: ${i}\n'+
  'permalink: /standard/${module_name}\n'+
  '---\n\n# ${module_name}\n\n${module_description}\n\n'

  if docs.variables {
    content += '\n\n<h2>Properties</h2><hr>\n\n'
    content += '\n\n^\n'.join(docs.variables.compact()) + '\n\n'
  }

  if docs.functions {
    content += '\n\n<h2>Functions</h2><hr>\n\n'
    content += '\n\n^\n'.join(docs.functions.compact()) + '\n\n'
  }

  if docs.classes {
    content += '\n\n<h2>Classes</h2><hr>\n\n'
    content += '\n\n^\n'.join(docs.classes.compact()) + '\n\n'
  }

  file('docs/standard/${module_name}.markdown', 'w').write(content)
}

def process_line(source) {
  echo colors.text('  Processing ${source}', colors.style.italic)
}

if os.args.length() < 3 {
  echo 'Please specify source path'
} else {
  var source_dir = os.args[2]

  var sources = os.read_dir(source_dir)
  sources.sort()

  echo colors.text('Started generating Blade standard library documentation...', colors.text_color.blue)
  echo ''

  iter var i = 0; i < sources.length(); i++ {
    var source = sources[i], module_name = source.replace('/\\.b/', '')

    # ignore the http2 module.
    if source.starts_with('http2') or source.starts_with('zip2') 
      continue

    if source.ends_with('.b') and !source.starts_with('_') { # it's a file
      process_line('${source_dir}/${source}')

      var parse_list = ast.parse(file('${source_dir}/${source}').read())
      create_module_doc('${source_dir}/${source}', i + 1, module_name, get_docs(module_name, parse_list))
    } else {  # it's a directory
      if !source.starts_with('.') and !source.starts_with('_') {
        process_line('${source_dir}/${source}')

        var parsed = []

        for f in os.read_dir('${source_dir}/${source}') {
          if !f.starts_with('.') and !f.starts_with('_') {
            process_line('${source_dir}/${source}/${f}')

            parsed.append(ast.parse(file('${source_dir}/${source}/${f}').read())) 
          } 
        }

        var parse_list = []

        for p in parsed {
          for j in p {
            parse_list.append(j)
          }
        }

        create_module_doc('${source_dir}/${source}/index.b', i + 1, module_name, get_docs(module_name, parse_list))
      }
    }
  }

  echo ''
  echo colors.text(colors.text('Successfully generated Blade standard library documentation!', colors.text_color.green), colors.style.bold)
  echo ''
}
