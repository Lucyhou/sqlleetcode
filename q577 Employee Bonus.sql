#577 Employee Bonus 
drop table if exists q577Employee;
drop table if exists q577Bonus;
Create table If Not Exists q577Employee (EmpId int, Name varchar(255), Supervisor int, Salary int);
Create table If Not Exists q577Bonus(EmpId int, Bonus int);
Truncate table q577Employee;
insert into q577Employee values ('3', 'Brad', null, '4000');
insert into q577Employee values ('1', 'John', '3', '1000');
insert into q577Employee values ('2', 'Dan', '3', '2000');
insert into q577Employee values ('4', 'Thomas', '3', '4000');
Truncate table q577Bonus;
insert into q577Bonus values ('2', '500');
insert into q577Bonus values ('4', '2000');



select name, ifnull(bonus,0)
from q577Employee a 
left outer join q577Bonus b on a.empid = b.empid
where bonus<1000 or bonus is null

