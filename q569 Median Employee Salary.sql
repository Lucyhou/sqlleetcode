#569. Median Employee Salary
drop table if exists q569Employee;
Create table If Not Exists q569Employee (id int, company varchar(255), salary int);
Truncate table q569Employee;
insert into q569Employee values ('1', 'A', '2341');
insert into q569Employee values ('2', 'A', '341');
insert into q569Employee values ('3', 'A', '15');
insert into q569Employee values ('4', 'A', '15314');
insert into q569Employee values ('5', 'A', '451');
insert into q569Employee values ('6', 'A', '513');
insert into q569Employee values ('7', 'B', '15');
insert into q569Employee values('8', 'B', '13');
insert into q569Employee values ('9', 'B', '1154');
insert into q569Employee values ('10', 'B', '1345');
insert into q569Employee values ('11', 'B', '1221');
insert into q569Employee values ('12', 'B', '234');
insert into q569Employee values ('13', 'C', '2345');
insert into q569Employee values ('14', 'C', '2645');
insert into q569Employee values ('15', 'C', '2645');
insert into q569Employee values ('16', 'C', '2652');
insert into q569Employee values ('17', 'C', '65');

#way1:
select a.company,a.id, a.median as salary
from
(
select company as company, id as id, salary as median, 
row_number() over(partition by company order by salary desc) as rn
from q569Employee p  
)a join
(select company, count(id) as cn
from q569Employee p1 
group by company) b
on a.company=b.company
where  rn in (ceil(cn/2))  


#way2:
SELECT e1.company,e1.salary,e1.id
from
q569Employee e1 join q569Employee e2 on e1.company=e2.company
group by e1.company,e1.salary
having 
SUM(CASE WHEN e1.salary=e2.salary THEN 1 ELSE 0 END) >= ABS(SUM(SIGN(e1.salary-e2.salary)))