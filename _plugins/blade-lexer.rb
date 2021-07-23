Jekyll::Hooks.register :site, :pre_render do |site|
  puts "Adding custom Blade lexer based on Dart lexer"
  require "rouge"

  # ...
  class BladeLexer < Rouge::RegexLexer
    title "Blade"
    desc "The Blade programming language (bladelang.com)"

    tag 'blade'
    filenames '*.b'
    mimetypes 'text/x-blade'

    keywords = %w(
      as assert break catch class continue default def die echo else finally
      for if import in iter return parent self try using when while
    )

    declarations = %w(
      def class static var
    )

    imports = %w(import)

    id = /[a-zA-Z_]\w*/

    state :root do
      rule %r(^
        (\s*(?:[a-zA-Z_][a-zA-Z\d_.\[\]]*\s+)+?) # return arguments
        ([a-zA-Z_]\w*)                           # method name
        (\s*)(\()                                # signature start
      )mx do |m|
        # TODO: do this better, this shouldn't need a delegation
        delegate Dart, m[1]
        token Name::Function, m[2]
        token Text, m[3]
        token Punctuation, m[4]
      end

      rule %r/\s+/, Text
      rule %r(#.*?$), Comment::Single
      rule %r(/\*.*?\*/)m, Comment::Multiline
      rule %r/"/, Str, :dqs
      rule %r/'/, Str, :sqs
      rule %r/r"[^"]*"/, Str::Other
      rule %r/r'[^']*'/, Str::Other
      rule %r/##{id}*/i, Str::Symbol
      rule %r/@#{id}/, Name::Decorator
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
      rule %r/\d*\.\d+([eE]\-?\d+)?/, Num::Float
      rule %r/0x[\da-fA-F]+/, Num::Hex
      rule %r/\d+L?/, Num::Integer
      rule %r/\n/, Text
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
      rule %r/\\[nrt\"\'\\]/, Str::Escape
    end

    state :interpolation do
      rule %r/\$#{id}/, Str::Interpol
      rule %r/\$\{[^\}]+\}/, Str::Interpol
    end
  end
end