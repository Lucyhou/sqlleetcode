drop table if exists Products;
CREATE TABLE   Products(product_id int, product_name varchar(25),product_category varchar(25));
insert into  Products values ('1', 'Leetcode Solutions','Book'),('2', 'Jewels of Stringology','Book'),
('3', 'HP','Laptop'),('4', 'Lenovo','Laptop'),('5', 'Leetcode Kit','T-shirt');

drop table if exists Orders;
CREATE TABLE  Orders(product_id int, order_date DATE, unit int);

insert into Orders values ('1', '2020-02-05','60'),('1', '2020-02-10','70'),('2', '2020-01-18','30'),('2', '2020-02-11','80'),
('3', '2020-02-17','2'),('3', '2020-02-24','3'),('4', '2020-03-01','20'),('4', '2020-03-04','30'),('4', '2020-03-04','60'),
('5', '2020-02-25','50'),('5', '2020-02-27','50');




Select product_name, unit
From Products p left join 
(select product_id, sum(unit) unit
From Orders o
Where year(order_date)= '2020' and month(order_date)='2'
Group by product_id
Having sum(unit)>= 100)t 
on p. product_id=t.product_id
where unit is not null
