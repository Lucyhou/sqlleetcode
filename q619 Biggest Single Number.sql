#619. Biggest Single Number

drop table if exists q619number;
Create table If Not Exists q619number (num int);
Truncate table q619number;
insert into q619number values ('8');
insert into q619number values ('8');
insert into q619number values ('3');
insert into q619number values ('3');
insert into q619number values ('1');
insert into q619number values ('4');
insert into q619number values ('5');
insert into q619number values ('6');

select max(num) as num
from(
select num
from q619number
group by num
having count(num)=1)a