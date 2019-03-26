#184. Department Highest Salary
drop table if exists q184Employee;
drop table if exists q184Department;
Create table If Not Exists q184Employee (Id int, Name varchar(255), Salary int, DepartmentId int);
Create table If Not Exists q184Department (Id int, Name varchar(255));
Truncate table q184Employee;
insert into q184Employee values ('1', 'Joe', '70000', '1');
insert into q184Employee values ('2', 'Jim', '90000', '1');      
insert into q184Employee values ('3', 'Henry', '80000', '2');   
insert into q184Employee values ('4', 'Sam', '60000', '2');
insert into q184Employee values ('5', 'Max', '90000', '1');
Truncate table q184Department;
insert into q184Department values ('1', 'IT');
insert into q184Department values ('2', 'Sales');


select d.Name as Department, Employee, Salary
from q184Department d left join 
(
select DepartmentId, Name as Employee,Salary
from q184Employee e
where Salary in (select max(Salary)
              from q184Employee e2
			group by DepartmentId
            )
)a on d.Id=a.DepartmentId
order by d.Id