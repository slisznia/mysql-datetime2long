delimiter $$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_dt2long`(arg_dt datetime(6))
RETURNS BIGINT UNSIGNED DETERMINISTIC
begin

-- Formula:
--    year << 46
--  + month << 42
--  + day << 37
--  + time of day in seconds << 20
--  + microseconds
--
declare var_dt_no_usec datetime default arg_dt; -- remove microseconds for time_to_sec
declare var_res bigint unsigned default (
	(year(var_dt_no_usec) << 46) |
	(month(var_dt_no_usec) << 42) |
	(day(var_dt_no_usec) << 37) |
	(time_to_sec(var_dt_no_usec) << 20) |
	microsecond(arg_dt));

return var_res;

end $$
delimiter ;
