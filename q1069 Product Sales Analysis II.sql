/*1069 Question:

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
 

Write an SQL query that reports the total quantity sold for every product id.

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
+--------------+----------------+
| product_id   | total_quantity |
+--------------+----------------+
| 100          | 22             |
| 200          | 15             |
+--------------+----------------+
*/
drop table if exists Sales;
create table Sales(sale_id int, product_id int,year int,quantity int, price decimal);
insert into Sales(sale_id, product_id,year,quantity, price) values (1,100,2008,10,5000),(2,100,2009,12,5000),(7,200,2011,15,9000);
drop table if exists Product;
create table Product(product_id int, product_name varchar(255));
insert into Product(product_id, product_name) values (100,'Nokia'),(200,'Apple'),(300,'Samsung');

Select p.product_id, ifnull(sum(quantity),0) as total_quantity
From Sales s right join Product p on s.product_id=p.product_id
Group by p.product_id

