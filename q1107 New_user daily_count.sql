drop table if exists Traffic;
create table Traffic(user_id int, activity varchar(25),activity_date date);
insert into Traffic(user_id, activity,activity_date ) values (1,'login','2019-05-01'),(1,'homepage','2019-05-01'),(1,'logout','2019-05-01'),
(1,'login','2019-05-04'),(1,'logout','2019-05-05'),(2,'login','2019-05-01'),(2,'homepage','2019-05-01'),(2,'logout','2019-05-01'),
(3,'login','2019-05-02'),(3,'homepage','2019-05-02'),(3,'logout','2019-05-03'),(4,'login','2019-05-02'),(4,'homepage','2019-05-02'),
(4,'logout','2019-05-02'),(5,'login','2019-05-02'),(5,'homepage','2019-05-02'),(5,'logout','2019-05-02'),
(6,'login','2019-06-02'),(6,'homepage','2019-06-02'),(6,'logout','2019-06-02'),(6,'login','2019-06-07'),(7,'login','2019-06-08'),
(8,'login','2019-01-07');




Select t1.activity_date, count(distinct aa.user_id)
From 
(Select user_id, min(activity_date) m_date
From Traffic t
Where activity= 'login'  
Group by user_id)aa  right join Traffic t1 on 
aa.user_id=t1.user_id and aa.m_date=t1.activity_date
where DATEDIFF('2019-06-30', activity_date) <= 90
 #activity_date>DATE_ADD('2019-06-30', INTERVAL -90 day)
group by t1.activity_date
