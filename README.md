# Functions to convert datetime(6) to bigint and back.

`fn_dt2long` function converts a datetime to a bigint.

`fn_long2dt` function converts a bigint to a datetime.

`sp_test_dt2long.sql` stored procedure runs tests on the two functions above.


## Conversion formula

Formula to encode a datetime as bigint:

```
    year << 46
  + month << 42
  + day << 37
  + time-of-day-seconds << 20
  + microseconds
```

## Examples

To bigint...
```
> select fn_dt2long('2099-12-31 23:58:59.123456');
+------------------------------------------+
| fn_dt2long('2099-12-31 23:58:59.123456') |
+------------------------------------------+
|                       147761121727734336 |
+------------------------------------------+
```
and back...
```
> select fn_long2dt(147761121727734336);
+--------------------------------+
| fn_long2dt(147761121727734336) |
+--------------------------------+
| 2099-12-31 23:58:59.123456     |
+--------------------------------+
```

_Enjoy, Slawomir_
