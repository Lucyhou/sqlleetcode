#612. Shortest Distance in a Plane

drop table if exists q612point_2d;
CREATE TABLE If Not Exists q612point_2d (x INT NOT NULL, y INT NOT NULL);
Truncate table q612point_2d;
insert into q612point_2d values ('-1', '-1');
insert into q612point_2d values ('0', '0');
insert into q612point_2d values ('-1', '-2');
select round(min(sqrt(pow(p1.x-p2.x,2)+pow(p1.y-p2.y,2))),2)
from q612point_2d p1, q612point_2d p2
where p1.x<>p2.x  or p1.y!=p2.y

