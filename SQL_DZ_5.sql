USE dz_5;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;


-- 1. Создайте представление, в которое попадут автомобили стоимостью до 25 000 долларов
CREATE VIEW NewCars 
	AS SELECT Name 
		FROM Cars 
			WHERE Cost<25000;
SELECT *
FROM NewCars;


-- 2. Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW)
ALTER VIEW NewCars 
	AS SELECT Name 
		FROM Cars
			WHERE Cost<30000;
SELECT *
FROM NewCars;

-- Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”
CREATE VIEW SACars 
	AS SELECT Name
		FROM Cars 
			WHERE Name IN ('Skoda', 'Audi');
SELECT *
FROM SACars;

-- Задание 4
DROP TABLE IF EXISTS `train`;
CREATE TABLE train
(
	train_id INT NOT NULL,
    station VARCHAR(45),
    station_time TIME
);
INSERT train
VALUES
	(110, "Питер", '10:00:00'),
    (110, "Мск", '10:54:00'),
    (110, "Орел", '11:02:00'),
	(110, "Астрахань", '12:35:00'),
    (120, "Казань", '11:00:00'),
	(120, "Екатеринбург", '12:49:00'),
    (120, "Краснодар", '13:30:00');
Select *
FROM train;
SELECT *, 
		TIMEDIFF(LEAD(station_time) OVER (PARTITION BY train_id), station_time) as time_to_next_station
FROM train 