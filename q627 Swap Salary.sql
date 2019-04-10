#627. Swap Salary

drop table if exists q627salary;
create table if not exists q627salary(id int, name varchar(100), sex char(1), salary int);
Truncate table q627salary;
insert into q627salary values ('1', 'A', 'm', '2500');
insert into q627salary values ('2', 'B', 'f', '1500');
insert into q627salary values ('3', 'C', 'm', '5500');
insert into q627salary values ('4', 'D', 'f', '500');

select s.id,s.name, case when sex='f' then 'm' else 'f' end as sex, salary
from  q627salary s