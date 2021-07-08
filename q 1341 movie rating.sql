drop table if exists Movies;
CREATE TABLE  Movies(movie_id int, title varchar(25));
insert into Movies values ('1', 'Avengers'),('2', 'Frozen 2'),('3', 'Joker');

drop table if exists Users;
CREATE TABLE  Users(user_id int, name varchar(25));
insert into Users values ('1', 'Daniel'),('2', 'Monica'),('3', 'Maria'),('4', 'James');

drop table if exists Movie_Rating;
CREATE TABLE  Movie_Rating(movie_id int, user_id int, rating int, created_at date);
insert into Movie_Rating values('1', '1','3','2020-01-12'),('1', '2','4','2020-02-11'),('1', '3','2','2020-02-12'),
('1', '4','1','2020-01-01'),('2', '1','5','2020-02-17'),('2', '2','2','2020-02-01'),('2', '3','2','2020-03-01'),
('3', '1','3','2020-02-22'),('3', '2','4','2020-02-25');
#way1:
(
    select u.name results
    from Movie_Rating mr,  Users u
    where mr.user_id = u.user_id
    group by mr.user_id
    order by count(1) desc, u.name
    limit 1
)
union 
(
    select m.title results
    from Movie_Rating mr, Movies m 
    where mr.movie_id = m.movie_id and mr.created_at like '2020-02%'
    group by mr.movie_id
    order by avg(rating) desc, m.title asc
    limit 1
)
#way2:
(With tem as(select user_id ,count(distinct movie_id) coun
From Movie_Rating m group by user_id)
Select name 
From Users u, (select user_id from tem
                 where coun in (select max(coun) from tem t1))t
where u.user_id=t.user_id
order by name asc
limit 1
)
union
(with temm as(select movie_id , avg(rating) avgg From Movie_Rating m2 Where year(created_at)='2020' and month(created_at)='2' group by movie_id)
Select title  results
From Movies mo join (select movie_id from temm
   where avgg in (select max(avgg) from temm) 
)tt on mo.movie_id=tt.movie_id
order by title asc
limit 1
)



