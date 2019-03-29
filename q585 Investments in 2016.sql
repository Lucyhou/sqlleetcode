#585. Investments in 2016
drop table if exists q585insurance;
CREATE TABLE IF NOT EXISTS q585insurance (PID INTEGER(11), TIV_2015 NUMERIC(15,2), TIV_2016 NUMERIC(15,2), LAT NUMERIC(5,2), LON NUMERIC(5,2) );
Truncate table q585insurance;
insert into q585insurance values ('1', '10', '5', '10', '10');
insert into q585insurance values ('2', '20', '20', '20', '20');
#insert into q585insurance values ('5', '15', '20', '20', '30');
insert into q585insurance values ('3', '10', '30', '20', '20');
insert into q585insurance values ('4', '10', '40', '40', '40');
#insert into q585insurance values ('6', '15', '20', '30', '30');

select ROUND(SUM(TIV_2016),2)
from q585insurance t
where TIV_2015 in( 
select TIV_2015
from q585insurance t1
GROUP BY TIV_2015     
having count(TIV_2015)>=1
)
and (LAT,LON) in( 
select LAT,LON
from q585insurance t2
GROUP BY LAT,LON
having count(CONCAT(LAT,LON))=1  
 )
