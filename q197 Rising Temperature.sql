#197. Rising Temperature
drop table if exists q197Weather;
Create table If Not Exists q197Weather (Id int, RecordDate date, Temperature int);
Truncate table q197Weather;
insert into q197Weather values ('1', '2015-01-01', '10');
insert into q197Weather values ('2', '2015-01-02', '25');
insert into q197Weather values ('3', '2015-01-03', '20');
insert into q197Weather values ('4', '2015-01-04', '30');


#way1:
select w2.Id
from q197Weather w1, q197Weather w2 
where w1.Id+1=w2.Id and w2.Temperature>w1.Temperature

#way2:
select Id
from
(select w.*,lag(Temperature,1)over (order by Id) as lagg
from q197Weather w)a
where lagg<Temperature