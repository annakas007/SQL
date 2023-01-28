/*1. Найдите номер модели, скорость и размер жесткого диска для 
всех ПК стоимостью менее 500 дол. Вывести: model, speed и hd*/
select model, speed, hd
from PC
where price < 500

/*2.Найдите производителей принтеров. Вывести: maker */

SELECT maker
FROM Product 
WHERE type = 'Printer' 
GROUP BY maker

/*3.Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов, 
цена которых превышает 1000 дол.*/

Select model, ram, screen
from Laptop 
where price > 1000

/*4.Найдите все записи таблицы Printer для цветных принтеров. */
Select * from Printer 
where color = 'y'

/*5. Найдите номер модели, скорость и размер жесткого диска ПК, 
имеющих 12x или 24x CD и цену менее 600 дол.*/

Select model, speed, hd
from pc
where cd in ('12x', '24x') and price < 600

/*6.Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска 
не менее 10 Гбайт, найти скорости таких ПК-блокнотов. 
Вывод: производитель, скорость. */

Select distinct maker, speed
from  Product p
      join Laptop l
      on p.model = l.model
where hd >= 10
/*7. Найдите номера моделей и цены всех имеющихся в продаже продуктов 
(любого типа) производителя B (латинская буква).*/

SELECT DISTINCT product.model, pc.price
FROM Product 
JOIN pc ON product.model = pc.model WHERE maker = 'B'
UNION
SELECT DISTINCT product.model, laptop.price
FROM product JOIN laptop ON product.model=laptop.model WHERE maker='B'
UNION
SELECT DISTINCT product.model, printer.price
FROM product JOIN printer ON product.model=printer.model WHERE maker='B'

/* 8. Найдите производителя, выпускающего ПК, но не ПК-блокноты.*/

SELECT DISTINCT maker
		FROM PRODUCT
		WHERE product.type='pc'
		EXCEPT
		SELECT DISTINCT maker
		FROM PRODUCT
		WHERE product.type='laptop'
	
/*9. Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker */	
	
Select maker
from Product p
     join pc 
     on p.model = pc.model
where pc.speed >= 450
group by maker		

/*10. Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price*/

Select model, price
from Printer
where price = (select max(price)
               from Printer)

/*11. Найдите среднюю скорость ПК.*/
Select avg(speed)
       from PC
	   
/*12.Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол. */	  

 select avg(speed)
from Laptop
where price > 1000

/*13. Найдите среднюю скорость ПК, выпущенных производителем A.*/

Select avg(speed)
from PC
     join Product p 
     on p.model = pc.model
where maker = 'A'


/*14. Найдите класс, имя и страну для кораблей из таблицы Ships,
 имеющих не менее 10 орудий.*/
 
 Select c.class, s.name, c.country
from Classes c
     join Ships s
     on c.class = s.class
where numGuns >= 10

/*15. Найдите размеры жестких дисков, совпадающих у двух и более PC. Вывести: HD*/

Select hd
from pc
group by hd
having  count(hd) >= 2

/*16. Найдите пары моделей ПК с одинаковой скоростью и объемом оперативной памяти. 
В результате каждая пара указывается только один раз, т.е. (i,j), 
но не (j,i). 
Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и ОЗУ*/

SELECT distinct pc1.model, pc2.model, pc1.speed, pc1.ram
FROM pc  pc1, pc  pc2
WHERE pc1.model>pc2.model AND pc1.speed=pc2.speed AND pc1.ram=pc2.ram

/*17. Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
Вывести: type, model, speed*/

SELECT DISTINCT p.type, l.model, l.speed
FROM laptop l, product p
WHERE speed < (SELECT MIN(speed) FROM PC)
               AND p.type='Laptop'
			   
/*18. Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price*/

Select distinct maker, price
from product pro
     join Printer pri
     on pro.model = pri.model
where price = (select min(price) from Printer
                where color = 'y') and color = 'y'		

/*19.Для каждого производителя, имеющего модели в таблице Laptop, найдите средний размер экрана выпускаемых им ПК-блокнотов.
Вывести: maker, средний размер экрана. */	

Select p.maker, avg(screen)
from Product p
     join Laptop l
     on p.model = l.model
group by p.maker

/*20.Найдите производителей, выпускающих по меньшей мере три различных модели ПК. 
Вывести: Maker, число моделей ПК.*/	

	Select maker, count(model) 
from Product  
     
where type = 'pc'
group by maker
having count(model) > 2
	