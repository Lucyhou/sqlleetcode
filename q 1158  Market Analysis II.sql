##1158. Market Analysis I
drop table if exists Users;
create table Users(user_id int, join_date date, favorite_brand varchar(255));
insert into Users(user_id , join_date, favorite_brand) values (1,'2018-01-01','Lenovo'),(2,'2018-02-09','Samsung'),
(3,'2018-01-19','LG'),(4,'2019-05-21','HP');

drop table if exists Orders;
create table Orders(order_id int, order_date date,item_id int,buyer_id int,seller_id int);
insert into Orders(order_id, order_date,item_id,buyer_id,seller_id) values 
(1,'2019-08-01',4,1,2),(2,'2019-08-02',2,1,3),(3,'2019-08-03',3,2,3),(4,'2019-08-04',1,4,2),
(5,'2019-08-04',1,3,4),(6,'2019-08-05',2,2,4), (7,'2019-08-06',2,2,1);

drop table if exists Items;
create table Items(item_id int, item_brand varchar(255));
insert into Items(item_id, item_brand) values (1,'Samsung'),(2,'Lenovo'),(3,'LG'),(4,'HP');  

select buyer_id, join_date, ifnull(t.cnt,0) orders_in_2019 
from  Users u left join
(select buyer_id, count(order_id) cnt from Orders
where year(order_date)='2019'
group by buyer_id) t on u.user_id=t.buyer_id
