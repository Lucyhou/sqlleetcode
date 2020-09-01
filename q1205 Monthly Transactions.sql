#1205 Month Transactions
drop table if exists Transactions;
create table Transactions(id int, country varchar(25),state varchar(25),amount decimal,trans_date date);
insert into Transactions(id , country, state,amount,trans_date ) values ('101', 'US','approved', '1000','2019-05-18'),
('102', 'US','declined', '2000','2019-05-19'),('103', 'US','approved', '3000','2019-06-10'),
('104', 'US','approved', '4000','2019-06-10'),('105', 'US','approved', '5000','2019-06-15');


drop table if exists Chargebacks;
Create table Chargebacks (trans_id int, trans_date date);
insert into Chargebacks(trans_id ,trans_date) values ('102', '2019-05-29'),('101', '2019-06-30'),('105', '2019-09-18');

select month, country, sum(case when state='approved' and type='app' then 1 else 0 end) as
approved_count, sum(case when state='approved' and type='app' then approve_amount else 0 end) as
approved_amount, sum(case when type='char' then 1 else 0 end) as
chargeback_count , sum(case when type='char' then approve_amount else 0 end) as
chargeback_amount 

from
(
select id, country, state , DATE_FORMAT(trans_date, "%Y-%m") as
 month, case when state='approved' then amount else null end as approve_amount, 'app' as type
 from  Transactions tt
union all
(select c.trans_id, t.country, t.state , DATE_FORMAT(c.trans_date, "%Y-%m") as c_trans_date, case when c.trans_date is not null then amount else null end as chargeback_amount,
'char' as type
from Transactions t right join Chargebacks c on t.id=c.trans_id)
)a
group by month, country