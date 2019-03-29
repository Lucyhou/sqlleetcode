#584. Find Customer Referee 
#Write a query to return the list of customers NOT referred by the person with id '2'.
drop table if exists q584customer;
CREATE TABLE IF NOT EXISTS q584customer (id INT,name VARCHAR(25),referee_id INT);
Truncate table q584customer;
insert into q584customer (id, name, referee_id) values ('1', 'Will', null);
insert into q584customer (id, name, referee_id) values ('2', 'Jane', null);
insert into q584customer (id, name, referee_id) values ('3', 'Alex', '2');
insert into q584customer (id, name, referee_id) values ('4', 'Bill', null);
insert into q584customer (id, name, referee_id) values ('5', 'Zack', '1');
insert into q584customer (id, name, referee_id) values ('6', 'Mark', '2');

#way1:
select name
from q584customer c1
where name not in (select name
					from q584customer c2
				     where referee_id=2)
                     
#way2
select name
from q584customer 
where referee_id!=2 or referee_id is null