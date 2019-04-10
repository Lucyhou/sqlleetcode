#613. Shortest Distance in a Line

drop table if exists q613point;
CREATE TABLE If Not Exists  q613point (x INT NOT NULL, UNIQUE INDEX x_UNIQUE (x ASC));
Truncate table  q613point;
insert into  q613point values ('-1');
insert into  q613point values ('0');
insert into  q613point values ('2');
select min(sqrt(pow(p1.x-p2.x,2)))
from q613point p1, q613point p2
where p1.x!=p2.x