#610. Triangle Judgement
drop table if exists q610triangle;
Create table If Not Exists q610triangle (x int, y int, z int);
Truncate table q610triangle;
insert into q610triangle values ('13', '15', '30');
insert into q610triangle values ('10', '20', '15');

select  x,y,z,CASE WHEN x + y > z AND x + z > y AND y + z > x THEN 'Yes'
        ELSE 'No' END AS 'triangle'
FROM q610triangle