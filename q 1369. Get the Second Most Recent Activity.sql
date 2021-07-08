
drop table if exists UserActivity;
CREATE TABLE   UserActivity(username varchar(25), activity varchar(25), startDate Date, endDate Date);

insert into UserActivity values ('Alice','Travel','2020-02-12', '2020-02-20'),('Alice','Dancing','2020-02-21', '2020-02-23'),
('Alice','Travel','2020-02-24', '2020-02-28'),('Bob','Travel','2020-02-11', '2020-02-18');

With te as(
Select u.*, rank() over (partition by u.username order by endDate desc) rk
From UserActivity u
)

Select * 
From te te1
Where 1 in (select max(rk) from te te2 where te2.username=te1.username)
or rk=2

#way 2:
With tem as(
Select username, count(distinct startDate) as cn
From UserActivity u
Group by username
)

(Select u1.*
From UserActivity u1 join tem t on u1.username=t.username
Where cn=1)
Union 
(Select u2.* 
From UserActivity u2 join tem t1 on u2.username=t1.username
Where cn>1 
And endDate in (select Max(endDate)
                  from UserActivity u3
                  Where endDate < (select Max(endDate)
                    from UserActivity u4)
)
)