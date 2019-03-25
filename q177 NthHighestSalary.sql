drop table if exists q177Employee;
Create table If Not Exists q177Employee (Id int, Salary int);
Truncate table q177Employee;
insert into q177Employee values ('1', '100');
insert into q177Employee values ('2', '200');
insert into q177Employee values ('3', '300');
insert into q177Employee values ('4', '300');
insert into q177Employee values ('5', '600');
insert into q177Employee values ('6', '150');

#way1:
select distinct Salary as NthHighestSalary
from q177Employee e1
order by Salary desc
limit 1
offset N-1


#way2: windows function
SELECT a.Salary AS NthHighestSalary
from
(SELECT Salary, dense_RANK() OVER (ORDER BY Salary DESC) as ranking
FROM q177Employee e3
)a
WHERE ranking = N