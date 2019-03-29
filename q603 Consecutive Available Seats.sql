#603. Consecutive Available Seats 
Create table If Not Exists q603cinema (seat_id int primary key auto_increment, free bool);
Truncate table q603cinema;
insert into q603cinema values ('1', '1');
insert into q603cinema values ('2', '0');
insert into q603cinema values ('3', '1');
insert into q603cinema values ('4', '1');
insert into q603cinema values ('5', '1');
insert into q603cinema values ('6', '0');
insert into q603cinema values ('7', '1');
insert into q603cinema values ('8', '1');
insert into q603cinema values ('9', '0');
#way1:
select seat_id
from
(
select  seat_id,free,lag(free,1) over (order by seat_id) as lagg
from q603cinema  t1 
union
select  seat_id,free,lead(free,1) over (order by seat_id) as le
from q603cinema  t2 
)a
where a.free=1 and a.lagg=1
order by seat_id

#way2:
select distinct t1.seat_id
from q603cinema  t1, q603cinema  t2
where abs(t1.seat_id-t2.seat_id)=1 and t1.free=1 and t2.free=1
#where (t1.seat_id=t2.seat_id+1 or t1.seat_id+1=t2.seat_id) and t1.free=1 and t2.free=1
order by t1.seat_id
