drop table if exists Employee;
CREATE TABLE  Employee(employee_id int,team_id int);
insert into Employee values ('1','8'),('2','8'),('3','8'),('4','7'),('5','9'),('6','9');

Select e1. Employee_id, team_size
From Employee e1
Left Join (Select team_id, count(distinct employee_id) as team_size
From Employee e
Group by team_id)a on e1.team_id=a.team_id

