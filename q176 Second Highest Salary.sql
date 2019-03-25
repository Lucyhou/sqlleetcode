#176. Second Highest Salary
drop table if exists q176Employee;
Create table If Not Exists q176Employee (Id int, Salary int);
Truncate table q176Employee;
insert into q176Employee values ('1', '100');
insert into q176Employee values ('2', '200');
insert into q176Employee values ('3', '300');
insert into q176Employee values ('4', '300');

#way1:
select max(Salary) as SecondHighestSalary
from q176Employee e1
where Salary not in (select max(Salary)
             from q176Employee e2)
             
             

#way2: windows function
SELECT a.Salary AS SecondHighestSalary
from
(SELECT Salary, dense_RANK() OVER (ORDER BY Salary DESC) as ranking
FROM q176Employee e3
)a
WHERE ranking = 2



