#580. Count Student Number in Departments
drop table if exists q580student;
drop table if exists q580department;
CREATE TABLE IF NOT EXISTS q580student (student_id INT,student_name VARCHAR(45), gender VARCHAR(6), dept_id INT);
CREATE TABLE IF NOT EXISTS q580department (dept_id INT, dept_name VARCHAR(255));
Truncate table q580student;
insert into q580student values ('1', 'Jack', 'M', '1');
insert into q580student values ('2', 'Jane', 'F', '1');
insert into q580student values ('3', 'Mark', 'M', '2');
Truncate table q580department;
insert into q580department values ('1', 'Engineering');
insert into q580department values ('2', 'Science');
insert into q580department values ('3', 'Law');



select dept_name, ifnull(student_number,0)
from q580department d left join
(select dept_id,count(distinct student_id) as student_number
from q580student
group by dept_id)a on d.dept_id=a.dept_id