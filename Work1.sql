-- 1.Создайте функцию, которая принимает кол-во сек и далее переводит их 
-- в кол-во дней, часов, минут, секунд.
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
DELIMITER // 
DROP FUNCTION transtime//
CREATE FUNCTION transtime(val INT)
RETURNS char(15)
DETERMINISTIC
begin
declare Days char(3);
declare Hours, Minutes, Seconds char(2);
declare res char(15);
set Days = cast(floor(val/60/60/24) as char(3));
set Hours = cast(floor(mod(val/60/60/24,1)*24) as char(2));
set Minutes = cast(floor(mod(mod(val/60/60/24,1)*24,1)*60) as char(2));
set Seconds = cast(round(mod(mod(mod(val/60/60/24,1)*24,1)*60,1)*60) as char(2));
set res = concat(Days,'.',Hours,':',Minutes,':',Seconds);
return res;
end;

select transtime(123456) dt from dual;