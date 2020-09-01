#1204 Last Person to Fit in the Elevator
#Write an SQL query to find the person_name of the last person who will fit in the elevator without exceeding the weight limit.
# It is guaranteed that the person who is first in the queue can fit in the elevator.
drop table if exists Queue;
create table Queue(person_id int, person_name varchar(255),weight decimal,turn int);
insert into Queue(person_id , person_name ,weight ,turn) values 
(5,'George Washington',250,1),(3,'John Adams',350,2),(6,'Thomas Jefferson',400,3),(2,'Will Johnliams',200,4),
(4,'Will Johnliams',175,5),(1,'James Elephant',500,6);

Select person_name
from
(
Select person_name, turn,sum(weight) over (order by turn asc ROWS UNBOUNDED PRECEDING) as total_weight
From Queue
)t
Where total_weight>=1000 
Order by turn asc
Limit 1

