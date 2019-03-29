#595. Big Countries
drop table if exists q595world;
Create table If Not Exists q595World (name varchar(255), continent varchar(255), area int, population int, gdp bigint);
Truncate table q595World;
insert into q595World values ('Afghanistan', 'Asia', '652230', '25500100', '20343000000');
insert into q595World values ('Albania', 'Europe', '28748', '2831741', '12960000000');
insert into q595World values ('Algeria', 'Africa', '2381741', '37100000', '188681000000');
insert into q595World values ('Andorra', 'Europe', '468', '78115', '3712000000');
insert into q595World values ('Angola', 'Africa', '1246700', '20609294', '100990000000');

Select name, population, area
From q595World
Where area>3000000 or population >25000000