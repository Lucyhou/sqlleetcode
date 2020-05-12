/*1050 Actors and Directors Who Cooperated At Least Three Times 
Table: ActorDirector


+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| actor_id    | int     |
| director_id | int     |
| timestamp   | int     |
+-------------+---------+
timestamp is the primary key column for this table.
Write a SQL query for a report that provides the pairs (actor_id, director_id) where the actor have cooperated with the director at least 3 times.
ActorDirector table:
+-------------+-------------+-------------+
| actor_id    | director_id | timestamp   |
+-------------+-------------+-------------+
| 1           | 1           | 0           |
| 1           | 1           | 1           |
| 1           | 1           | 2           |
| 1           | 2           | 3           |
| 1           | 2           | 4           |
| 2           | 1           | 5           |
| 2           | 1           | 6           |
+-------------+-------------+-------------+
	Result table:
	+-------------+-------------+
	| actor_id    | director_id |
	+-------------+-------------+
	| 1           | 1           |
	+-------------+-------------+
	The only pair is (1, 1) where they cooperated exactly 3 time

*/


drop table if exists ActorDirector;
create table ActorDirector(actor_id int, director_id int,timestampp int);
insert into ActorDirector(actor_id, director_id, timestampp) values (1,1,0),(1,1,1),(1,1,2),(1,2,3),(1,2,4),(1,2,6),(2,1,5),(2,1,8);


Select actor_id, director_id
From ActorDirector
Group by actor_id, director_id
Having count(distinct timestampp)>=3  # same to Having count(*)>=3
