#571. Find Median given frequency of Numbers
drop table if exists q571Numbers;
Create table If Not Exists q571Numbers (Number int, Frequency int);
Truncate table q571Numbers;
insert into q571Numbers values ('0', '7');
insert into q571Numbers values ('1', '1');
insert into q571Numbers values ('2', '3');
insert into q571Numbers values ('3', '1');



select round(avg(e1.Number),2)
from q571Numbers e1
where e1.Frequency>=abs((select sum(Frequency) from q571Numbers e2  where e1.Number>=e2.Number)
-(select sum(Frequency) from q571Numbers e2 where e1.Number<=e2.Number))


