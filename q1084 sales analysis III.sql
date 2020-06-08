/*1084
Reports the products that were only sold in spring 2019. That is, between 2019-01-01 and 2019-03-31 inclusive.
Product table:
+------------+--------------+------------+
| product_id | product_name | unit_price |
+------------+--------------+------------+
| 1          | S8           | 1000       |
| 2          | G4           | 800        |
| 3          | iPhone       | 1400       |
+------------+--------------+------------+

Sales table:
+-----------+------------+----------+------------+----------+-------+
| seller_id | product_id | buyer_id | sale_date  | quantity | price |
+-----------+------------+----------+------------+----------+-------+
| 1         | 1          | 1        | 2019-01-21 | 2        | 2000  |
| 1         | 2          | 2        | 2019-02-17 | 1        | 800   |
| 2         | 1          | 3        | 2019-06-02 | 1        | 800   |
| 3         | 3          | 3        | 2019-05-13 | 2        | 2800  |
+-----------+------------+----------+------------+----------+-------+

Result table:
+-------------+--------------+
| product_id  | product_name |
+-------------+--------------+
| 1           | S8           |
+-------------+--------------+
The product with id 1 was only sold in spring 2019.*/
drop table if exists Sales;
create table Sales(sale_id int, product_id int,buyer_id int,sales_date date,quantity int, price decimal);
insert into Sales(sale_id, product_id,buyer_id,sales_date,quantity, price) values 
(1,100,1,'2019-01-21',1,5000),
#select * from Sales
(2,200,1,'2019-01-21',1,12000),(3,100,7,'2019-02-11',2,11000),(4,300,2,'2019-03-31',15,9000),
(5,100,3,'2019-03-01',2,9000),(6,100,4,'2019-04-02',3,15000),(7,200,5,'2019-04-21',3,18000),
(8,200,6,'2019-04-21',1,6000);
drop table if exists Product;
create table Product(product_id int, product_name varchar(255),price decimal);
insert into Product(product_id, product_name,price) values (100,'S8',5000),(200,'iphone',6000),(300,'Samsung',5500),(400,'Note8',5500);

#way1
select distinct p.product_id, product_name
From Sales s join Product p on s.product_id=p.product_id
Where sales_date >= '2019-01-01' AND
     sales_date <='2019-03-31'


