#183. Customers Who Never Order
drop table if exists q183Customers;
drop table if exists q183Orders;
Create table If Not Exists q183Customers (Id int, Name varchar(255));
Create table If Not Exists q183Orders (Id int, CustomerId int);
Truncate table q183Customers;
insert into q183Customers values ('1', 'Joe');
insert into q183Customers values ('2', 'Henry');
insert into q183Customers values ('3', 'Sam');
insert into q183Customers values ('4', 'Max');
Truncate table q183Orders;
insert into q183Orders values ('1', '3');
insert into q183Orders values ('2', '1');


#way1:
select Name as Customers
from q183Customers 
where Id not in (select CustomerId 
                   from q183Orders)
                   
#way2:
select  Name as Customers
from q183Customers c left join q183Orders o  on c.Id=o.CustomerId 
where o.CustomerId is Null