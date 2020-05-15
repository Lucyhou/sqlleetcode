/*1075
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
 
Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
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
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+
*/


drop table if exists Project;
create table Project(project_id int, employee_id int);
insert into Project(project_id, employee_id) values (1,1),(1,2),(1,3),(2,1),(2,4);
drop table if exists Employee;
create table Employee(employee_id int, name varchar(255), experience_years decimal);
insert into Employee(employee_id, name, experience_years) values (1,'Kha',3),(2,'Apple',2),(3,'Samsung',1),(4,'Doe',2);


Select p.project_id, round(avg(experience_years),2) average_years
From Project p join Employee e on p.employee_id=e.employee_id
Group by p.project_id
