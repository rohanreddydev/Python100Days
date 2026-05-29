-- 1. display all students
SELECT * FROM students;

-- 2. -- display only student names,emails
SELECT student_name,student_email FROM students;

--3 find students older than 20
SELECT * FROM students WHERE student_age>20;

-- 4 find female students
select * from students where student_gender='Female';

-- 5 sort students age by decing order
select * from students 
order by student_age DESC;

-- 6 display top 5 students by marks 
select a.student_name,b.marks
from students a 
inner join marks b on a.student_id=b.student_id
order by b.marks DESC
limit 5;

-- 7  find students from cse deparment 

select a.student_name,b.dept_name
from students a 
inner join Departments b on a.dept_id=b.dept_id
where b.dept_name='CSE';

-- 8 find teachers earning more than 50k

select teacher_name,teacher_salary
from teachers
where teacher_salary>50000;

-- 9  find curses fee between 10k to 30k

select course_name 
from courses where course_fee between 10000 and 30000;

-- 10 update any student email 

update students
set student_email='arjunaaaa101@gmail.com'
where student_id=101;

select * from students;

-- 11 increase all teacher salary by 10 percent
UPDATE teachers
SET teacher_salary = teacher_salary + (teacher_salary * 10 / 100);

select * from teachers;

-- 12 delete students who discontinued course 


-- 13  find total no of students

select count(student_id) as total_students
from students;

-- 14 find avg teacher salary

select avg(teacher_salary) as Avg_salary
from teachers;


-- 15 find highest marks scored

select 






