/*Выведите название, производителя и цену для товаров,
количество которых превышает 2 (SQL - файл, скриншот, либо сам
код)*/
SELECT ProductName, Manufacturer, Price 
FROM dz_1.product
where ProductCount > 2;


/*Выведите весь ассортимент товаров марки “Samsung”*/
SELECT *
FROM dz_1.product
where Manufacturer = 'Samsung';


/*4.1. Товары, в которых есть упоминание "Iphone"*/
SELECT *
FROM dz_1.product
where ProductName Like '%iPhone%';


/*4.2. "Samsung"*/
SELECT *
FROM dz_1.product
where ProductName Like '%Galaxy%';


/*4.3. Товары, в которых есть ЦИФРЫ*/
SELECT *
FROM dz_1.product
where ProductName REGEXP '[0-9]';


/*4.4. Товары, в которых есть ЦИФРА "8"*/
SELECT *
FROM dz_1.product
where ProductName Like '%8%';


