/*Write an SQL query to find the average for daily percentage of posts that got removed 
after being reported as spam, rounded to 2 decimal places.*/

drop table if exists Actions;
create table Actions(user_id int, post_id int ,action_date date,actions varchar(25),extra varchar(25));
insert into Actions(user_id , post_id ,action_date ,actions) values (1,1,'2019-07-01','view'),(1,1,'2019-07-01','like'),
(1,1,'2019-07-01','share'),(2,2,'2019-07-04','view'),(3,4,'2019-07-04','view'),(4,3,'2019-07-02','view'),(5,2,'2019-07-03','view')
,(5,5,'2019-07-03','view');
insert into Actions(user_id , post_id ,action_date ,actions,extra  ) values (2,2,'2019-07-04','report','spam'),
(3,4,'2019-07-04','report','spam'),(4,3,'2019-07-02','report','spam'),(5,2,'2019-07-04','report','racism'),
(5,5,'2019-07-03','report','racism');

drop table if exists Removals;
create table Removals(post_id int, remove_date date);
insert into Removals(post_id , remove_date) values (2,'2019-07-20'),(3,'2019-07-18');


select round(avg(remove_per),2)*100
from(
select action_date, count(distinct r.post_id)/count(distinct a.post_id) as remove_per
#select*
from Actions a left join Removals r on a.post_id=r.post_id
where extra='spam'
group by action_date
)tem
