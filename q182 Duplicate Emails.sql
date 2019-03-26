#182. Duplicate Emails
drop table if exists q182Person;
Create table If Not Exists q182Person (Id int, Email varchar(255));
Truncate table q182Person;
insert into q182Person values ('1', 'a@b.com');
insert into q182Person values ('2', 'c@d.com');
insert into q182Person values ('3', 'a@b.com');
#insert into q182Person values ('4', 'c@d.com');
#insert into q182Person values ('5', 'd@e.com');

select Email
from q182Person p
group by Email
having count(Email)>1

