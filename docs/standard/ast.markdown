---
layout: default
title: ast
parent: Standard Library
nav_order: 5
permalink: /standard/ast
---

# ast

Provides interface for parsing Blade code into Abstract Syntax Trees



<h2>Properties</h2><hr>

{:#ast__NEWLINE} _ast._**NEWLINE**
: newline token


^
{:#ast__LPAREN} _ast._**LPAREN**
: left parenthesis (`(`) token


^
{:#ast__RPAREN} _ast._**RPAREN**
: right parenthesis (`)`) token


^
{:#ast__LBRACKET} _ast._**LBRACKET**
: left bracket (`[`) token


^
{:#ast__RBRACKET} _ast._**RBRACKET**
: right bracket (`]`) token


^
{:#ast__LBRACE} _ast._**LBRACE**
: left brace (`{`) token


^
{:#ast__RBRACE} _ast._**RBRACE**
: right brace (`}`) token


^
{:#ast__SEMICOLON} _ast._**SEMICOLON**
: semicolon (`;`) token


^
{:#ast__COMMA} _ast._**COMMA**
: comma (`,`) token


^
{:#ast__BACKSLASH} _ast._**BACKSLASH**
: backslash (`\`) token


^
{:#ast__BANG} _ast._**BANG**
: not (`!`) token


^
{:#ast__BANG_EQ} _ast._**BANG_EQ**
: not equal (`!=`) token


^
{:#ast__COLON} _ast._**COLON**
: colon (`:`) token


^
{:#ast__AT} _ast._**AT**
: at (`@`) token


^
{:#ast__DOT} _ast._**DOT**
: dot (`.`) token


^
{:#ast__RANGE} _ast._**RANGE**
: range (`..`) token


^
{:#ast__TRI_DOT} _ast._**TRI_DOT**
: tridot (`...`) token


^
{:#ast__PLUS} _ast._**PLUS**
: plus (`+`) token


^
{:#ast__PLUS_EQ} _ast._**PLUS_EQ**
: plus equal (`+=`) token


^
{:#ast__INCREMENT} _ast._**INCREMENT**
: increment (`++`) token


^
{:#ast__MINUS} _ast._**MINUS**
: minus (`-`) token


^
{:#ast__MINUS_EQ} _ast._**MINUS_EQ**
: minus equal (`-=`) token


^
{:#ast__DECREMENT} _ast._**DECREMENT**
: decrement (`--`) token


^
{:#ast__MULTIPLY} _ast._**MULTIPLY**
: multiply (`*`) token


^
{:#ast__MULTIPLY_EQ} _ast._**MULTIPLY_EQ**
: multiply equal (`*=`) token


^
{:#ast__POW} _ast._**POW**
: pow (`**`) token


^
{:#ast__POW_EQ} _ast._**POW_EQ**
: pow equal (`**=`) token


^
{:#ast__DIVIDE} _ast._**DIVIDE**
: divide (`/`) token


^
{:#ast__DIVIDE_EQ} _ast._**DIVIDE_EQ**
: divide equal (`/=`) token


^
{:#ast__FLOOR} _ast._**FLOOR**
: floor division (`//`) token


^
{:#ast__FLOOR_EQ} _ast._**FLOOR_EQ**
: floor divide equal (`//=`) token


^
{:#ast__EQUAL} _ast._**EQUAL**
: assignment (`=`) token


^
{:#ast__EQUAL_EQ} _ast._**EQUAL_EQ**
: equality (`==`) token


^
{:#ast__LESS} _ast._**LESS**
: less than (`<`) token


^
{:#ast__LESS_EQ} _ast._**LESS_EQ**
: less than or equal (`<=`) token


^
{:#ast__LSHIFT} _ast._**LSHIFT**
: left shift (`<<`) token


^
{:#ast__LSHIFT_EQ} _ast._**LSHIFT_EQ**
: left shift equal (`<<=`) token


^
{:#ast__GREATER} _ast._**GREATER**
: greater than (`>`) token


^
{:#ast__GREATER_EQ} _ast._**GREATER_EQ**
: greather than or equal (`>=`) token


^
{:#ast__RSHIFT} _ast._**RSHIFT**
: right shift (`>>`) token


^
{:#ast__RSHIFT_EQ} _ast._**RSHIFT_EQ**
: right shift equal (`>>=`) token


^
{:#ast__PERCENT} _ast._**PERCENT**
: modulous (`%`) token


^
{:#ast__PERCENT_EQ} _ast._**PERCENT_EQ**
: modulous equal (`%=`) token


^
{:#ast__AMP} _ast._**AMP**
: ampersand (`&`) token


^
{:#ast__AMP_EQ} _ast._**AMP_EQ**
: and equal (`&=`) token


^
{:#ast__BAR} _ast._**BAR**
: bar (`|`) token


^
{:#ast__BAR_EQ} _ast._**BAR_EQ**
: bar equal (`|=`) token


^
{:#ast__TILDE} _ast._**TILDE**
: tilde/not (`~`) token


^
{:#ast__TILDE_EQ} _ast._**TILDE_EQ**
: tilde equal (`~=`) token


^
{:#ast__XOR} _ast._**XOR**
: exclusive or (`^`) token


^
{:#ast__XOR_EQ} _ast._**XOR_EQ**
: exclusive or equal (`^=`) token


^
{:#ast__QUESTION} _ast._**QUESTION**
: question (`?`) token


^
{:#ast__AND} _ast._**AND**
: and token


^
{:#ast__AS} _ast._**AS**
: as token


^
{:#ast__ASSERT} _ast._**ASSERT**
: assert token


^
{:#ast__BREAK} _ast._**BREAK**
: break token


^
{:#ast__CATCH} _ast._**CATCH**
: catch token


^
{:#ast__CLASS} _ast._**CLASS**
: class token


^
{:#ast__CONTINUE} _ast._**CONTINUE**
: continue token


^
{:#ast__DEF} _ast._**DEF**
: def token


^
{:#ast__DEFAULT} _ast._**DEFAULT**
: default token


^
{:#ast__DIE} _ast._**DIE**
: die token


^
{:#ast__ECHO} _ast._**ECHO**
: echo token


^
{:#ast__ELSE} _ast._**ELSE**
: else token


^
{:#ast__FALSE} _ast._**FALSE**
: false token


^
{:#ast__FINALLY} _ast._**FINALLY**
: finally token


^
{:#ast__FOR} _ast._**FOR**
: for token


^
{:#ast__IF} _ast._**IF**
: if token


^
{:#ast__IMPORT} _ast._**IMPORT**
: import token


^
{:#ast__IN} _ast._**IN**
: in token


^
{:#ast__ITER} _ast._**ITER**
: iter token


^
{:#ast__NIL} _ast._**NIL**
: nil token


^
{:#ast__OR} _ast._**OR**
: or token


^
{:#ast__PARENT} _ast._**PARENT**
: parent token


^
{:#ast__RETURN} _ast._**RETURN**
: return token


^
{:#ast__SELF} _ast._**SELF**
: self token


^
{:#ast__STATIC} _ast._**STATIC**
: static token


^
{:#ast__TRUE} _ast._**TRUE**
: true token


^
{:#ast__TRY} _ast._**TRY**
: try token


^
{:#ast__USING} _ast._**USING**
: using token


^
{:#ast__VAR} _ast._**VAR**
: var token


^
{:#ast__WHEN} _ast._**WHEN**
: when token


^
{:#ast__WHILE} _ast._**WHILE**
: while token


^
{:#ast__LITERAL} _ast._**LITERAL**
: string literal token


^
{:#ast__REG_NUMBER} _ast._**REG_NUMBER**
: regular number token


^
{:#ast__BIN_NUMBER} _ast._**BIN_NUMBER**
: binary number token


^
{:#ast__OCT_NUMBER} _ast._**OCT_NUMBER**
: octal number token


^
{:#ast__HEX_NUMBER} _ast._**HEX_NUMBER**
: hexadecimal number token


^
{:#ast__IDENTIFIER} _ast._**IDENTIFIER**
: identifier token


^
{:#ast__DECORATOR} _ast._**DECORATOR**
: decorator token


^
{:#ast__INTERPOLATION} _ast._**INTERPOLATION**
: interpolation token


^
{:#ast__COMMENT} _ast._**COMMENT**
: comment token


^
{:#ast__DOC} _ast._**DOC**
: doc block token


^
{:#ast__EOF} _ast._**EOF**
: eof token


^
{:#ast__ERROR} _ast._**ERROR**
: error token


^
{:#ast__EMPTY} _ast._**EMPTY**
: empty token




<h2>Functions</h2><hr>

{:#ast__parse} _ast_.**parse**(_source_: string)
: parses a given source code and outputs Blade AST objects.
   <div class="cite"><span class="hint">return</span> <span>ParseResult</span></div>



^
{:#ast__json} _ast_.**json**(_source_: string)
: parses the give source code and outputs a JSON 
  representation of it's AST structure.
   <div class="cite"><span class="hint">return</span> <span>string</span></div>





<h2>Classes</h2><hr>



### _class_ ParseResult 
---

Represents the result of an ast parse operation
  @serializable
  @iterable


#### class ParseResult methods
---

{:#_ParseResult_append} **append**(_item_: any)
: adds a new item to the parse result



^


### _class_ Scanner 
---

Blade source code scanner


#### class Scanner properties
---

{:#Scanner_Scanner_has_error} _Scanner._**has_error**
: reports if an error was encountered in the scaner


#### class Scanner methods
---

{:#_Scanner_Scanner} **Scanner**(_source_: string)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_Scanner_scan} **scan**()
: scans the source and returns a list of tokens
   <div class="cite"><span class="hint">return</span> <span>list[Token]</span></div>




^


### _class_ Token 
---

Blade source code token
  @serializable
  @printable


#### class Token methods
---

{:#_Token_Token} **Token**(_type_: number, _literal_: string, _line_: number)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ ParseException  < _Exception_
---

Exception raised for errors during parsing


#### class ParseException methods
---

{:#_ParseException_ParseException} **ParseException**(_token_: Token, _message_: string)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ Stmt 
---

base Stmt class



^


### _class_ EchoStmt  < _Stmt_
---

Echo Stmt representation
  @serializable


#### class EchoStmt methods
---

{:#_EchoStmt_EchoStmt} **EchoStmt**(value)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ ExprStmt  < _Stmt_
---

Expr Stmt representation
  @serializable


#### class ExprStmt methods
---

{:#_ExprStmt_ExprStmt} **ExprStmt**(expr)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ IfStmt  < _Stmt_
---

If Stmt representation
  @serializable


#### class IfStmt methods
---

{:#_IfStmt_IfStmt} **IfStmt**(condition, truth, falsy)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ IterStmt  < _Stmt_
---

Iter Stmt representation
  @serializable


#### class IterStmt methods
---

{:#_IterStmt_IterStmt} **IterStmt**(declaration, condition, iterator, body)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ WhileStmt  < _Stmt_
---

While Stmt representation
  @serializable


#### class WhileStmt methods
---

{:#_WhileStmt_WhileStmt} **WhileStmt**(condition, body)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ ForStmt  < _Stmt_
---

For Stmt representation
  @serializable


#### class ForStmt methods
---

{:#_ForStmt_ForStmt} **ForStmt**(vars, iterable, body)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ ContinueStmt  < _Stmt_
---

Continue Stmt representation
  @serializable



^


### _class_ BreakStmt  < _Stmt_
---

Break Stmt representation
  @serializable



^


### _class_ DieStmt  < _Stmt_
---

Die Stmt representation
  @serializable


#### class DieStmt methods
---

{:#_DieStmt_DieStmt} **DieStmt**(exception)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ ReturnStmt  < _Stmt_
---

Return Stmt representation
  @serializable


#### class ReturnStmt methods
---

{:#_ReturnStmt_ReturnStmt} **ReturnStmt**(value)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ AssertStmt  < _Stmt_
---

Assert Stmt representation
  @serializable


#### class AssertStmt methods
---

{:#_AssertStmt_AssertStmt} **AssertStmt**(expr, message)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ UsingStmt  < _Stmt_
---

Using Stmt representation
  @serializable


#### class UsingStmt methods
---

{:#_UsingStmt_UsingStmt} **UsingStmt**(expr, cases, default_case)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ ImportStmt  < _Stmt_
---

Import Stmt representation
  @serializable


#### class ImportStmt methods
---

{:#_ImportStmt_ImportStmt} **ImportStmt**(path, elements)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ CatchStmt  < _Stmt_
---

Catch Stmt representation
  @serializable


#### class CatchStmt methods
---

{:#_CatchStmt_CatchStmt} **CatchStmt**(type, var_name, body)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ FinallyStmt  < _Stmt_
---

Finally Stmt representation
  @serializable


#### class FinallyStmt methods
---

{:#_FinallyStmt_FinallyStmt} **FinallyStmt**(body)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ TryStmt  < _Stmt_
---

Try Stmt representation
  @serializable


#### class TryStmt methods
---

{:#_TryStmt_TryStmt} **TryStmt**(body, catch_stmt, finally_stmt)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ CommentStmt  < _Stmt_
---

Comment Stmt representation
  @serializable


#### class CommentStmt methods
---

{:#_CommentStmt_CommentStmt} **CommentStmt**(data)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ BlockStmt  < _Stmt_
---

Block Stmt representation
  @serializable


#### class BlockStmt methods
---

{:#_BlockStmt_BlockStmt} **BlockStmt**(body)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ AssignStmt  < _Stmt_
---

Assign Stmt representation
  @serializable


#### class AssignStmt methods
---

{:#_AssignStmt_AssignStmt} **AssignStmt**(expr, type, value)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ Defn 
---

base Defn class



^


### _class_ DocDefn  < _Defn_
---

Doc Defn representation
  @serializable


#### class DocDefn methods
---

{:#_DocDefn_DocDefn} **DocDefn**(data)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ Parser 
---

Parses raw Blade tokens and produces an Abstract Syntax Tree


#### class Parser methods
---

{:#_Parser_Parser} **Parser**(_tokens_: []Token)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_Parser_parse} **parse**()
: parses the raw source tokens passed into relevant class and
  outputs a stream of AST objects that can be one of
  Expr (expressions), Stmt (statements) or Decl (declarations)
   <div class="cite"><span class="hint">return</span> <span>ParseResult</span></div>




^


### _class_ Decl 
---

base Decl class



^


### _class_ VarDecl  < _Decl_
---

Var Decl representation
  @serializable


#### class VarDecl methods
---

{:#_VarDecl_VarDecl} **VarDecl**(name, value)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ FunctionDecl  < _Decl_
---

Function Decl representation
  @serializable


#### class FunctionDecl methods
---

{:#_FunctionDecl_FunctionDecl} **FunctionDecl**(name, params, body)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ MethodDecl  < _Decl_
---

Method Decl representation
  @serializable


#### class MethodDecl methods
---

{:#_MethodDecl_MethodDecl} **MethodDecl**(name, params, body, is_static)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ PropertyDecl  < _Decl_
---

Property Decl representation
  @serializable


#### class PropertyDecl methods
---

{:#_PropertyDecl_PropertyDecl} **PropertyDecl**(name, value, is_static)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ ClassDecl  < _Decl_
---

Class Decl representation
  @serializable


#### class ClassDecl methods
---

{:#_ClassDecl_ClassDecl} **ClassDecl**(name, superclass, properties, methods)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ Expr 
---

base Expr class



^


### _class_ BinaryExpr  < _Expr_
---

Binary Expr representation
  @serializable


#### class BinaryExpr methods
---

{:#_BinaryExpr_BinaryExpr} **BinaryExpr**(left, op, right)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ GroupExpr  < _Expr_
---

Group Expr representation
  @serializable


#### class GroupExpr methods
---

{:#_GroupExpr_GroupExpr} **GroupExpr**(expression)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ LiteralExpr  < _Expr_
---

Literal Expr representation
  @serializable


#### class LiteralExpr methods
---

{:#_LiteralExpr_LiteralExpr} **LiteralExpr**(value)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ IdentifierExpr  < _Expr_
---

Identifier Expr representation
  @serializable


#### class IdentifierExpr methods
---

{:#_IdentifierExpr_IdentifierExpr} **IdentifierExpr**(value)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ UnaryExpr  < _Expr_
---

Unary Expr representation
  @serializable


#### class UnaryExpr methods
---

{:#_UnaryExpr_UnaryExpr} **UnaryExpr**(op, right)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ ConditionExpr  < _Expr_
---

Condition Expr representation
  @serializable


#### class ConditionExpr methods
---

{:#_ConditionExpr_ConditionExpr} **ConditionExpr**(expr, truth, falsy)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ CallExpr  < _Expr_
---

Call Expr representation
  @serializable


#### class CallExpr methods
---

{:#_CallExpr_CallExpr} **CallExpr**(callee, args)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ GetExpr  < _Expr_
---

Get Expr representation
  @serializable


#### class GetExpr methods
---

{:#_GetExpr_GetExpr} **GetExpr**(expr, name)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ SetExpr  < _Expr_
---

Set Expr representation
  @serializable


#### class SetExpr methods
---

{:#_SetExpr_SetExpr} **SetExpr**(expr, name, value)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ IndexExpr  < _Expr_
---

Index Expr representation
  @serializable


#### class IndexExpr methods
---

{:#_IndexExpr_IndexExpr} **IndexExpr**(args)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ ListExpr  < _Expr_
---

List Expr representation
  @serializable


#### class ListExpr methods
---

{:#_ListExpr_ListExpr} **ListExpr**(items)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ DictExpr  < _Expr_
---

Dict Expr representation
  @serializable


#### class DictExpr methods
---

{:#_DictExpr_DictExpr} **DictExpr**(keys, values)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ InterpolationExpr  < _Expr_
---

Interpolation Expr representation
  @serializable


#### class InterpolationExpr methods
---

{:#_InterpolationExpr_InterpolationExpr} **InterpolationExpr**(data)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




