-- Задание 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

drop database if exists homework_6_2;
create database homework_6_2;
use homework_6_2;

drop procedure if exists NumbersEven;
DELIMITER $$
CREATE PROCEDURE NumbersEven(IN N INT)
BEGIN
	DECLARE counter INT;
    SET counter = 2; 
	CREATE temporary table if not exists num_list (num int);
    WHILE counter <= N DO
		insert into num_list (num)
			values (counter);
		SET counter = counter + 2;
    END WHILE;  
END $$
DELIMITER ;

call NumbersEven(10);
select * from num_list;
DROP TEMPORARY TABLE IF EXISTS num_list;