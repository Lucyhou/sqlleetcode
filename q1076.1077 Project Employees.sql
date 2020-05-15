/*1076&1077
"""
Table: Project
+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+
(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.
Table: Employee
+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+
employee_id is the primary key of this table.
 
Write an SQL query that reports the project_id that has the maximum number of employee.
The query result format is in the following example:
Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+
Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+
Result table:
+-------------+
| project_id  |
+-------------+
| 1           |
+-------------+
*/


drop table if exists Project;
create table Project(project_id int, employee_id int);
insert into Project(project_id, employee_id) values (1,1),(1,2),(1,3),(2,1),(2,4),(2,5),(3,1);
drop table if exists Employee;
create table Employee(employee_id int, name varchar(255), experience_years decimal);
insert into Employee(employee_id, name, experience_years) values (1,'Kha',3),(2,'Apple',3),(3,'Samsung',1),(4,'Doe',5),(5,'Do',5);
#1076  that reports the project_id that has the maximum number of employee.

#way1 using tem
with tem as
(
Select project_id, count(employee_id) as countn
From Project  
Group by project_id
)

select project_id
FRom tem
where countn in ( select max(countn) from tem)

#way2 using join
SELECT project_id
FROM Project
GROUP BY project_id
HAVING COUNT(employee_id) = (SELECT COUNT(employee_id)
                            FROM Project
                            GROUP BY project_id
                            ORDER BY COUNT(employee_id) DESC
                            LIMIT 1)
/*1077
Write an SQL query that reports the most experienced employees in each project.
 In case of a tie, report all employees with the maximum number of experience years.
 Result table:
+-------------+---------------+
| project_id  | employee_id   |
+-------------+---------------+
| 1           | 1             |
| 1           | 3             |
| 2           | 1             |*/

#way1 using tem
with tem1 as(
Select p.project_id, e.employee_id, e.experience_years
From Project p join Employee e on p.employee_id=e.employee_id)

Select project_id, employee_id,experience_years
from tem1 t
where experience_years in 
(select max(t1.experience_years) as ex from tem1 t1 where t1.project_id=t.project_id group by t1.project_id)


#way2
SELECT
    p.project_id,
    e.employee_id
FROM 
    Project p LEFT JOIN Employee e ON
    p.employee_id = e.employee_id
WHERE (p.project_id, 
       e.experience_years) IN (SELECT 
                                p.project_id, 
                                MAX(e.experience_years)
                            FROM 
                                Project p LEFT JOIN Employee e ON
                                p.employee_id = e.employee_id
                            GROUP BY 
                                p.project_id)