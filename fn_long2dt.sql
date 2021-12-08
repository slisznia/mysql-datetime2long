delimiter $$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_long2dt`(arg_val bigint unsigned)
RETURNS datetime(6) DETERMINISTIC
begin

return timestampadd(microsecond, 
	arg_val & 0xfffff, -- microseconds plus...
	timestamp(
		date(concat_ws('-', 
			(arg_val >> 46),  -- year
			((arg_val >> 42) & 0x0f), -- month
			((arg_val >> 37) & 0x1f)) -- day
		),
		sec_to_time((arg_val >> 20) & 0x1ffff))); -- time of day in seconds

end $$
delimiter ;
