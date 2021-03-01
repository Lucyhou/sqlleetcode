drop table if exists Submissions;
CREATE TABLE  Submissions(sub_id int, parent_id varchar(255));
insert into Submissions(sub_id) values ('1'),('2' ),('12'),('1');
insert into Submissions values ('3', '1'),
('3', '1'),('5', '2'),('4', '1'),('9', '1'),('10', '2'),('6', '7');

#select * from Submissions 

Select a.sub_id post_id, ifnull(count(distinct t.sub_id),0) number_of_comments
From Submissions t right join
(Select sub_id From Submissions t1
Where parent_id is null)a on t.parent_id=a.sub_id
Group by 1
order by 1 

