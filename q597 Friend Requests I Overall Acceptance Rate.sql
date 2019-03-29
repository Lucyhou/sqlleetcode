#597. Friend Requests I: Overall Acceptance Rate 
#Write a query to find the overall acceptance rate of requests rounded to 2 decimals, 
#which is the number of acceptance divide the number of requests.
drop table if exists q597friend_request;
drop table if exists q597request_accepted;
Create table If Not Exists q597friend_request (sender_id INT NOT NULL, send_to_id INT NULL, request_date DATE NULL);
Create table If Not Exists q597request_accepted (requester_id INT NOT NULL, accepter_id INT NULL, accept_date DATE NULL);
Truncate table q597friend_request;
insert into q597friend_request values ('1', '2', '2016/06/01');
insert into q597friend_request values ('1', '3', '2016/06/01');
insert into q597friend_request values ('1', '4', '2016/06/01');
insert into q597friend_request values ('2', '3', '2016/06/02');
insert into q597friend_request values ('3', '4', '2016/06/09');
insert into q597friend_request values ('1', '2', '2016/06/02');
Truncate table q597request_accepted;
insert into q597request_accepted values ('1', '2', '2016/06/03');
insert into q597request_accepted values ('1', '3', '2016/06/08');
insert into q597request_accepted values ('2', '3', '2016/06/08');
insert into q597request_accepted values ('3', '4', '2016/06/09');
insert into q597request_accepted values ('3', '4', '2016/06/10');

select 
round(ifnull((select count(distinct requester_id, accepter_id) cn1
from  q597request_accepted r),0) /
(select count( distinct sender_id, send_to_id)
from q597friend_request f),2) as accept_rate

