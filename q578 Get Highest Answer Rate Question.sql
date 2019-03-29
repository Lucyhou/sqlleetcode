#578. Get Highest Answer Rate Question
drop table if exists q578Survey_log;
Create table If Not Exists q578Survey_log (uid int, action varchar(255), question_id int, answer_id int, q_num int, timestamp int);
Truncate table q578Survey_log;
insert into q578Survey_log values ('5', 'show', '285', null, '1', '123');
insert into q578Survey_log values ('5', 'answer', '285', '124124', '1', '124');
insert into q578Survey_log values ('5', 'show', '369', null, '2', '125');
insert into q578Survey_log values ('5', 'skip', '369', null, '2', '126');

SELECT a.question_id,ifnull(ca/cq,0) rate
from
(SELECT distinct question_id, count(distinct question_id) cq
from q578Survey_log s1
where action='show'
group by question_id)a
left join
(SELECT distinct question_id, count(distinct answer_id) ca
from q578Survey_log s1
where action='answer'
group by question_id)b on a.question_id=b.question_id
order by rate desc
limit 1