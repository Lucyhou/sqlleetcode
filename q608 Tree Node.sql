#608. Tree Node 
drop table if exists q608tree;
Create table If Not Exists q608tree (id int, p_id int);
Truncate table q608tree;
insert into q608tree values ('1', null);
insert into q608tree values ('2', '1');
insert into q608tree values ('3', '1');
insert into q608tree values ('4', '2');
insert into q608tree values ('5', '2');


#way1:
SELECT id,CASE WHEN p_id IS NULL THEN 'Root'
         WHEN p_id is not null and id IN (SELECT p_id FROM q608tree t1) THEN 'Inner'
		ELSE 'Leaf' END AS Type
FROM q608tree t2
ORDER BY id

#way2:
select  distinct id, case when p_id is null then 'root' 
				when p_id is not null and b.c_id is null   
                then 'leaf'
                else 'inner' end as type
from
(select *
from q608tree t1
left join
(select p_id as id1, id as c_id
from q608tree t2)a on t1.id=a.id1)b
