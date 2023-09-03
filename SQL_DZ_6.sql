USE dz_6;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
	id SERIAL PRIMARY KEY, -- SERIAL = BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);

INSERT INTO users (id, firstname, lastname, email) VALUES 
(1, 'Reuben', 'Nienow', 'arlo50@example.org'),
(2, 'Frederik', 'Upton', 'terrence.cartwright@example.org'),
(3, 'Unique', 'Windler', 'rupert55@example.org'),
(4, 'Norene', 'West', 'rebekah29@example.net'),
(5, 'Frederick', 'Effertz', 'von.bridget@example.net'),
(6, 'Victoria', 'Medhurst', 'sstehr@example.net'),
(7, 'Austyn', 'Braun', 'itzel.beahan@example.com'),
(8, 'Jaida', 'Kilback', 'johnathan.wisozk@example.com'),
(9, 'Mireya', 'Orn', 'missouri87@example.org'),
(10, 'Jordyn', 'Jerde', 'edach@example.com');

/*Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, с помощью которой можно переместить любого (одного) 
пользователя из таблицы users в таблицу users_old. (использование транзакции с выбором commit или rollback – обязательно)*/
DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old (
	id INT PRIMARY KEY auto_increment, 
    firstname varchar(50), 
    lastname varchar(50), 
    email varchar(50)
);

DELIMITER $$
DROP PROCEDURE IF EXISTS move_user;
CREATE PROCEDURE  move_user (IN t INT) 
	DETERMINISTIC
BEGIN
INSERT INTO users_old (firstname, lastname, email) 
SELECT firstname, lastname, email 
	FROM users 
	WHERE users.id = t;
DELETE FROM users 
	WHERE id = t;
COMMIT;
END$$
DELIMITER ;
CALL move_user(10);

/*Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. 
С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", 
с 18:00 до 00:00 — "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".*/

DELIMITER $$
CREATE FUNCTION hello() 
	RETURNS VARCHAR(50)
	DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(50);
SELECT 
	CASE 
	WHEN CURRENT_TIME >= '06:00:00' AND  CURRENT_TIME < '12:00:00' THEN 'Доброе утро'
    WHEN CURRENT_TIME >= '12:00:00' AND  CURRENT_TIME < '18:00:00' THEN 'Добрый день'
	WHEN CURRENT_TIME >= '18:00:00' AND  CURRENT_TIME < '00:00:00' THEN 'Доброй вечер'
    WHEN CURRENT_TIME >= '00:00:00' AND  CURRENT_TIME < '06:00:00' THEN 'Доброй ночи'
END INTO result;
RETURN result;
END$$
DELIMITER ;

SELECT hello();