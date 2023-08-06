-- 1. Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname,
-- snum, comm. (к первой или второй таблице, используя SELECT)
SELECT city, sname, snum, comm
FROM salespeople;


-- 2. Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем
-- каждого заказчика в городе San Jose. (“заказчики”)
SELECT rating
FROM customers
WHERE city = 'San Jose';


-- 3. Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без
-- каких бы то ни было повторений. (уникальные значения в “snum“ “Продавцы”)
SELECT distinct(snum)
FROM salespeople;


-- 4. Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G.
-- Используется оператор "LIKE": (“заказчики”)
SELECT *
FROM customers
WHERE cname LIKE 'G%';


-- 5. Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000.
-- (“Заказы”, “amt” - сумма)
SELECT * 
FROM orders
WHERE amt > 1000;


-- 6. Напишите запрос который выбрал бы наименьшую сумму заказа.
-- (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
SELECT min(amt)
FROM orders;


-- 7. Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых
-- рейтинг больше 100 и они находятся не в Риме.
SELECT *
FROM customers
WHERE rating > 100;


-- Часть 2 Используемы таблицы: staff
-- Отсортируйте поле “зарплата” в порядке убывания и возрастания
 SELECT *
 FROM staff
 order by 6 desc;
 
 SELECT *
 FROM staff
 order by 6;
 
 
-- Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
-- 1-й метод
SELECT * 
FROM staff
ORDER BY 6 desc
LIMIT 5;
-- 2-й метод
WITH one as (SELECT *, ROW_NUMBER() OVER (ORDER BY salary DESC) as rnk
			  FROM staff)
SELECT id, first_name, last_name, post, seniority, salary, age
FROM one
WHERE rnk < 6;


-- Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
WITH one as(SELECT *, sum(salary) OVER (partition by post) as sm
			FROM staff)
SELECT id, first_name, last_name, post, seniority, salary, age
FROM one
WHERE sm > 100000;