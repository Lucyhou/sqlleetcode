# 1179. Reformat Department Table
#Write an SQL query to reformat the table such that there is a department id column and a revenue column for each month.
drop table if exists Department;
create table Department(id int, revenue decimal, month varchar(255));
insert into Department(id, revenue , month) values (1,8000,'Jan'),(2,9000,'Jan'),
(3,10000,'Feb'),(1,7000,'Feb'),(1,6000,'Mar');

Select id, MAX(case when month='Jan' then revenue else null end ) as Jan_Revenue,
MAX(case when month='Feb' then revenue else null end ) as Feb_Revenue,
MAX(case when month='Mar' then revenue else null end ) as Mar_Revenue,
MAX(case when month='Apr' then revenue else null end ) as Apr_Revenue,
MAX(case when month='May' then revenue else null end ) as May_Revenue,
MAX(case when month='Jun' then revenue else null end ) as Jun_Revenue,
MAX(case when month='Jul' then revenue else null end ) as Jul_Revenue,
MAX(case when month='Aug' then revenue else null end ) as Aug_Revenue,
MAX(case when month='Sep' then revenue else null end ) as Sep_Revenue,
MAX(case when month='Oct' then revenue else null end ) as Oct_Revenue,
MAX(case when month='Nov' then revenue else null end ) as Nov_Revenue,
MAX(case when month='Dec' then revenue else null end ) as Dec_Revenue
from Department 
GROUP BY id

