#1148 Article Views  I
#Write an SQL query to find all the authors that viewed at least one of their own articles, sorted in ascending order by their id.

drop table  if exists Views;
Create table Views (article_id int, author_id int, viewer_id int,view_date date);
 
insert into Views(article_id , author_id , viewer_id ,view_date) values ('1', '3','5','2019-08-01'),
('1', '3','6', '2019-08-02'),('2', '7','7', '2019-08-01'),('2', '7','6', '2019-08-02'),('4', '7','1','2019-07-22'),
('3', '4','4', '2019-07-21'),('3', '4','4', '2019-07-21');



Select distinct author_id
From Views
Where author_id=viewer_id
Order by author_id asc


