#615. Average Salary: Departments vs. Company

drop table if exists q615salary;
drop table if exists q615employee;
Create table If Not Exists q615salary (id int, employee_id int, amount int, pay_date date);
Create table If Not Exists q615employee (employee_id int, department_id int);
Truncate table q615salary;
insert into q615salary values ('1', '1', '9000', '2017/03/31');
insert into q615salary values ('2', '2', '6000', '2017/03/31');
insert into q615salary values ('3', '3', '10000', '2017/03/31');
insert into q615salary values ('4', '1', '7000', '2017/02/28');
insert into q615salary values ('5', '2', '6000', '2017/02/28');
insert into q615salary values ('6', '3', '8000', '2017/02/28');
Truncate table q615employee;
insert into q615employee values ('1', '1');
insert into q615employee values ('2', '2');
insert into q615employee values ('3', '2');

select a.pay_month,a.department_id,
case when davg>cavg then 'higher' when  davg<cavg  then 'lower' else 'same' end as comparsion

from
(select date_format(pay_date,'%Y-%m') as pay_month, department_id, avg(amount) as davg
from q615salary s join q615employee e on s.employee_id=e.employee_id
group by pay_month,department_id)a
left join (
select date_format(pay_date,'%Y-%m') as pay_month,avg(amount) as cavg
from q615salary s join q615employee e on s.employee_id=e.employee_id
group by pay_month) b on a. pay_month=b.pay_month