Jekyll::Hooks.register :site, :pre_render do |site|
  puts "Adding custom Blade lexer plugin"
  require "rouge"

  # ...
  class Blade < Rouge::RegexLexer
    title "Blade"
    desc "The Blade programming language (bladelang.com)"

    tag 'blade'
    filenames '*.b'
    mimetypes 'text/x-blade'

    def self.detect?(text)
      return 1 if text.shebang?('blade')
    end

    keywords = %w(
      as assert break catch class continue default def die echo else finally
      for if import in iter return parent self try using when while
    )

    declarations = %w(
      def class static var
    )

    imports = %w(import)

    builtins = %w(
      print hex int is_bool is_string is_list is_dict is_number
      is_instance is_iterable is_class is_function id bin abs
      bytes file chr delprop getprop hashprop is_Callable is_object
      is_bytes is_file max microtime time min oct rand ord setprop
      sum to_int to_bool to_list to_number to_string typeof
    )

    id = /[a-zA-Z_]\w*/

    state :root do
      rule %r(^
        (\s*(?:[a-zA-Z_][a-zA-Z\d_.\[\]]*\s+)+?) # return arguments
        ([a-zA-Z_]\w*)                           # method name
        (\s*)(\()                                # signature start
      )mx do |m|
        # TODO: do this better, this shouldn't need a delegation
        delegate Blade, m[1]
        token Name::Function, m[2]
        token Text, m[3]
        token Punctuation, m[4]
      end

      rule %r/\s+/, Text
      rule %r(#.*?$), Comment::Single
      rule %r(/\*), Comment::Multiline, :comment
      rule %r/"/, Str, :dqs
      rule %r/'/, Str, :sqs
      rule %r/r"[^"]*"/, Str::Double
      rule %r/r'[^']*'/, Str::Double
      rule %r/(?:#{builtins.join('|')})\b/i, Name::Builtin
      rule %r/@#{id}/, Name::Decorator
      rule %r/#{id}(?=\()/, Name::Function
      rule %r/(?:#{keywords.join('|')})\b/, Keyword
      rule %r/(?:#{declarations.join('|')})\b/, Keyword::Declaration
      rule %r/(?:true|false|nil)\b/, Keyword::Constant
      rule %r/(?:class|def)\b/, Keyword::Declaration, :class
      rule %r/(?:#{imports.join('|')})\b/, Keyword::Namespace
      rule %r/(\.)(#{id})/ do
        groups Operator, Name::Attribute
      end

      rule %r/#{id}:/, Name::Label
      rule %r/\$?#{id}/, Name
      rule %r/[~^*!%&\[\](){}<>\|+=:;,.\/?-]/, Operator
      rule %r/[0-9][0-9]*\.[0-9]+([eE][0-9]+)?[fd]?/, Num::Float
      rule %r/0x[0-9a-fA-F]+/i, Num::Hex
      rule %r/0c[0-7][0-7]*/i, Num::Oct
      rule %r/0b[01][01]*/i, Num::Bin
      rule %r/[0-9]+/, Num::Integer

      rule %r/"/, Str::Delimiter, :dq
      rule %r/'/, Str::Delimiter, :sq
      rule %r/:/, Punctuation
    end

    # nested commenting
    state :comment do
      rule %r([^/\*]+), Comment::Multiline
      rule %r(/\*), Comment::Multiline, :comment
      rule %r(\*/), Comment::Multiline, :pop!
      rule %r([*/]), Comment::Multiline
    end

    state :class do
      rule %r/\s+/m, Text
      rule id, Name::Class, :pop!
    end

    state :dqs do
      rule %r/"/, Str, :pop!
      rule %r/[^\\\$"]+/, Str
      mixin :string
    end

    state :sqs do
      rule %r/'/, Str, :pop!
      rule %r/[^\\\$']+/, Str
      mixin :string
    end

    state :import do
      rule %r//, Operator, :pop!
      rule %r/(?:show|hide)\b/, Keyword::Declaration
      mixin :root
    end

    state :string do
      mixin :interpolation
      rule %r/\\[abfnrtv0$xuU\"\'\\]/, Str::Escape
    end

    state :interpolation do
      rule %r/\$#{id}/, Str::Interpol
      rule %r/\$\{[^\}]+\}/, Str::Interpol
    end
  end
end