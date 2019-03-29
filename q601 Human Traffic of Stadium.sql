#601. Human Traffic of Stadium
#write a query to display the records which have 3 or more consecutive rows and the amount of people more than 100(inclusive).
drop table if exists q601stadium;
Create table If Not Exists q601stadium (id int, date DATE NULL, people int);
Truncate table q601stadium;
insert into q601stadium values ('1', '2017-01-01', '10');
insert into q601stadium values ('2', '2017-01-02', '109');
insert into q601stadium values ('3', '2017-01-03', '150');
insert into q601stadium values ('4', '2017-01-04', '99');
insert into q601stadium values ('5', '2017-01-05', '145');
insert into q601stadium values ('6', '2017-01-06', '1455');
insert into q601stadium values ('7', '2017-01-07', '199');
insert into q601stadium values ('8', '2017-01-08', '188');



#way1:
select distinct t3.* 
from q601stadium t1, q601stadium t2, q601stadium t3
where ((datediff(t1.date,t3.date)=1 and datediff(t3.date,t2.date)=1) or (datediff(t2.date,t1.date)=1 and datediff(t3.date,t2.date)=1)
or (datediff(t2.date,t1.date)=1 and datediff(t1.date,t3.date)=1))
and t1.people>=100 
and t2.people>=100 
and t3.people>=100 
order by date

#way2:
select id,date,people
from 
(
select id,date,people, lead(people,1)  over (order by id) as lead1,lead(people,2)  over (order by id) as lead2#(order by id)
from q601stadium t1 
)a
where 
people>=100 
and lead1>=100 
and lead2>=100 

union 

select id,date,people
from 
(
select id,date,people, lag(people,1) over (order by id) as lag1, lag(people,2)  over (order by id) as lag2#(order by id)
from q601stadium t2 
)b
where 
people>=100 
and lag1>=100 
and lag2>=100 