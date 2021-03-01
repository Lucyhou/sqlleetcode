drop table if exists Countries;
CREATE TABLE  Countries(country_id int,country_name varchar(25));
insert into Countries values ('2','USA'),('3','Australia'),('7','Peru'),('5','China '),('8','Morocco'),('9','Spain');

drop table if exists weather;
CREATE TABLE  weather(country_id int,weather_state int, day date);
insert into weather values ('2','15','2019-11-01'),('2','12','2019-10-28'),('2','12','2019-10-27'),
('3','-2','2019-11-10'),('3','0','2019-11-11'),('3','3','2019-11-12'),('5','16','2019-11-07'),('5','18','2019-11-09'),
('5','21','2019-11-23'),('7','25','2019-11-28'),('7','22','2019-12-01'),('7','20','2019-12-02'),
('8','25','2019-11-05'),('8','27','2019-11-15'),('8','31','2019-11-25'),('9','7','2019-10-23'),('9','3','2019-12-23');


Select country_id, country_name,
Case when sum(weather_state)/count(*)<=15 then 'cold' 
when avg(weather_state)>=25 then'hot'
else 'warm' end weather_type 
From (
Select w.country_id, country_name,  weather_state
From Countries c join Weather w on c.country_id=w.country_id
Where year(day)='2019' and month(day)='11'
)a
group by country_id, country_name
order by country_id
