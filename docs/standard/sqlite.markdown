---
layout: default
title: sqlite
parent: Standard Library
nav_order: 20
permalink: /standard/sqlite
---

# sqlite

provides functionalities for interacting with sqlite3 database



<h2>Functions</h2><hr>

{:#sqlite__open} _sqlite_.**open**([_path_: string])
: returns an handle to a sqlite3 database
   <div class="cite"><span class="hint">return</span> <span>SQLite3</span></div>





<h2>Classes</h2><hr>



### _class_ SQLite3 
---

SQLite3 management class


#### class SQLite3 properties
---

{:#SQLite3_SQLite3_path} _SQLite3._**path**
: the path to the SQLite3 file
   <div class="cite"><span class="hint">default</span> <span>= :memory:</span></div>



#### class SQLite3 methods
---

{:#_SQLite3_SQLite3} **SQLite3**(_path_: string)
: > - the database doesn't need to exist.
   <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_SQLite3_open} **open**()
: opens the handle to a database file


{:#_SQLite3_close} **close**()
: closes the handle to the database and return `true` if successfully
  closed or `false` otherwise.
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



{:#_SQLite3_exec} **exec**(_query_: string)
: executes a query string without and returns `true` if the
  query was executed or `false` otherwise.
  
  > - this method does not return a query result
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



{:#_SQLite3_last_insert_id} **last_insert_id**()
: the id of the last insert operation.
  returns: 
  * -1 if the last insert failed, 
  * 0 if no insert statement has been executed or 
  * a number greater than 0 if it succeeded
   <div class="cite"><span class="hint">returns</span> <span>number</span></div>



{:#_SQLite3_query} **query**(_sql_: string [, _params_: list | dict])
: executes and sql query and returns the result of the execution
  > - pass a list as _params_ if you have unnamed parameterized queries.
  
   <div class="cite"><span class="hint">example</span> <span>`sqlite.query('SELECT * FROM users WHERE id = ? AND name = ?', [3, 'James'])`</span></div>

  > - pass a dictionary as _params_ if you use named paramters
  
   <div class="cite"><span class="hint">example</span> <span></span></div>

  <pre>
  sqlite.query(
    'SELECT * FROM user WHERE id = :id AND name = :name', 
    {':id': 1, ':name': 'James'}
  )
  </pre>


{:#_SQLite3_fetch} **fetch**(_sql_: string [, _params_: list | dict])
: runs an SQL query and returns the result as a list of dictionaries.
  
  > - if the result is empty or the query is not a SELECT, it returns an empty list



^


### _class_ SQLiteException  < _Exception_
---

General Exception for SQLite


#### class SQLiteException methods
---

{:#_SQLiteException_SQLiteException} false
: 



^


### _class_ SQLite3Cursor 
---

A cursor for navigation through sql results


#### class SQLite3Cursor properties
---

{:#SQLite3Cursor_SQLite3Cursor_connection} _SQLite3Cursor._**connection**
: The SQLite3 connection that owns this cursor


{:#SQLite3Cursor_SQLite3Cursor_row_count} _SQLite3Cursor._**row_count**
: The number of rows in the cursor
   <div class="cite"><span class="hint">readonly</span> <span></span></div>



{:#SQLite3Cursor_SQLite3Cursor_modified_count} _SQLite3Cursor._**modified_count**
: This value hold the number of rows modified, inserted or deleted by the the query that 
  owns this cursor provided the query is one of INSERT, UPDATE or DELETE statement.
  Executing any other type of SQL statement does not change this value from 0.
  
  Only changes made directly by the INSERT, UPDATE or DELETE statement are considered 
  - auxiliary changes caused by triggers, foreign key actions or REPLACE constraint 
  resolution are not counted.
  
  Changes to a view that are intercepted by INSTEAD OF triggers are not counted. 
  The value returned by `modified_count` immediately after an INSERT, UPDATE or DELETE 
  statement run on a view is always zero. Only changes made to real tables are counted.
  
  > - If a separate thread makes changes on the same database connection at the exact time the original query was also making a change, the result of this value will become undependable.
  
   <div class="cite"><span class="hint">readonly</span> <span></span></div>



{:#SQLite3Cursor_SQLite3Cursor_columns} _SQLite3Cursor._**columns**
: the columns in the result set
   <div class="cite"><span class="hint">readonly</span> <span></span></div>



#### class SQLite3Cursor methods
---

{:#_SQLite3Cursor_SQLite3Cursor} **SQLite3Cursor**(_db_: SQLite3, _cursor_: pointer)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_SQLite3Cursor_close} **close**()
: closes the cursor and prevents further reading


{:#_SQLite3Cursor_has_next} **has_next**()
: returns true if there are more rows in the result set not yet retrieved.
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



{:#_SQLite3Cursor_get} **get**(_index_: number | string)
: returns the value of the column matching the index in the current 
  result set.
  
  > - if index is a number, it returns the value in the column at the given index. 
  > - that index must be lower than columns.length() in this case.
  > - if index is a string, it returns the value in the column with the given name.
   <div class="cite"><span class="hint">throws</span> <span>SQLiteException if no matching column can be found.</span></div>




