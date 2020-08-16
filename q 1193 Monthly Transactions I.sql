# 1193 Monthly Transactions I
#Write an SQL query to find for each month and country, the number of transactions and their total amount, 
#the number of approved transactions and their total amount.
drop table if exists Transactions;
create table Transactions(id int, country varchar(255), state varchar(255), amount decimal, trans_date date );
insert into Transactions(id , country , state , amount, trans_date) values (121,'US','approved',1000,'2018-12-18'),
(122,'US','declined',2000,'2018-12-19'),(123,'US','approved',2000,'2019-01-01'),(124,'DE','approved',2000,'2019-01-07');



Select DATE_FORMAT(trans_date, "%Y-%m") as month_amount, country
,Count(distinct id) as trans_count, 
sum(case when state='approved' then 1 else 0 END) as approved_count
, Count(amount) as trans_total_amount
, sum(case when state='approved' then amount else 0 end) 
as approved_total_amount
from Transactions
group by DATE_FORMAT(trans_date, "%Y-%m"), country

