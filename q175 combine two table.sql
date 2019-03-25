#175 Write a SQL query for a report that provides the following information for each person in the Person table,
# regardless if there is an address for each of those people:
drop table if exists q175Person;
drop table if exists q175Address;
Create table q175Person (PersonId int, FirstName varchar(255), LastName varchar(255));
Create table q175Address (AddressId int, PersonId int, City varchar(255), State varchar(255));
Truncate table q175Person;
insert into q175Person values ('1', 'Jonnan', 'Bach');
insert into q175Person values ('2', 'Luke', 'Doe');
insert into q175Person values ('3', 'Joe', 'Lee');
Truncate table q175Address;
insert into q175Address values ('1', '2', 'New York', 'NY');
insert into q175Address values ('2', '3', 'Hayward', 'CA');


select FirstName, LastName, City, State
from q175Person p left join q175Address a on p.PersonId = a.PersonId;
