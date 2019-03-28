#262. Trips and Users
drop table if exists q262Trips;
drop table if exists q262Users;

Create table If Not Exists q262Trips (Id int, Client_Id int, Driver_Id int, City_Id int, Status ENUM('completed', 'cancelled_by_driver', 'cancelled_by_client'), Request_at varchar(50));
Create table If Not Exists q262Users (Users_Id int, Banned varchar(50), Role ENUM('client', 'driver', 'partner'));
Truncate table q262Trips;
insert into q262Trips values ('1', '1', '10', '1', 'completed', '2013-10-01');
insert into q262Trips values ('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01');
insert into q262Trips values ('3', '3', '12', '6', 'completed', '2013-10-01');
insert into q262Trips values ('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01');
insert into q262Trips values ('5', '1', '10', '1', 'completed', '2013-10-02');
insert into q262Trips values ('6', '2', '11', '6', 'completed', '2013-10-02');
insert into q262Trips values ('7', '3', '12', '6', 'completed', '2013-10-02');
insert into q262Trips values ('8', '2', '12', '12', 'completed', '2013-10-03');
insert into q262Trips values ('9', '3', '10', '12', 'completed', '2013-10-03');
insert into q262Trips values ('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03');
Truncate table q262Users;
insert into q262Users values ('1', 'No', 'client');
insert into q262Users values ('2', 'Yes', 'client');
insert into q262Users values ('3', 'No', 'client');
insert into q262Users values ('4', 'No', 'client');
insert into q262Users values ('10', 'No', 'driver');
insert into q262Users values ('11', 'No', 'driver');
insert into q262Users values ('12', 'No', 'driver');
insert into q262Users values ('13', 'No', 'driver');


select t.Request_at as day,round(sum(case when status like 'cancelled%' then 1 else 0 end)/count(*), 2) as 'Cancellation Rate'
from q262Trips t, q262Users u
where u.Users_id = t.Client_id 
and u.Banned = 'No'
and t.Request_at between '2013-10-01' and '2013-10-03'
group by t.Request_at



