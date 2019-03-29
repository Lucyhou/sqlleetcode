#579. Find Cumulative Salary of an Employee
#Write a SQL to get the cumulative sum of an employee’s salary over a period of 3 months but exclude the most recent month.
drop table if exists q579Employee;
Create table If Not Exists q579Employee (Id int, Month int, Salary int);
Truncate table q579Employee;
insert into q579Employee values ('1', '1', '20');
insert into q579Employee values ('2', '1', '20');
insert into q579Employee values ('1', '2', '30');
insert into q579Employee values ('2', '2', '30');
insert into q579Employee values ('3', '2', '40');
insert into q579Employee values ('1', '3', '40');
insert into q579Employee values ('3', '3', '60');
insert into q579Employee values ('1', '4', '60');
insert into q579Employee values ('3', '4', '70');

select *
from q579Employee
order by id, month desc

#way1:
select id,Month, 
 sum(salary) over (partition by id order by id, Month rows unbounded preceding)   as Salary
from 
( select id,Month,Salary 
from q579Employee t2 
where (id,Month) not in (select id,max(Month)
               from q579Employee t3 
                     group by id) )a
order by id,Salary desc


#way2:
select id,lMonth as Month, ss as Salary
from(
select id,lead(Month,1) over (partition by Id order by Month desc) as lMonth,Salary,sum(Salary) over (partition by id order by Month desc rows BETWEEN 1 following AND UNBOUNDED FOLLOWING ) as ss
from q579Employee)a
where ss is not null


#way3:
select id,Month,sum(Salary) over (partition by id rows BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING ) as ss
from(
select id,lMonth as Month,lsalary as Salary   
from(
select id,Month,lead(Month,1) over (partition by Id order by Month desc) as lMonth,Salary,lead(Salary,1) over (partition by Id order by Month desc) as lsalary
from q579Employee
)a 
where lsalary is not null)b



