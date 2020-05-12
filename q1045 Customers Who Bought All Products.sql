#1045 Write an SQL query for a report that provides the customer ids from the Customer table that 
#bought all the products in the Product table.drop table if exists Customer;
create table Customer(customer_id int, product_key int);
insert into Customer(customer_id,product_key) values (1,5),(2,6),(3,5),(3,6),(1,6);
drop table if exists Product;
create table Product(product_key int);
insert into Product(product_key) values (5),(6);

#select * from Customer
select a.customer_id from
(select customer_id, count(distinct product_key) as num
from Customer
group by customer_id) a
where a.num = (select count(distinct product_key) from Product);

##
Select customer_id
From Customer
group by customer_id
Having count(distinct product_key) in (Select count(product_key) as n_product
From Product p)
###note: do not forget group by caluse