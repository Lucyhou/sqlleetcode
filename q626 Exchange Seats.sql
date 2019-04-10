#626. Exchange Seats

drop table if exists q626seat;
Create table If Not Exists q626seat(id int, student varchar(255));
Truncate table q626seat;
insert into q626seat values ('1', 'Abbot');
insert into q626seat values ('2', 'Doris');
insert into q626seat values ('3', 'Emerson');
insert into q626seat values ('4', 'Green');
insert into q626seat values ('5', 'Jeames');

select*
from(
select case when mod(s1.id,2)=0 then s1.id-1
     when mod(s1.id,2)=1 and s1.id in(select max(id) from q626seat s2) then s1.id
      else s1.id+1 end as id, s1.student
from q626seat s1)a
order by id 
 
 
