#586. Customer Placing the Largest Number of Orders 
drop table if exists q586orders;
Create table If Not Exists q586orders(order_number int, customer_number int, order_date date, required_date date, shipped_date date, status char(15), comment char(200), key(order_number));
Truncate table q586orders;
insert into q586orders (order_number, customer_number) values ('1', '1');
insert into q586orders (order_number, customer_number) values ('2', '2');
insert into q586orders (order_number, customer_number) values ('3', '3');
insert into q586orders (order_number, customer_number) values ('4', '3');
insert into q586orders (order_number, customer_number) values ('5', '2');


select customer_number
from q586orders t1
group by customer_number
having count(distinct order_number)= (
select max(a.cntt)
from 
(
select count(distinct order_number) as cntt
from q586orders t2
group by customer_number
) a
)