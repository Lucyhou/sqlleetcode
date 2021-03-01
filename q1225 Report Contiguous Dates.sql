#q1225 Report Contiguous Dates
drop table if exists Failed;
CREATE TABLE  Failed(fail_date Date);

insert into Failed values ('2018-12-28'),('2018-12-29'),('2019-01-04'),('2019-01-05');
        
        
drop table if exists Succeeded;
CREATE TABLE  Succeeded(success_date  Date);

insert into Succeeded values ('2018-12-30'),('2018-12-31'),('2019-01-01'),('2019-01-02'),('2019-01-03'),('2019-01-06');

With temp as(
Select fail_date as datee,  'failed' as period_state  
From  Failed
Union all
Select success_date, 'succeeded' as period_state 
From  Succeeded
Order by datee
)
  ,t2 as(
 select *
 from(
Select t.*, lag(datee,1) over(order by datee) as dat, lag(period_state,1) over(order by datee) as lag_p
From temp t) a

Where period_state!=lag_p or lag_p is null  )

select period_state,case when st_date<'2019-01-01'then '2019-01-01' else st_date end as start_date, end_date
from(
Select  t2. period_state ,  t2.datee as st_date,ifnull(date_add(lead(datee,1) over(order by datee),interval -1 day), t2.datee) as end_date    
From t2 )aa
where end_date >'2019-01-01'

#2
With cte as(
Select fail_date as datee,  'failed' as period_state  
From  Failed
Union all
Select success_date, 'succeeded' as period_state 
From  Succeeded
Order by datee
)
,
tt as(
select period_state,min(datee) as st_date, max(datee) as end_date from(
select period_state, datee, rank() over (partition by period_state order by datee) as ranking, rank() over (order by datee) as id
from cte 
)aa
group by period_state, (id - ranking)
)
select period_state,case when st_date<'2019-01-01'then '2019-01-01' else st_date end as start_date, end_date
from tt
where end_date >'2019-01-01'
