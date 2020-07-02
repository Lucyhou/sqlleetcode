
drop table if exists Actions;
create table Actions(user_id int, post_id int ,action_date varchar(25),actions varchar(25),extra varchar(25));
insert into Actions(user_id , post_id ,action_date ,actions  ) values (1,1,'2020-05-01','view'),
(1,1,'2020-05-01','like'),(1,1,'2020-05-01','share'),(2,4,'2020-06-15','view'),(3,4,'2020-06-14','view')
,(4,3,'2020-06-1','view'),(5,2,'2020-06-14','view'),(5,5,'2020-06-14','view');
insert into Actions(user_id , post_id ,action_date ,actions,extra  ) values (2,4,'2020-06-14','report','spam'),
(3,4,'2020-06-14','report','spam'),(4,3,'2020-06-01','report','spam'),(5,2,'2020-06-14','report','racism'),
(5,5,'2020-06-14','report','racism');


Select extra as report_reason, count(*)as report_count
From Actions a
Where action_date= date_add(CURDATE(),interval -1 day) #and actions='report' 
Group by extra
