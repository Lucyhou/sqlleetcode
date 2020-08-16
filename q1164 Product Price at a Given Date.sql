#1164 Product Price at a Given Date
drop table if exists Products;
create table Products(product_id int, new_price int ,change_date date);
insert into Products(product_id , new_price  ,change_date ) values (1,20,'2019-08-14'),
(2,50,'2019-08-14'),(1,30,'2019-08-15'),(1,35,'2019-08-16'),(2,65,'2019-08-17'),(3,20,'2019-08-18');

#way1:
with t as(
Select  p1.product_id,a.m_date,new_price  #product_id, price
From Products p1 join
(  Select product_id, max(change_date) as m_date
From Products
Where change_date<='2019-08-16'
Group by product_id)a on p1.product_id=a.product_id and p1.change_date=a.m_date
)

select distinct p2.product_id, ifnull(t.new_price,10) as price
from Products p2 left join t on p2.product_id=t.product_id

#way2:
with tt as(
select pp.product_id, pp.new_price
from Products pp
where (pp.product_id, pp.change_date) in
(select p.product_id, max(p.change_date) as change_date
from Products p where p.change_date <= '2019-08-16'
group by p.product_id)
)
select distinct p3.product_id, ifnull(tt.new_price,10) as price
from Products p3 left join tt on p3.product_id=tt.product_id
