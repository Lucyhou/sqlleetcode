#1141. User Activity for the Past 30 Days I
#Write an SQL query to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. 
#A user was active on some day if he/she made at least one activity on that day.
#SELECT 2 FROM DUAL;

drop table Activity;
Create table Activity (user_id int, session_id int, activity_date date, activity_type varchar(20));
 
insert into Activity (user_id, session_id, activity_date, activity_type) values ('1', '1', '2019-07-20', 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('1', '1', '2019-07-20', 'scroll_down');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('1', '1', '2019-07-20', 'end_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('2', '4', '2019-07-20', 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('2', '4', '2019-07-21', 'send_message');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('2', '4', '2019-07-21', 'end_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('3', '2', '2019-07-21', 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('3', '2', '2019-07-21', 'send_message');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('3', '2', '2019-07-21', 'end_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('4', '3', '2019-06-25', 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('4', '3', '2019-06-25', 'end_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('5', '4', '2019-07-19', 'open_session');
insert into Activity (user_id, session_id, activity_date, activity_type) values ('5', '4', '2019-07-19', 'end_session');



select activity_date, count(distinct user_id)
from   Activity 
#where datediff('2019-07-27',activity_date) <=30
where activity_date between date_add('2019-07-27', interval -30 day) and '2019-07-27' #
group by activity_date

#1142. User Activity for the Past 30 Days II
#Write an SQL query to find the average number of sessions per user for a period of 30 days ending 2019-07-27 inclusively,
# rounded to 2 decimal places. The sessions we want to count for a user are those with at least one activity in that time period.

select ifnull(round(count(distinct session_id)/count(distinct user_id),2),0)  as avg_sessions_per_user
from   Activity 
#where datediff('2019-07-27',activity_date) <=30
where activity_date between date_add('2019-07-27', interval -30 day) and '2019-07-27' 

