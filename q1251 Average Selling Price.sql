drop table if exists Prices;
CREATE TABLE  Prices(product_id  int, start_date date,end_date date, price decimal);
insert into Prices(product_id, start_date,end_date, price) values ('1','2019-02-17','2019-02-28','5'),
('1','2019-03-01','2019-03-22','20'),
('2','2019-02-01 ',' 2019-02-20','15'),('2','2019-02-21','2019-03-31','30'),('3','2019-02-17','2019-02-28','5');

drop table if exists UnitsSold;
CREATE TABLE  UnitsSold(product_id  int, purchase_date  date, units int);
insert into UnitsSold(product_id, purchase_date, units ) values ('1','2019-02-25','100'),
('1','2019-03-02','15'),('2','2019-02-10','200'),('2','2019-03-22','30');

  
Select product_id, round(sum(units*price)/sum(units),2) average_price
#select *
From(
Select p.product_id, price,  units
From Prices p left join UnitsSold u on p.product_id=u.product_id
Where purchase_date >= start_date and purchase_date<=end_date)a
Group by 1
