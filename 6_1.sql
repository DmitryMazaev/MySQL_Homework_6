-- Задание 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов. 
-- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '

drop database if exists homework_6_2;
create database homework_6_2;
use homework_6_2;
drop function if exists TimeToSeconds;
delimiter $$
create function TimeToSeconds(a int) returns varchar(255) deterministic
begin
	declare result varchar(255);
    declare seconds int;
	declare minutes int;
    declare hours int;
    declare days int;
    if a < 60 then
		set result = concat(a, ' seconds');
	elseif a < 3600 then
		set minutes =  TRUNCATE(a/60, 0);
        set seconds = a%60;
		set result = concat(minutes, ' minutes, ', seconds, ' seconds');
	elseif a < 86400 then
		set hours = TRUNCATE(a/60/60, 0);
        set minutes = TRUNCATE((a - hours*60*60)/60, 0);
        set seconds = a-hours*60*60-minutes*60;
		set result = concat(hours, ' hours, ', minutes, ' minutes, ', seconds, ' seconds');
	else
		set days = TRUNCATE(a/60/60/24, 0);
		set hours = TRUNCATE((a - days*60*60*24)/60/60, 0);
        set minutes = TRUNCATE((a - days*60*60*24 - hours*60*60)/60, 0);
        set seconds = a-days*60*60*24 - hours*60*60 - minutes*60;
		set result = concat(days, ' days, ', hours, ' hours, ', minutes, ' minutes, ', seconds, ' seconds');
	end if;
    return result;
end $$
delimiter ;

select TimeToSeconds(123456);