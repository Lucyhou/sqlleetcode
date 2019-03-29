#596. Classes More Than 5 Students
drop table if exists q596courses;
Create table If Not Exists q596courses (student varchar(255), class varchar(255));
Truncate table q596courses;
insert into q596courses values ('A', 'Math');
insert into q596courses values ('B', 'English');
insert into q596courses values ('C', 'Math');
insert into q596courses values ('D', 'Biology');
insert into q596courses values ('E', 'Math');
insert into q596courses values ('F', 'Computer');
insert into q596courses values ('G', 'Math');
insert into q596courses values ('H', 'Math');
insert into q596courses values ('I', 'Math');
insert into q596courses values ('J', 'Computer');
insert into q596courses values ('K', 'Computer');
insert into q596courses values ('L', 'Computer');
insert into q596courses values ('M', 'Computer');

select class
from q596courses
group by class
having count(DISTINCT student)>=5
