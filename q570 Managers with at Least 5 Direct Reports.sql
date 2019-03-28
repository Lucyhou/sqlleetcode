#570. Managers with at Least 5 Direct Reports
drop table if exists q570Employee;
Create table If Not Exists q570Employee (Id int, Name varchar(255), Department varchar(255), ManagerId int);
Truncate table q570Employee;
insert into q570Employee values ('101', 'John', 'A', null);
insert into q570Employee values ('102', 'Dan', 'A', '101');
insert into q570Employee values ('103', 'James', 'A', '101');
insert into q570Employee values ('104', 'Amy', 'A', '101');
insert into q570Employee values ('105', 'Anne', 'A', '101');
insert into q570Employee values ('106', 'Ron', 'B', '101');
insert into q570Employee values ('107', 'Ronne', 'C', '102')

#way1:
select Name
from q570Employee e join
(select ManagerId,count(distinct Id)
from q570Employee e1 
group by ManagerId
having count(distinct Id)>=5)a on e.Id=a.ManagerId

#way2:
select e4.Name
from q570Employee e3 join q570Employee e4 on e3.ManagerId=e4.Id
group by e3.ManagerId
having count(distinct e3.Id)>=5