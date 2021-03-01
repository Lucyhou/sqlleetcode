drop table if exists Friendship;
CREATE TABLE  Friendship(user1_id int, user2_id int);
insert into Friendship(user1_id, user2_id) values ('1', '2'),('1', '3'),('1', '4'),('2', '3'),('2', '4'),('2', '5'),('6', '1'),
('7', '11'),('8', '12');

drop table if exists Likes;
CREATE TABLE  Likes(user_id int, page_id int);
insert into Likes(user_id, page_id) values ('1', '88'),('2', '23'),('3', '24'),('4', '56'),('5', '11'),
('6', '33'),('2', '77'),('3', '77'),('6', '88'),('7', '88');

#way1:
Select distinct page_id recommended_page
From 
 (Select  user2_id
From(
SELECT user1_id, user2_id
From Friendship f
Union 
SELECT user2_id, user1_id
From Friendship f1)a
Where user1_id=1)b left join Likes t on b.user2_id=t.user_id
Where page_id not in (select page_id from Likes t1 where user_id =1)


#consider null:
Select  distinct page_id recommended_page, a1.user1_id
From  
(
SELECT user1_id, user2_id
From Friendship f
Union 
SELECT user2_id, user1_id
From Friendship f1)a1
left join Likes t1 on a1.user2_id=t1.user_id
Where page_id not in (select page_id from Likes t1 where user_id =a1.user1_id)
order by a1.user1_id

