# Functions to convert a datetime(6) to a bigint and back.

`fn_dt2long` function converts a datetime to a bigint.

`fn_long2dt` function converts a bigint to a datetime.

`sp_test_dt2long.sql` stored procedure runs tests on the two functions above.


## Conversion Formula:

Formula to encode a datetime to a bigint:

    year << 46
  + month << 42
  + day << 37
  + time-of-day-seconds << 20
  + microseconds



Thanks!
Slawomir
