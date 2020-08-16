#1194. Tournament Winners
#The winner in each group is the player who scored the maximum total points within the group. 
#In the case of a tie, the lowest player_id wins.
#Write an SQL query to find the winner in each group.

drop table if exists Players ;
create table Players(player_id int, group_id int);
insert into Players(player_id, group_id) values (15,1),(25,1),(30,1),(45,1),(10,2),(35,2),(50,2),(20,3),(40,3);

drop table if exists Matches;
create table Matches (match_id int, first_player int,second_player int,first_score int,second_score int);
insert into Matches(match_id , first_player,second_player,first_score,second_score) values 
(1,15,45,3,0),(2,30,25,1,2),(3,30,15,2,0),(4,40,20,5,2),(5,35,50,1,1);

With temp as(
Select p.group_id ,p.player_id, mm.score
From Players p join
( select match_id, first_player as player_id, first_score as score
From Matches
Union 
select match_id, second_player, second_score
From Matches m
)mm on p.player_id =mm.player_id
),
temp2 as(
Select group_id, player_id, sum(score) as totalscore
From temp tt
Group by group_id, player_id)

Select group_id, min(player_id) as play_id
From
(
Select group_id, player_id, totalscore
From temp2 t
Where totalscore in (select max(totalscore) From temp2 t1  group by group_id )
)t2
Group by group_id
