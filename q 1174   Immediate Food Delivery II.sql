#1174   Immediate Food Delivery II
#Write an SQL query to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
drop table if exists Delivery;
create table Delivery(delivery_id int,customer_id int, order_date date, customer_pref_delivery_date date);
insert into Delivery(delivery_id,customer_id, order_date, customer_pref_delivery_date ) 
values (1,1,'2019-08-01','2019-08-02'),(2,2,'2019-08-02','2019-08-02'),(3,1,'2019-08-11','2019-08-12'),
(4,3,'2019-08-24','2019-08-24'),(5,3,'2019-08-21','2019-08-22'),(6,2,'2019-08-11','2019-08-13'),(7,4,'2019-08-09','2019-08-09');


Select 
Round(100*
(
SELECT count(distinct customer_id) 
From Delivery d1
Where order_date= customer_pref_delivery_date
And  order_date in (select min(d2.order_date) from Delivery d2 group by d2.customer_id)
)
 /count(distinct d. customer_id),2 )
 As immediate_percentage
From Delivery d 



