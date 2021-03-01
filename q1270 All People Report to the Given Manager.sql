drop table if exists Employees;
CREATE TABLE  Employees(employee_id int,  employee_name varchar(25),manager_id int);
insert into Employees(employee_id, employee_name, manager_id) values ('1', 'Boss','1'),('3', 'Alice','3'),('2', 'Bob','1'),
('4', 'Daniel','2'),('7', 'Luis','4'),('8', 'Jhon','3'),('9', 'Angela','8'),('77', 'Robert','1');


#select e1.*,e2.* from Employees e1 join Employees e2 on e1.employee_id=e2.manager_id

select e3.employee_id
from Employees e1 ,Employees e2,Employees e3
where  e1.employee_id=e2.manager_id
and  e2.employee_id=e3.manager_id
and e1.manager_id=1
and e3.employee_id <>1