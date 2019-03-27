#196.Delete duplicate emails
drop table if exists q196Person;
create table q196Person (id int, email text);
truncate table q196Person;
insert into q196Person values(1, 'john@example.com');
insert into q196Person values(2, 'bob@example.com');
insert into q196Person values(3, 'john@example.com');

# way1:
delete p1 from q196Person p1
where id not in (select min(id)
from (select * from q196Person p2)a
group by email) 

# way2:
SET SQL_SAFE_UPDATES = 0;
DELETE a1 FROM q196Person AS a1 INNER JOIN q196Person AS a2 on a1.email=a2.email
WHERE a1.id>a2.id;
SET SQL_SAFE_UPDATES = 1;


#for checking
select *
from q196Person p

