#618. Students Report by Geography

drop table if exists q618student;
Create table If Not Exists q618student (name varchar(50), continent varchar(7));
Truncate table q618student;
insert into q618student values ('Jane', 'America');
insert into q618student values ('Pascal', 'Europe');
insert into q618student values ('Xi', 'Asia');
insert into q618student values ('Jack', 'America');

Select max(case when continent='America' then name else null end) as America,
       max(case when continent='Asia' then name else null end) as asia,
           max(case when continent='Europe' then name else null end) as Europe 
from(
select continent, name,
row_number () over (partition by continent order by name) as rn
from q618student)a
group by rn
