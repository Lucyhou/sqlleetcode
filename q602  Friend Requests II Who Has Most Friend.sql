#602. Friend Requests II Who Has Most Friend
drop table if exists q602request_accepted;
Create table If Not Exists q602request_accepted ( requester_id INT NOT NULL, accepter_id INT NULL, accept_date DATE NULL);
Truncate table q602request_accepted;
insert into q602request_accepted values ('1', '2', '2016/06/03');
insert into q602request_accepted values ('1', '3', '2016/06/08');
insert into q602request_accepted values ('2', '3', '2016/06/08');
insert into q602request_accepted values ('3', '4', '2016/06/09');
insert into q602request_accepted values ('2', '5', '2016/06/09');

#way1:
select c.requester_id
from
(
select b.requester_id, rank() over (order by b.cn desc)  as rk
from
(
select a.requester_id, count(distinct a.accepter_id) as cn 
from
(
select requester_id, accepter_id
from q602request_accepted t1 
union
select  accepter_id as requester_id, requester_id as accepter_id
from q602request_accepted t2 
)a
group by a.requester_id
)b
)c
where c.rk=1


#way2:
select  requester_id  
from
(
select requester_id, accepter_id
from q602request_accepted t1 
union
select  accepter_id as requester_id, requester_id as accepter_id
from q602request_accepted t2 
)a
group by a.requester_id
having count(distinct a.accepter_id) in (select max(c.cnt)
                                       from (
                                       select count(distinct b.accepter_id) as cnt
                                       from
(
select requester_id, accepter_id
from q602request_accepted t3 
union
select  accepter_id as requester_id, requester_id as accepter_id
from q602request_accepted t4 
)b
group by b.requester_id
)c
)