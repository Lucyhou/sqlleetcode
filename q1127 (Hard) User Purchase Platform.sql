drop table if exists Spending;
CREATE TABLE Spending (
 user_id INT,
  spend_date date,
  platform TEXT,
  amount DECIMAL
);


INSERT INTO Spending
VALUES (1001, DATE '2018/1/1', 'mobile', 100),
      (1001, DATE '2018/1/1', 'desktop', 200),
     (1002, DATE '2018/1/1', 'mobile', 100),
     (1002, DATE '2018/1/2', 'mobile', 100),
     (1003, DATE '2018/1/1', 'desktop', 100),
     (1003, DATE '2018/1/2', 'desktop', 100),
	(1004, DATE '2018/1/3', 'mobile', 100);

select a_0.spend_date,a_0.platform, ifnull(totalcount,0) as total_users, ifnull(sum_amount,0)as total_amount
from
(select *
from
(SELECT distinct spend_date from Spending)ad
join (select 'desktop' AS platform UNION
        SELECT 'mobile' AS platform UNION
        SELECT 'both' AS platform)ap
        ) a_0 
        left join
(
select spend_date,platformtype, count(case when user_id is not null then 1 else null end) as totalcount, sum(amount) as sum_amount
from
(
Select s1.user_id, case when c_p=1 then platform else "both" end as platformtype, c_p, amount,s1.spend_date
From Spending s1 right join
(Select spend_date,user_id, count(distinct platform) c_p
From Spending
Group by spend_date,user_id)a on s1.user_id=a.user_id and s1.spend_date=a.spend_date
)aa1 
group by spend_date,platformtype

)a_1 on a_0.spend_date=a_1.spend_date and a_0.platform=a_1.platformtype


#select * from Spending

