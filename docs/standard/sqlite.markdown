---
layout: default
title: sqlite
parent: Standard Library
nav_order: 24
permalink: /standard/sqlite
---

# sqlite

SQLite is a lightweight disk/memory based database that does not require 
a server or third party applications. It allows users to work with the 
database using its sigtly variant version of the Structured Query Lanaguage. 
For this reason, it is a perfect fit for embeded and highly portable database 
applications. It can be used as a prototyping database from which an application 
can be migrated to a more robust database system such as Oracle. 

This module provides an interface to working with SQLite databases and is 
compartible with SQLite3.

The `open()` function is the entry point to this module and must be called to create 
a valid SQLite3 connection to a valid database. The following example shows how to 
create a connection to a database.

```blade
import sqlite
var con = sqlite.open('test.db')
```

The above code opens a connection to the database file `test.db` in the current directory. 
Any valid file path is acceptable here. You can also open a kind of connection a database 
that is stored completely in virtual memory, allowing you to use SQLite like an in-memory 
database (albeit relational). The following example shows how to open a that make SQLite 
behave like an in-memory database.

```blade
import sqlite
var con = sqlite.open()
```

Once a connection has been established, you can use the connection to run all sorts of 
queries. For example, you can run queries that do not return a result set (for example, 
a `CREATE TABLE` query) using the `exec()` function as shown in the example below.

```blade
# Create a new table
con.exec('CREATE TABLE users (id integer primary key, name text, gender text)')

# Insert data into the table
# This isn't exactly the most optimal way to do it but you get the idea. Right?
con.exec('INSERT INTO users (id, name, gender) VALUES (0, "James", "Male")')
con.exec('INSERT INTO users (id, name, gender) VALUES (1, "Lilith", "Female")')
con.exec('INSERT INTO users (id, name, gender) VALUES (2, "Candy", "Non-Binary")')
```

This function will return `true` if the query was successful or `false` if it failed.

You can retrieve the ID of the last insert query in the above command for example using 
the `last_insert_id()` function. For example,

```blade
con.last_insert_id()
# 2
```

On the other hand, there are two ways to run queries that return a dataset.

### Using the `query()` method. 

This function returns a `SQLite3Cursor` that allows you iterate through the dataset 
and do as you wish with them. For example,

```blade
var result = con.query('SELECT * FROM users')
```

There are two ways to loop through this result set. The first way is to use the `has_next()` 
function. This function automatically moves the cursor to the next datarow in the result set 
and return `true` or `false` when there are no more rows in the result set.

```blade
while result.has_next() {
  var name = result.get(1)
  var gender = result.get(2)
  echo 'Name = ${name}, Gender = ${gender}'
}

# ---- result ----------
Name = James, Gender = Male
Name = Lilith, Gender = Female
Name = Candy, Gender = Non-Binary
```

Once `has_next()` returns true, you'll be able to get the value of the different columns in 
the result run using the `get()` method of the SQLite3Cursor by passing their ordinal position 
as an argument to the function.

Another way to get the result entries in a SQLite3Cursor is obviously using the `for` loop as 
the class implements the _iterable_ decorators (as indicated in the class documentation below). 
For example,

```blade
for row in result {
  echo 'Name = ${row.name}, Gender = ${row.gender}'
}
# ---- result ----------
Name = James, Gender = Male
Name = Lilith, Gender = Female
Name = Candy, Gender = Non-Binary
```

> Much shorter right? Care should be taken though as a few of our tests have shown that for 
> result sets with a large number of columns, the first option (using `while`) might be slightly 
> faster for performace critical applications. However, no realworld dataset has been testd.

### Using the `fetch()` method.

The second way to run queries that return a result set is to use the `fetch()` function. 
Unlike the `query()` function that allows you to lazily access the resultset of a SQL query, 
the `fetch()` function retrieves all results into a dictionary as a flat object. This function 
is useful for returning all the data in the resultset.

For example,

```blade
con.fetch('SELECT * FROM users')

# ---- result ---------
[
  {
    id: 0, 
    name: James, 
    gender: Male
  }, 
  {
    id: 1, 
    name: Lilith, 
    gender: Female
  }, 
  {
    id: 2, 
    name: Candy, 
    gender: Non-Binary
  }
]
```

### Parameterized Queries

This module provides support for parameterized queries and as such offer protection against 
SQL injection. An example of a parameterized query is show below.

```blade
%> con.fetch('SELECT * FROM users WHERE name = ?', [ 'James' ])

# ---- result ---------
[
  {
    id: 0, 
    name: James, 
    gender: Male
  }
]
```

You can also used a dictionary as an argument instead of a list for named parameterized 
queries. When you do this, the order or count of the parameters will not matter. Instead, 
parameters will be matched based on their value in the dictionary. For example,

```blade
con.fetch(
  'select * from users where name = :name and id = :id', 
  {
    ':id': 0, 
    ':name': 'James',
  }
)

# ---- result ---------
[
  {
    id: 0, 
    name: James, 
    gender: Male
  }
]
```

It is also a very good practice to always close your connection once done with it. 
This is really simple.

```blade
con.close()
```

_See below for more info_



<h2>Functions</h2><hr>

{:#sqlite__open} _sqlite_.**open**([_path_: string])
: Returns an handle to a sqlite3 database. If _path_ is not given, 
  it will create an in-memory sqlite database.
   <div class="cite"><span class="hint">return</span> <span>SQLite3</span></div>





<h2>Classes</h2><hr>



### _class_ SQLite3 
---

SQLite3 management class


#### class SQLite3 properties
---

{:#SQLite3_SQLite3_path} _SQLite3._**path**
: The path to the SQLite3 file
   <div class="cite"><span class="hint">default</span> <span>= :memory:</span></div>



#### class SQLite3 methods
---

{:#_SQLite3_SQLite3} **SQLite3**(_path_: string)
: > - the database doesn't need to exist.
   <div class="cite"><span class="hint">constructor</span> <span></span></div>



{:#_SQLite3_open} **open**()
: Opens the handle to a database file


{:#_SQLite3_close} **close**()
: Closes the handle to the database and return `true` if successfully
  closed or `false` otherwise.
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



{:#_SQLite3_exec} **exec**(_query_: string [, _params_: list | dict])
: Executes a query string as is and returns `true` if the
  query was executed or `false` otherwise.
  
  > - this method does not return a query result
  > - this method takes optional params like `query()` (see below).
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>

   <div class="cite"><span class="hint">throws</span> <span>SQLiteException if an error occured</span></div>



{:#_SQLite3_last_insert_id} **last_insert_id**()
: The id of the last insert operation.
  
  Returns: 
  * `-1` if the last insert failed, 
  * `0` if no insert statement has been executed or 
  * A number greater than 0 if it succeeded
  
   <div class="cite"><span class="hint">returns</span> <span>number</span></div>

   <div class="cite"><span class="hint">throws</span> <span>SQLiteException if database is not opened</span></div>



{:#_SQLite3_query} **query**(_sql_: string [, _params_: list | dict])
: Executes and sql query and returns the result of the execution.
   <div class="cite"><span class="hint">return</span> <span>SQLite3Cursor</span></div>

   <div class="cite"><span class="hint">throws</span> <span>SQLiteException if an error occured.</span></div>

  
  1. Pass a list as _params_ if you have unnamed parameterized queries.
  
  For example,
  
  ```blade
  sqlite.query('SELECT * FROM users WHERE id = ? AND name = ?', [3, 'James'])
  ```
  2. Or pass a dictionary as _params_ if you use named paramters
  
  For Example,
  
  ```blade
  sqlite.query(
    'SELECT * FROM user WHERE id = :id AND name = :name', 
    {':id': 1, ':name': 'James'}
  )
  ```


{:#_SQLite3_fetch} **fetch**(_sql_: string [, _params_: list | dict])
: Runs an SQL query and returns the result as a list of dictionaries.
  
  > - if the result is empty or the query is not a SELECT, it returns an empty list



^


### _class_ SQLiteException  < _Exception_
---

General Exception for SQLite


#### class SQLiteException methods
---

{:#_SQLiteException_SQLiteException} **SQLiteException**(_message_: string)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>




^


### _class_ SQLite3Cursor 
---

A cursor for navigation through sql results
  @iterable


#### class SQLite3Cursor properties
---

{:#SQLite3Cursor_SQLite3Cursor_connection} _SQLite3Cursor._**connection**
: The SQLite3 connection that owns this cursor
   <div class="cite"><span class="hint">readonly</span> <span></span></div>



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
  
   <div class="cite"><span class="hint">readonly</span> <span></span></div>

  
  > If a separate thread makes changes on the same database connection at the exact time 
  > the original query was also making a change, the result of this value will become 
  > undependable.


{:#SQLite3Cursor_SQLite3Cursor_columns} _SQLite3Cursor._**columns**
: A list of the columns available in the result set.
   <div class="cite"><span class="hint">readonly</span> <span></span></div>



#### class SQLite3Cursor methods
---

{:#_SQLite3Cursor_SQLite3Cursor} **SQLite3Cursor**(_db_: SQLite3, _cursor_: pointer)
:  <div class="cite"><span class="hint">constructor</span> <span></span></div>

  > - SQLite3Cursor should NEVER be maually instantiated.


{:#_SQLite3Cursor_close} **close**()
: Closes the cursor and prevents further reading
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_SQLite3Cursor_has_next} **has_next**()
: Returns `true` if there are more rows in the result set not yet retrieved, 
  otherwise it returns `false`.
  
   <div class="cite"><span class="hint">return</span> <span>boolean</span></div>



{:#_SQLite3Cursor_get} **get**(_index_: number | string)
: Returns the value of the column matching the index in the current result set.
  
  > - if index is a number, it returns the value in the column at the given index. 
  > - that index must be lower than columns.length() in this case.
  > - if index is a string, it returns the value in the column with the given name.
   <div class="cite"><span class="hint">throws</span> <span>SQLiteException if no matching column can be found.</span></div>




