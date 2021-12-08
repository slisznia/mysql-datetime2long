delimiter $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_test_dt2long`()
reads sql data
begin

if fn_long2dt(fn_dt2long('2021-12-31 23:59:59.999999')) != '2021-12-31 23:59:59.999999' then
	signal sqlstate '45000' set message_text = 'failed dt2long test #1';
end if;

if fn_long2dt(fn_dt2long('2000-01-01 00:00:00.000000')) != '2000-01-01 00:00:00.000000' then
	signal sqlstate '45000' set message_text = 'failed dt2long test #2';
end if;

if fn_long2dt(fn_dt2long('1999-01-02 01:02:03.100002')) != '1999-01-02 01:02:03.100002' then
	signal sqlstate '45000' set message_text = 'failed dt2long test #3';
end if;

if fn_long2dt(fn_dt2long('3000-01-02 01:02:03.900009')) != '3000-01-02 01:02:03.900009' then
	signal sqlstate '45000' set message_text = 'failed dt2long test #4';
end if;

if hex(fn_dt2long('2021-12-31 23:59:59.999999')) != '1F973F517FF423F' then
	signal sqlstate '45000' set message_text = 'failed dt2long test #5';
end if;

if hex(fn_dt2long('2099-12-31 23:58:59.123456')) != '20CF3F51431E240' then
	signal sqlstate '45000' set message_text = 'failed dt2long test #6';
end if;

end $$
delimiter ;
