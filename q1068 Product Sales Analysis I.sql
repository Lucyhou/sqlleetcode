/*1068 Question:
Reports all product names of the products in the Sales table along with their selling year and price
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
+--------------+-------+-------+
| product_name | year  | price |
+--------------+-------+-------+
| Nokia        | 2008  | 5000  |
| Nokia        | 2009  | 5000  |
| Apple        | 2011  | 9000  |
+--------------+-------+-------+
*/
drop table if exists Sales;
create table Sales(sale_id int, product_id int,year int,quantity int, price decimal);
insert into Sales(sale_id, product_id,year,quantity, price) values (1,100,2008,10,5000),(2,100,2009,12,5000),(7,200,2011,15,9000);
drop table if exists Product;
create table Product(product_id int, product_name varchar(255));
insert into Product(product_id, product_name) values (100,'Nokia'),(200,'Apple'),(300,'Samsung');

Select product_name, year,price
From Sales s left join Product p on s.product_id=p.product_id
