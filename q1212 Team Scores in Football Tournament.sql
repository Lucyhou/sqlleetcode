#q 1212 Team Scores in Football Tournament
/*Table: Teams

+---------------+----------+
| Column Name   | Type     |
+---------------+----------+
| team_id       | int      |
| team_name     | varchar  |
+---------------+----------+
team_id is the primary key of this table.
Each row of this table represents a single football team.

Table: Matches
+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| match_id      | int     |
| host_team     | int     |
| guest_team    | int     | 
| host_goals    | int     |
| guest_goals   | int     |
+---------------+---------+
match_id is the primary key of this table.
Each row is a record of a finished match between two different teams. 
Teams host_team and guest_team are represented by their IDs in the teams table (team_id) and 
they scored host_goals and guest_goals goals respectively.
 
You would like to compute the scores of all teams after all matches. Points are awarded as
 follows:
A team receives three points if they win a match (Score strictly more goals than the opponent
 team).
A team receives one point if they draw a match (Same number of goals as the opponent team).
A team receives no points if they lose a match (Score less goals than the opponent team).

*/

drop table if exists Teams;
create table Teams(team_id int, team_name varchar(255));
insert into Teams(team_id, team_name) values (10,'Leetcode FC'),(20,'NewYork FC'),(30,'Atlanta FC'),
(40,'Chicago FC'),(50,'Toronto FC ');
drop table if exists Matches;
create table Matches(match_id int, host_team int, guest_team int, host_goals int, guest_goals int);
insert into Matches(match_id , host_team, guest_team, host_goals, guest_goals) values (1,10,20,3,0),
(2,30,10,2,2),(3,10,50,5,1),(4,20,30,1,0),(5,50, 30,1,0);





With scoretem as
(select m.*, case when host_goals=guest_goals then 1 
            when host_goals> guest_goals  then 3
            else 0 end as host_scores,
case when host_goals=guest_goals then 1 
            when host_goals> guest_goals  then 0
            else 3 end as guest_scores
from Matches m),

mteps as(
Select host_team as team_id, host_scores as score
From scoretem

Union all
Select guest_team as team_id, guest_scores as score
From scoretem s1)

#select * from mteps

Select team_id, team_name, sum(score) as num_points
From(
select t.*, ifnull(score,0) as score
From Teams t left join mteps mt on t.team_id=mt.team_id
)a
Group by team_id, team_name
Order by sum(score) desc, team_id asc

