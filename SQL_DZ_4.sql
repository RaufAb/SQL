USE dz_4;
-- Задание № 1. Вывести на экран сколько машин каждого цвета для машин марок BMW и LADA
SELECT MARK, COLOR, COUNT(COLOR) 
FROM AUTO
WHERE MARK = "BMW" OR MARK = "LADA"
GROUP BY 1, 2;


-- Задание № 2. Вывести на экран марку авто и количество AUTO не этой марки
SELECT MARK, 
	(SELECT COUNT(MARK)
    FROM AUTO
    WHERE MARK = 'VOLVO') AS COUNT
FROM AUTO
WHERE MARK = 'BMW'
GROUP BY 1
UNION
SELECT MARK, (SELECT COUNT(MARK)
    FROM AUTO
    WHERE MARK = 'AUDI') AS COUNT
FROM AUTO
WHERE MARK = 'LADA'
GROUP BY 1
UNION
SELECT MARK, (SELECT COUNT(MARK)
    FROM AUTO
    WHERE MARK = 'BMW') AS COUNT
FROM AUTO
WHERE MARK = 'VOLVO'
GROUP BY 1
UNION
SELECT MARK, (SELECT COUNT(MARK)
    FROM AUTO
    WHERE MARK = 'LADA') AS COUNT
FROM AUTO
WHERE MARK = 'AUDI'
GROUP BY 1;

-- Задание № 3. Даны 2 таблицы, созданные следующим образом:
-- Напишите запрос, который вернет строки из таблицы test_a, id которых нет в таблице test_b, НЕ используя ключевого слова NOT.
create table test_a (id int auto_increment primary key, data varchar(1));

create table test_b (id int auto_increment primary key);

insert into test_a(id, data) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

SELECT id 
FROM 
  (SELECT id, data
  FROM test_a
  UNION ALL
  SELECT id, NULL
  FROM test_b) AS bb
GROUP BY ID
HAVING COUNT(id) = 1;