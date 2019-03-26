#180. Consecutive Numbers
drop table if exists q180Logs;
create table If Not Exists q180Logs (Id int, Num int);
Truncate table q180Logs;
insert into q180Logs values ('1', '1');
insert into q180Logs values ('2', '1');
insert into q180Logs values ('3', '1');
insert into q180Logs values ('4', '2');
insert into q180Logs values ('5', '1');
insert into q180Logs values ('6', '2');
insert into q180Logs values ('7', '2');

#way1:
SELECT (
Select distinct l1.Num as ConsecutiveNums
from q180Logs l1 ,q180Logs l2, q180Logs l3
where (l1.id+1=l2.id and l2.id+1=l3.id and l1.Num=l2.Num and l2.Num=l3.Num)
or (l1.id+1=l3.id and l3.id+1=l2.id and l1.Num=l2.Num and l2.Num=l3.Num)
or (l3.id+1=l1.id and l1.id+1=l2.id and l1.Num=l2.Num and l2.Num=l3.Num) 
)AS ConsecutiveNums;

#way2:
Select distinct l1.Num as ConsecutiveNums
from q180Logs l1 ,q180Logs l2, q180Logs l3
where (l1.id+1=l2.id and l2.id+1=l3.id and l1.Num=l2.Num and l2.Num=l3.Num)
or (l1.id+1=l3.id and l3.id+1=l2.id and l1.Num=l2.Num and l2.Num=l3.Num)
or (l3.id+1=l1.id and l1.id+1=l2.id and l1.Num=l2.Num and l2.Num=l3.Num)
union
select null
where not exists (Select distinct l1.Num as ConsecutiveNums
from q180Logs l1 ,q180Logs l2, q180Logs l3
where (l1.id+1=l2.id and l2.id+1=l3.id and l1.Num=l2.Num and l2.Num=l3.Num)
or (l1.id+1=l3.id and l3.id+1=l2.id and l1.Num=l2.Num and l2.Num=l3.Num)
or (l3.id+1=l1.id and l1.id+1=l2.id and l1.Num=l2.Num and l2.Num=l3.Num))




