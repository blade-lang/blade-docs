---
layout: default
title: date
parent: Standard Library
nav_order: 7
permalink: /standard/date
---

# date

This modules provides Blade's implementation of date and time
manipulation methods.

Time is stored internally as the number of seconds 
with fraction since the Epoch, January 1, 1970 00:00 UTC.



<h2>Properties</h2><hr>

{:#date__MIN_YEAR} _date._**MIN_YEAR**
: Minimum year supported


^
{:#date__MAX_YEAR} _date._**MAX_YEAR**
: Maximum year supported


^
{:#date__MIN_DAY} _date._**MIN_DAY**
: Minimum day supported


^
{:#date__MAX_DAY} _date._**MAX_DAY**
: Maximum day supported


^
{:#date__MIN_MONTH} _date._**MIN_MONTH**
: Minimum month supported


^
{:#date__MAX_MONTH} _date._**MAX_MONTH**
: Maximum year supported


^
{:#date__MAX_HOUR} _date._**MAX_HOUR**
: Maximum hour supported


^
{:#date__MAX_MINUTE} _date._**MAX_MINUTE**
: Maximum minute supported


^
{:#date__MAX_SECONDS} _date._**MAX_SECONDS**
: Maximum seconds supported




<h2>Functions</h2><hr>

{:#date__gmtime} _date_.**gmtime**()
: returns a dictionary representing the current time without
  timezone adjustment
   <div class="cite"><span class="hint">returns</span> <span>dictionary</span></div>



^
{:#date__localtime} _date_.**localtime**()
: returns a dictionary representing the current time after
  adjusting for the current timezone
   <div class="cite"><span class="hint">returns</span> <span>dictionary</span></div>



^
{:#date__mktime} _date_.**mktime**(_year_: number, _month_: number, _day_: number, _hour_: number, _minute_: number, _seconds_: number, _is_dst_: bool)
: convert the broken-out time into a time value with the same encoding as 
  that of the values returned by the time() function (that is, seconds
   from the Epoch, UTC) according to the timezone settings.
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



^
{:#date__from_time} _date_.**from_time**(_time_: **number**(seconds)
: returns a date object from a unix timestamp
   <div class="cite"><span class="hint">return</span> <span>Date</span></div>



^
{:#date__from_jd} _date_.**from_jd**(_julian_date_: number)
: returns a date instance representing the julian date
   <div class="cite"><span class="hint">return</span> <span>number</span></div>





<h2>Classes</h2><hr>



### _class_ Date 
---

Date and Time manipulation class
  
  A date here refers to a calendar datetime consisting of
  year, month, day, hour, minute and seconds
  
  Julian date conversion is based on the C implementation
  [here](http://www.lsc-group.phys.uwm.edu/lal/slug/nightly/doxygen.old/html/Julian_8c-source.html) and
  [here](https://stackoverflow.com/questions/29627533/conversion-of-julian-date-number-to-normal-date-utc-in-javascript)


#### class Date methods
---

{:#_Date_Date} **Date**([_year_: number [, _month_: number [, _day_: number [, _hour_: number [, _minute_: number [, _seconds_: number]]]]]])
:  <div class="cite"><span class="hint">constructor</span> <span>@note all arguments are optional</span></div>

   <div class="cite"><span class="hint">note</span> <span>when no argument is given, the date will be set to the current system date</span></div>



{:#_Date_is_leap} **is_leap**()
: returns true if the year is a leap year or false otherwise
   <div class="cite"><span class="hint">return</span> <span>bool</span></div>



{:#_Date_days_before_month} **days_before_month**()
: returns the number of days in the year preceeding the first 
  day of the month
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Date_days_before_year} **days_before_year**()
: returns the number of days before January 1st of year
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Date_days_in_month} **days_in_month**()
: returns the number of days in month for the specified year
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Date_weekday} **weekday**()
: returns the numbered day of the week
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Date_week_number} **week_number**()
: returns the number of the current week in the year
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Date_format} **format**(_format_: string)
: formats the current date based on the specified string
  
  Blade's Date formatting table
  
    Character | Description                                               | Example
    ----------|-----------------------------------------------------------|-----------------------------------
    A         | uppercase Ante meridiem and Post meridiem                 | AM or PM
    a         | lowercase Ante meridiem and Post meridiem                 | am or pm
    d         | day of the month with leading zero                        | 01 to 31
    D         | textual representation of a day, three letters            | Mon - Sun
    j         | day of the month without leading zero                     | 1 to 31
    l         | full textual representation of the day of the week        | Monday - Sunday
    N         | ISO-8601 numeric representation of the day of the week    | 1 - 7
    S         | English ordinal suffix for the day of the month           | st, nd, rd or th
    w         | numeric representation of the day of the week             | 0 - 6
    z         | the day of the year (starting from 0)                     | 0 - 365
    W         | ISO-8601 week number of year, weeks starting on Monday    | E.g. 33 (the 33rd week of the year)
    F         | full textual representation of a month                    | January - December
    m         | numeric representation of a month, with leading zeros     | 01 - 12
    n         | numeric representation of a month, without leading zeros  | 1 - 12
    M         | short textual representation of a month, three letters    | Jan - Dec
    t         | number of days in the given month                         | 28 - 31
    L         | whether it's a leap year                                  | 1 if true, 0 otherwise
    y         | two digit representation of a year                        | e.g. 09 or 99
    Y         | full numeric representation of a year using 4 digits      | e.g. 2009 or 1999
    h         | 12 hour format of an hour with leading zeros              | 01 - 12
    H         | 24 hour format of an hour with leading zeros              | 01 - 24
    g         | 12 hour format of an hour without leading zeros           | 1 - 12
    G         | 24 hour format of an hour without leading zeros           | 1 - 24
    i         | minutes with leading zero                                 | 00 - 59
    s         | seconds with leading zero                                  | 00 - 59
    u         | microseconds                                               | e.g. 987654
    v         | milliseconds                                               | e.g. 987
    e         | timezone identifier                                       | e.g. GMT, UTC, WAT
    I         | whether or not the date is in daylight saving time        | 1 for true, 0 otherwise
    O         | difference to GMT without colon between hours and minutes | e.g. +0100
    P         | difference to GMT with colon between hours and minutes    | e.g. +01:00
    Z         | timezone offset in seconds                                | -43200 - 50400
    c         | ISO 8601 date                                             | e.g. 2020-03-04T15:19:21+00:00
    r         | RFC 2822 formatted date                                   | e.g. Thu, 21 Dec 2000 16:01:07 +0200
  
   <div class="cite"><span class="hint">return</span> <span>string</span></div>



{:#_Date_jd} **jd**()
: converts the current date to a julian day
   <div class="cite"><span class="hint">return</span> <span>number</span></div>



{:#_Date_unix_time} **unix_time**()
: returns unix `mktime` equivalent of the current date
   <div class="cite"><span class="hint">return</span> <span>number</span></div>




