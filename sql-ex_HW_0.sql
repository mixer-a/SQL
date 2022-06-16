Задание: 1 
Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd

Select model, speed, hd from PC
where price < 500;
===============================
Задание: 2 
Найдите производителей принтеров. Вывести: maker

Select distinct maker from Product
where type = 'Printer';
===============================
Задание: 3 
Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, цена которых превышает 1000 дол.

Select model, ram, screen from Laptop
where price > 1000;
===============================
Задание: 4 
Найдите все записи таблицы Printer для цветных принтеров.

Select * from Printer
where color = 'y';
===============================
Задание: 5 
Найдите номер модели, скорость и размер жесткого диска ПК, имеющих 12x или 24x CD и цену менее 600 дол.

Select model, speed, hd from PC
where cd in('12x', '24x') and price < 600;
===============================
Задание: 6 
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.

Select distinct maker, speed from Product
join Laptop on Product.model = Laptop.model
where Laptop.hd >= 10;
===============================
Задание: 7 
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).

Select PC.model, price from PC
join Product on Product.model = PC.model
where maker = 'B'
union
Select Laptop.model, price from Laptop
join Product on Product.model = Laptop.model
where maker = 'B'
union
Select Printer.model, price from Printer
join Product on Product.model = Printer.model
where maker = 'B';
===============================
Задание: 8 
Найдите производителя, выпускающего ПК, но не ПК-блокноты.

Select distinct maker from Product
where type = 'PC' and maker not in(select maker from Product
where type = 'Laptop');
===============================
Задание: 9 
Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker

Select distinct maker from Product
join PC on Product.model = PC.model
where PC.speed >= 450;

===============================
Задание: 10 
Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price

Select model, price from Printer
where price = (select max(price) from Printer);
===============================
Задание: 11 
Найдите среднюю скорость ПК.

Select avg(speed) as AVG_Speed from PC;
===============================
Задание: 12 
Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.

Select avg(speed) from Laptop
where price > 1000;
===============================
Задание: 13 
Найдите среднюю скорость ПК, выпущенных производителем A.

Select avg(speed) from PC
join Product on PC.model = Product. model
where maker = 'A';
===============================
Задание: 14 
Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.

Select Ships.class, Ships.name, country from Ships
join Classes on Ships.class = Classes.class
where numGuns >= 10;
===============================
Задание: 15 
Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD

Select hd from PC
group by hd
having count(hd) > 1;
===============================
Задание: 16 
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.

Select distinct p1.model, p2.model, p1.speed, p1.ram
from PC p1, PC p2
WHERE p1.speed = p2.speed AND p1.ram = p2.ram AND p1.model > p2.model;
===============================
Задание: 17 
Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed

Select distinct type, Laptop.model, Laptop.speed from Laptop
join Product on Laptop.model = Product.model
where Laptop.speed < (select min(speed) from PC);
===============================
Задание: 18 
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price

Select distinct Product.maker, Printer.price from Product
join Printer on Product.model = Printer.model
where color = 'y' and Printer.price = 
(select min(price) from Printer where color = 'y');
===============================
Задание: 19
Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана.

Select Product.maker, avg(screen) as AVG_screen from Laptop
join Product on Product.model = Laptop.model
group by Product.maker;
===============================
Задание: 20 
Найдите производителей, выпускающих по меньшей мере три различных модели ПК. Вывести: Maker, число моделей ПК.

Select maker, count(model) as count_model from Product
where type = 'PC'
group by maker
having count(model) >= 3;
===============================
Задание: 21 
Найдите максимальную цену ПК, выпускаемых каждым производителем, у которого есть модели в таблице PC.
Вывести: maker, максимальная цена.

Select maker, max(PC.price) as max_price from Product
join PC on Product.model = PC.model
group by maker;
===============================
Задание: 22 
Для каждого значения скорости ПК, превышающего 600 МГц, определите среднюю цену ПК с такой же скоростью. Вывести: speed, средняя цена.

Select speed, avg(price) as avg_price from PC
where speed > 600
group by speed;
===============================
Задание: 23 
Найдите производителей, которые производили бы как ПК
со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
Вывести: Maker

Select distinct maker from Product
join PC on Product.model = PC.model
where PC.speed >= 750 
and maker in (select maker from Product
join Laptop on Product.model = Laptop.model
where Laptop.speed >= 750);
===============================
Задание: 24 
Перечислите номера моделей любых типов, имеющих самую высокую цену по всей имеющейся в базе данных продукции.

Select model from
(select model, price from PC
union select model, price from Laptop
union select model, price from Printer) t1
where price = (select max(price) from 
(select price from PC
union select price from Laptop
union select price from Printer) t2);
===============================
Задание: 25 
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker

Select distinct maker from Product
where model in (
select model from PC
where ram = (
select min(ram) from PC)
and speed = (select max(speed) from PC
where ram = (
select min(ram) from PC)))
and maker in (
select maker from Product
where type = 'Printer');
===============================
Задание: 26
Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.

Select avg(price) as AVG_price from(
select PC.price from PC 
join Product on PC.model = Product.model 
where Product.maker = 'A' 
union all 
select Laptop.price from Laptop 
join Product ON Laptop.model = Product.model 
where Product.maker = 'A')x;
===============================
Задание: 27 
Найдите средний размер диска ПК каждого из тех производителей, которые выпускают и принтеры. Вывести: maker, средний размер HD.

Select maker, avg(hd) as AVG_HD from Product
join PC on PC.model = Product.model 
where maker in(select maker from Product 
where type = 'Printer')
group by maker;
===============================
Задание: 28 
Используя таблицу Product, определить количество производителей, выпускающих по одной модели.

Select count(maker) as qnt from (
select maker from product
group by maker
having count(*) = 1)x;
===============================