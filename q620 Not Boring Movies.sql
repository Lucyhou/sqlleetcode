#620. Not Boring Movies

drop table if exists q620cinema;
Create table If Not Exists q620cinema (id int, movie varchar(255), description varchar(255), rating float(2, 1));
Truncate table q620cinema;
insert into q620cinema values ('1', 'War', 'great 3D', '8.9');
insert into q620cinema values ('2', 'Science', 'fiction', '8.5');
insert into q620cinema values ('3', 'irish', 'boring', '6.2');
insert into q620cinema values ('4', 'Ice song', 'Fantacy', '8.6');
insert into q620cinema values ('5', 'House card', 'Interesting', '9.1');

select id,movie,description,rating
from q620cinema
where mod(id,2)=1 and description!='boring'
order by rating