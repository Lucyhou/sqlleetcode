# 1211 Queries Quality and Percentage
/*+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| query_name  | varchar |
| result      | varchar |
| position    | int     |
| rating      | int     |
+-------------+---------+
Queries table:
+------------+-------------------+----------+--------+
| query_name | result            | position | rating |
+------------+-------------------+----------+--------+
| Dog        | Golden Retriever  | 1        | 5      |
| Dog        | German Shepherd   | 2        | 5      |
| Dog        | Mule              | 200      | 1      |
| Cat        | Shirazi           | 5        | 2      |
| Cat        | Siamese           | 3        | 3      |
| Cat        | Sphynx            | 7        | 4      |
+------------+-------------------+----------+--------+

Result table:
+------------+---------+-----------------------+
| query_name | quality | poor_query_percentage |
+------------+---------+-----------------------+
| Dog        | 2.50    | 33.33                 |
| Cat        | 0.66    | 33.33                 |
+------------+---------+-----------------------+

Dog 查询结果的质量为 ((5 / 1) + (5 / 2) + (1 / 200)) / 3 = 2.50
Dog 查询结果的劣质查询百分比为 (1 / 3) * 100 = 33.33

Cat 查询结果的质量为 ((2 / 5) + (3 / 3) + (4 / 7)) / 3 = 0.66
Cat 查询结果的劣质查询百分比为 (1 / 3) * 100 = 33.33



*/
drop table if exists Queries;
CREATE TABLE Queries(query_name varchar(255), result varchar(255),position int, rating numeric );

insert into Queries values ('Dog', 'Golden Retriever','1','5'),('Dog', 'German Shepherd','2','5'),
('Dog', 'Mule','200','1'),('Cat', 'Shirazi','5','2'),('Cat', 'Siamese','3','3'),('Cat', 'Sphynx','7','4')
;

Select query_name, round(sum(quality)/count(*), 2) as quality,
round(sum(case when rating < 3 then 1 else 0 end)/count(*)*100,2) as poor_query_percentag
from(
Select query_name, rating/position as quality,  rating
From Queries
)a
group by query_name
