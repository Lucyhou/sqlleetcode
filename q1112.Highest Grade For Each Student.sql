drop table if exists Enrollments;
create table Enrollments(student_id int, course_id int,grade numeric);
insert into Enrollments(student_id, course_id,grade) values (2,2,95),(2,3,95),(1,1,90),(1,2,99),(3,1,80),(3,2,75),(3,3,82),
(4,1,80),(4,2,80),(4,3,80),(4,4,78);

Select e1.student_id, min(course_id) as course_id, grade
from
(Select student_id, max(grade) as g
From Enrollments e
Group by student_id)aa join Enrollments e1 on aa.student_id=e1.student_id and g=e1.grade
Group by student_id, grade
Order by student_id

