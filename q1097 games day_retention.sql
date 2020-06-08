drop table if exists Activity;
create table Activity(player_id int, device_id int,event_date date,games_played int);
insert into Activity(player_id, device_id,event_date,games_played ) values (1,2,'2016-03-01',5),
(1,2,'2016-03-02',6),(2,2,'2016-03-01',1),(3,1,'2016-06-02',0),(5,1,'2016-06-02',0),(3,4,'2016-06-03',5),(4,6,'2016-08-01',5),
(6,3,'2016-08-01',5),(6,3,'2016-08-02',5),(6,3,'2016-08-03',5),(7,3,'2016-08-02',5),(8,13,'2016-08-02',2),(9,3,'2016-08-01',1);


With tem as(
Select player_id, min(event_date) as install_dt
From Activity
Group by player_id
)

Select #*
install_dt,count(distinct pid) as new_installs #, count(case when player_id is not null then 1 else null end) ascc
,round(sum(case when player_id is not null then 1 else 0 end)/count(distinct pid) ,2)as day1_rention
from(
Select a.player_id, event_date as it,t1.install_dt, t1.player_id as pid
From Activity a  right join tem t1 
on datediff(event_date,t1.install_dt)=1 and t1.player_id=a.player_id 
)aa
Group by install_dt
Order by install_dt
