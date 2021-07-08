Drop table if exists scores;
CREATE TABLE  scores(player_name varchar(25), gender varchar(25), day Date, score_points int);

insert into scores values ('Aron','F', '2020-01-01','17 '),('Alice','F', '2020-01-07','23'),('Bajrang','M', '2020-01-07','7'),
         ('Khali','M', '2019-12-25','11'),('Slaman','M', '2019-12-30','13'),('Joe','M', '2019-12-31','3'),
         ('Jose','M', '2019-12-18','2'),('Priya','F', '2019-12-31','23'),('Priyanka','F', ' 2019-12-30','17');
         
SELECT gender, day, 
sum(score_points) over(partition by gender order by gender, day ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) total
FROM scores
