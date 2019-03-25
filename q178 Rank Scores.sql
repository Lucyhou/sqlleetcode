#178 Rank Scores
#Write a SQL query to rank scores. If there is a tie between two scores, both should have the same ranking.
# Note that after a tie, the next ranking number should be the next consecutive 
#integer value. In other words, there should be no “holes” between ranks.
drop table if exists 	q178Scores;
Create table If Not Exists q178Scores (Id int, Score DECIMAL(3,2));
Truncate table q178Scores;
insert into q178Scores values ('1', '3.5');
insert into q178Scores values ('2', '3.65');
insert into q178Scores values ('3', '4.0');
insert into q178Scores values ('4', '3.85');
insert into q178Scores values ('5', '4.0');
insert into q178Scores values ('6', '3.65');

#way1
SELECT Score, Dense_rank() over (order by Score desc) as rk
FROM q178Scores s1

# way2:
SELECT Score, (select count(distinct Score) FROM q178Scores s1 WHERE s1.Score >= s2.Score) as rk
FROM q178Scores s2
order by Score desc