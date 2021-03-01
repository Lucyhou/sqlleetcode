drop table if exists Logss;
CREATE TABLE  Logss(log_id int);
insert into Logss values ('2'),('3'),('4'),('5'),('7'),('8'),('10'),('20');


select a.log_id as sid, min(b.log_id) as eid
from
(select log_id
from Logss l
where log_id-1 not in(select log_id from Logss l1) )a
,
(select log_id
from Logss l3
where log_id+1 not in(select log_id from Logss l4))b
where a.log_id <= b.log_id
group by 1 




