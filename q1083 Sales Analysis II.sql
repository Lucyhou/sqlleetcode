/*1083
Report the buyers who have bought S8 but not iPhone.
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
+-------------+
| buyer_id    |
+-------------+
| 1           |
+-------------+
The buyer with id 1 bought an S8 but didn't buy an iPhone.*/
drop table if exists Sales;
create table Sales(sale_id int, product_id int,buyer_id int,quantity int, price decimal);
insert into Sales(sale_id, product_id,buyer_id,quantity, price) values 
(1,100,1,1,5000),(2,200,1,1,12000),(3,100,7,2,11000),(4,300,2,15,9000),(5,100,3,15,9000),(6,100,4,3,15000),(7,200,5,3,18000),
(8,200,6,1,6000);
drop table if exists Product;
create table Product(product_id int, product_name varchar(255),price decimal);
insert into Product(product_id, product_name,price) values (100,'S8',5000),(200,'iphone',6000),(300,'Samsung',5500);

select s.buyer_id
From Sales s join Product p on s.product_id=p.product_id
Where product_name in ('S8') and buyer_id not in ( 
select s1.buyer_id #buyer_id
From Sales s1 join Product p1 on s1.product_id=p1.product_id
Where product_name in ('iphone')
)
