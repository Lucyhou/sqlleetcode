/*1070 Question:Selects the product id, year, quantity, and price for the first year.

Question:
Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
sale_id is the primary key of this table.
product_id is a foreign key to Product table.
Note that the price is per unit.
Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key of this table.
 

Write an SQL query that  the product id, year, quantity, and price for the first year.

The query result format is in the following example:

Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+

Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+

Result table:
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+

*/
drop table if exists Sales;
create table Sales(sale_id int, product_id int, year int,quantity int, price decimal);
insert into Sales(sale_id, product_id,year,quantity, price) values (1,100,2008,10,5000),(2,100,2008,10,3000),
(3,200,2009,12,5000),(4,100,2009,12,1000),(5,200,2009,12,500),(6,200,2009,1,8000),(7,200,2011,15,9000);
drop table if exists Product;
create table Product(product_id int, product_name varchar(255));
insert into Product(product_id, product_name) values (100,'Nokia'),(200,'Apple'),(300,'Samsung');


Select p.product_id, ifnull(year,0) first_year, ifnull(quantity,0) quantity, ifnull(price,0) price 
From Product p left join
(
Select product_id, year, quantity, price 
From Sales s
Where year in (select min(s1.year) as y 
from Sales s1 
where s1.product_id=s.product_id 
group by s1.product_id )
)a
 on a.product_id=p.product_id

