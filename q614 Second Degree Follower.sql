#614. Second Degree Follower

drop table if exists q614follow;
Create table If Not Exists q614follow (followee varchar(255), follower varchar(255));
Truncate table q614follow;
insert into q614follow values ('A', 'B');
insert into q614follow values ('B', 'C');
insert into q614follow values ('B', 'D');
insert into q614follow values ('D', 'E');



select followee as follower,count(follower) as num
from q614follow f1
group by followee
having followee in (select follower
                     from  q614follow f2)
                     
