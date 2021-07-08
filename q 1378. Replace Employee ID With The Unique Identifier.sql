

drop table if exists Employees;
CREATE TABLE  Employees(id int,  name varchar(25));
insert into Employees(id,  name) values ('1', 'Alice'),('2', 'Bob'),('11', 'Meir'),('90', 'Winston'),('3','Jonathan');

drop table if exists EmployeeUNI;
CREATE TABLE  EmployeeUNI(id int,  unique_id int);
insert into EmployeeUNI(id,unique_id) values ('3', '1'),('11', '2'),('90', '3');

Select unique_id, name 
From Employees e1 left join EmployeeUNI e2 on e1.id=e2.id
order by unique_id