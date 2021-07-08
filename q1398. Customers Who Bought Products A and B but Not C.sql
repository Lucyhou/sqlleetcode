drop table if exists Customers;
CREATE TABLE  Customers(customer_id int,  customer_name varchar(25));
insert into Customers(customer_id,  customer_name) values ('1', 'Daniel'),('2', 'Diana'),('3', 'Elizabeth'),('4', 'Jhon');

drop table if exists Orders;
CREATE TABLE  Orders(order_id int,  customer_id int,  product_name varchar(25));
insert into Orders(order_id,  customer_id, product_name) values ('10', '1','A'), ('20', '1','B'), ('30', '1','D'), ('40', '1','C'), 
('50', '2','A'),('60', '3','A'),('70', '3','B'),('80', '3','D'),('90', '4','C');


#way1
SELECT c. customer_id, customer_name
From Customers c join
(
Select distinct customer_id
From Orders
Where  customer_id in
    (select distinct customer_id
     from Orders
     where product_name = 'A'
    ) and
    customer_id in
    (select distinct customer_id
     from Orders
     where product_name = 'B'
    ) and
    customer_id not in
    (select distinct customer_id
     from Orders
     where product_name = 'C'
    ) 
)a  on  c.customer_id=a.customer_id
order by 1

#way2
SELECT c.customer_id, c.customer_name
FROM Customers AS c
WHERE 
EXISTS(SELECT * FROM orders WHERE customer_id = c.customer_id AND product_name = 'A')
AND EXISTS(SELECT * FROM orders WHERE customer_id = c.customer_id AND product_name = 'B')
AND NOT EXISTS(SELECT * FROM orders WHERE customer_id = c.customer_id AND product_name = 'C')
ORDER BY c.customer_id;


#way3
with t as 
(SELECT customer_id, 
    (case when product_name='C' then 1 else 0 end) c, (case when product_name='B' then 1 else 0 end) b, (case when product_name='A' then 1 else 0 end) a 
from  Orders)


SELECT cu.*
from Customers cu INNER JOIN 
(select customer_id, max(c) cc, max(b) bb, max(a) aa
from t
group by customer_id)tt
 on 
    cu.customer_id=tt.customer_id 
where 
    cc=0 and aa=1 and bb=1



#way3
with t as 
(SELECT customer_id, 
    max('C'=product_name) c, 
    max('B'=product_name) b,
    max('A'=product_name) a
from  Orders GROUP BY customer_id)
#SELECT * from t
SELECT cu.*
from Customers cu INNER JOIN t on 
    cu.customer_id=t.customer_id 
where 
    t.c=0 and t.a=1 and t.b=1;
