#1173   Immediate Food Delivery I
#Write an SQL query to find the percentage of immediate orders in the table, rounded to 2 decimal places.
drop table if exists Delivery;
create table Delivery(delivery_id int,customer_id int, order_date date, customer_pref_delivery_date date);
insert into Delivery(delivery_id,customer_id, order_date, customer_pref_delivery_date ) 
values (1,1,'2019-08-01','2019-08-02'),(2,5,'2019-08-02','2019-08-02'),(3,1,'2019-08-11','2019-08-11'),
(4,3,'2019-08-24','2019-08-26'),(5,4,'2019-08-21','2019-08-22'),(6,2,'2019-08-11','2019-08-13');

#way1:
Select 
ROUND(100*
(SELECT count(distinct delivery_id) From Delivery 
Where order_date=customer_pref_delivery_date) /count(distinct d.delivery_id),2)
 As immediate_percentage
From Delivery d 

#way2:
select round(100*sum(case when order_date=customer_pref_delivery_date then 1 else 0 end)/count(1), 2) immediate_percentage 
From Delivery