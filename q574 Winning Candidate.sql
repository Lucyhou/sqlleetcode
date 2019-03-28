#574. Winning Candidate
#Write a sql to find the name of the winning candidate, the above example will return the winner B.
drop table if exists q574Candidate;
drop table if exists q574Vote;
Create table If Not Exists q574Candidate (id int, Name varchar(255));
Create table If Not Exists q574Vote (id int, CandidateId int);
Truncate table q574Candidate;
insert into q574Candidate values ('1', 'A');
insert into q574Candidate values ('2', 'B');
insert into q574Candidate values ('3', 'C');
insert into q574Candidate values ('4', 'D');
insert into q574Candidate values ('5', 'E');
Truncate table q574Vote;
insert into q574Vote values ('1', '2');
insert into q574Vote values ('2', '4');
insert into q574Vote values ('3', '3');
insert into q574Vote values ('4', '2');
insert into q574Vote values ('5', '5');


select Name
from 
q574Candidate c,
(select CandidateId
from  q574Vote v1
group by CandidateId
order by count(distinct id) desc
limit 1)a
where c.id=a.CandidateId