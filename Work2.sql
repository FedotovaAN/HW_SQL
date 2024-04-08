CREATE DATABASE homework_result1;
use homework_result1;

-- 2.Cоздайте процедуру, которая выведет только числа, делящиеся на 15 или 33 в промежутке от 1 до 1000.
-- Пример: 15,30,33,45..

DELIMITER // 
DROP PROCEDURE IF EXISTS get_numbers// 
CREATE PROCEDURE get_numbers (IN num INT) 
BEGIN DECLARE i INT DEFAULT 1; 
DECLARE x VARCHAR(50) default 0; 
IF (num > 0) THEN WHILE i < num DO IF (i % 15 = 0) and (i % 33 = 0) 
THEN SELECT i as 'Число, которое делится на 15 или 33'; 
END IF; 
SET i = i + 1; 
END WHILE; 
ELSE SELECT 'Неверное число'; 
END IF; END
// DELIMITER ;

CALL get_numbers(1000);