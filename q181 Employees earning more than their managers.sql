#181 Employees earning more than their managers
drop table if exists q181Employee;
Create table If Not Exists q181Employee (Id int, Name varchar(255), Salary int, ManagerId int);
Truncate table q181Employee;
insert into q181Employee values ('1', 'Joe', '70000', '3');
insert into q181Employee values ('2', 'Henry', '80000', '4');
insert into q181Employee values ('3', 'Sam', '60000', null);
insert into q181Employee values ('4', 'Max', '90000', null);


select e1.Name as Employee
from q181Employee e1, q181Employee  e2
where e1.Salary>e2.Salary
and e1.Managerid=e2.Id
