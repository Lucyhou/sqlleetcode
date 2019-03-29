#607. Sales Person 
#Output all the names in the table salesperson, who didn’t have sales to company 'RED'.
drop table if exists q607salesperson;
drop table if exists q607orders;
drop table if exists q607company;
Create table If Not Exists q607salesperson (sales_id int, name varchar(255), salary int,commission_rate int, hire_date varchar(255));
Create table If Not Exists q607company (com_id int, name varchar(255), city varchar(255));
Create table If Not Exists q607orders (order_id int, date varchar(255), com_id int, sales_id int, amount int);
Truncate table q607salesperson;
insert into q607salesperson values ('1', 'John', '100000', '6', '4/1/2006');
insert into q607salesperson values ('2', 'Amy', '12000', '5', '5/1/2010');
insert into q607salesperson values ('3', 'Mark', '65000', '12', '12/25/2008');
insert into q607salesperson values ('4', 'Pam', '25000', '25', '1/1/2005');
insert into q607salesperson values ('5', 'Alex', '5000', '10', '2/3/2007');
Truncate table q607company;
insert into q607company values ('1', 'RED', 'Boston');
insert into q607company values ('2', 'ORANGE', 'New York');
insert into q607company values ('3', 'YELLOW', 'Boston');
insert into q607company values ('4', 'GREEN', 'Austin');
Truncate table q607orders;
insert into q607orders values ('1', '1/1/2014', '3', '4', '10000');
insert into q607orders values ('2', '2/1/2014', '4', '5', '5000');
insert into q607orders values ('3', '3/1/2014', '1', '1', '50000');
insert into q607orders values ('4', '4/1/2014', '1', '4', '25000');



select s.name 
from q607salesperson s 
where s.sales_id not in (select o.sales_id from q607orders o, q607company c where o.com_id = c.com_id and c.name = 'RED')
