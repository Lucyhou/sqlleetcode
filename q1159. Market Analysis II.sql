#1159. Market Analysis II
#Write an SQL query to find for each user, whether the brand of the second item (by date) they sold is their favorite brand. 
#If a user sold less than two items, report the answer for that user as no.
drop table if exists Users;
create table Users(user_id int, join_date date, favorite_brand varchar(255));
insert into Users(user_id , join_date, favorite_brand) values (1,'2019-01-01','Lenovo'),(2,'2019-02-09','Samsung'),
(3,'2019-01-19','LG'),(4,'2019-05-21','HP');

drop table if exists Orders;
create table Orders(order_id int, order_date date,item_id int,buyer_id int,seller_id int);
insert into Orders(order_id, order_date,item_id,buyer_id,seller_id) values 
(1,'2019-08-01',4,1,2),(2,'2019-08-02',2,1,3),(3,'2019-08-03',3,2,3),(4,'2019-08-04',1,4,2),
(5,'2019-08-04',1,3,4),(6,'2019-08-05',2,2,4), (7,'2019-08-06',2,2,1);

drop table if exists Items;
create table Items(item_id int, item_brand varchar(255));
insert into Items(item_id, item_brand) values (1,'Samsung'),(2,'Lenovo'),(3,'LG'),(4,'HP');   


with temp as (
select seller_id, min(order_date) as second_date
from Orders t
where order_date not in (select min(t1.order_date)
from Orders t1 
where t1.seller_id=t.seller_id)
group by seller_id)     
 

select u.user_id as seller_id, (case when item_brand=favorite_brand then 'yes' else 'no' end ) as snd_item_fav_brand  
from Users u left join (
select a1.*, item_brand from Items i join ( 
  select  tt.item_id, tt.seller_id as id, te1.seller_id,te1.second_date  
from Orders tt
 join temp te1 on tt.seller_id=te1.seller_id and  tt.order_date=te1.second_date )a1
on i.item_id=a1.item_id 
)a2 on a2.id=u.user_id 

