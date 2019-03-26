#185. Department Top Three Salaries
drop table if exists q185Employee;
drop table if exists q185Department;
Create table If Not Exists q185Employee (Id int, Name varchar(255), Salary int, DepartmentId int);
Create table If Not Exists q185Department (Id int, Name varchar(255));
Truncate table q185Employee;
insert into q185Employee values (1,'Joe',85000,1);
insert into q185Employee values (2,'Henry',80000,2);
insert into q185Employee values (3,'Sam',60000,2);
insert into q185Employee values (4,'Max',90000,1);
insert into q185Employee values (5,'Janet',69000,1);
insert into q185Employee values (6,'Randy',85000,1);
insert into q185Employee values (7,'Will',70000,1);
Truncate table q185Department;
insert into q185Department values ('1', 'IT');
insert into q185Department values ('2', 'Sales');


#way1:
select d.Name as Department,Employee,Salary
from q185Department d join
(select e1.Id,e1.Name as Employee,e1.Salary,e1.DepartmentId
from q185Employee e1
where 3>=(
select count(distinct Salary)
from q185Employee e2
where e1.Salary<=e2.Salary
and e1.DepartmentId= e2.DepartmentId
group by e2.DepartmentId
 ))a on d.Id=a.DepartmentId
 order by Department, Salary desc
 
 
 #way2:
select  Department, Employee,Salary
from
(select d.Name as Department, e.Name as Employee, Salary
,dense_rank () over (partition by DepartmentId order by Salary desc) as rak
from q185Department d join q185Employee e on d.Id=e.DepartmentId)a
where rak<=3