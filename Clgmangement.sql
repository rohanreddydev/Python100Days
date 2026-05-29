create database clg;
CREATE TABLE Departments(dept_id INT PRIMARY KEY ,dept_name VARCHAR(100),dept_hod VARCHAR(100));

INSERT INTO Departments(dept_id,dept_name,dept_hod) VALUES (1, 'CSE', 'Rohan'),
(2, 'ECE', 'Abhi'),
(3, 'MECH', 'Pranneth'),
(4, 'EEE', 'Kiran'),
(5, 'CIVIL', 'Venkatesh');

SELECT * FROM Departments;



CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    student_age INT,
    student_gender VARCHAR(10),
    student_phone VARCHAR(15),
    student_email VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO students 
(student_id, student_name, student_age, student_gender, student_phone, student_email, dept_id)
VALUES
(101, 'Arjun', 20, 'Male', '9876500001', 'arjun101@gmail.com', 1),
(102, 'Sneha', 21, 'Female', '9876500002', 'sneha102@gmail.com', 2),
(103, 'Varun', 22, 'Male', '9876500003', 'varun103@gmail.com', 3),
(104, 'Meghana', 20, 'Female', '9876500004', 'meghana104@gmail.com', 4),
(105, 'Tarun', 23, 'Male', '9876500005', 'tarun105@gmail.com', 5),
(106, 'Keerthi', 19, 'Female', '9876500006', 'keerthi106@gmail.com', 1),
(107, 'Nikhil', 21, 'Male', '9876500007', 'nikhil107@gmail.com', 2),
(108, 'Divya', 22, 'Female', '9876500008', 'divya108@gmail.com', 3),
(109, 'Harsha', 20, 'Male', '9876500009', 'harsha109@gmail.com', 4),
(110, 'Pooja', 21, 'Female', '9876500010', 'pooja110@gmail.com', 5),
(111, 'Rahul', 22, 'Male', '9876500011', 'rahul111@gmail.com', 1),
(112, 'Ananya', 20, 'Female', '9876500012', 'ananya112@gmail.com', 2),
(113, 'Karthik', 23, 'Male', '9876500013', 'karthik113@gmail.com', 3),
(114, 'Lavanya', 19, 'Female', '9876500014', 'lavanya114@gmail.com', 4),
(115, 'Sai', 21, 'Male', '9876500015', 'sai115@gmail.com', 5),
(116, 'Bhavana', 22, 'Female', '9876500016', 'bhavana116@gmail.com', 1),
(117, 'Manoj', 20, 'Male', '9876500017', 'manoj117@gmail.com', 2),
(118, 'Tejaswini', 21, 'Female', '9876500018', 'tejaswini118@gmail.com', 3),
(119, 'Vishal', 22, 'Male', '9876500019', 'vishal119@gmail.com', 4),
(120, 'Nandini', 20, 'Female', '9876500020', 'nandini120@gmail.com', 5);


SELECT * FROM students;

CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(100),
    teacher_salary INT,
    teacher_subject VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO teachers
(teacher_id, teacher_name, teacher_salary, teacher_subject, dept_id)
VALUES
(201, 'Srinivas', 55000, 'Data Structures', 1),
(202, 'Lakshmi', 60000, 'Digital Electronics', 2),
(203, 'Pradeep', 52000, 'Thermodynamics', 3),
(204, 'Swathi', 58000, 'Power Systems', 4),
(205, 'Raghu', 50000, 'Structural Engineering', 5),
(206, 'Deepika', 62000, 'Operating Systems', 1),
(207, 'Madhav', 57000, 'Signals and Systems', 2),
(208, 'Sandeep', 54000, 'Machine Design', 3),
(209, 'Anusha', 61000, 'Electrical Machines', 4),
(210, 'Vijay', 53000, 'Surveying', 5);

SELECT * FROM  teachers;



CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_duration VARCHAR(100),
    course_fee INT
);


INSERT INTO courses
(course_id, course_name, course_duration, course_fee)
VALUES
(301, 'Python Programming', '3 Months', 15000),
(302, 'Java Full Stack', '6 Months', 30000),
(303, 'Data Science', '5 Months', 40000),
(304, 'Web Development', '4 Months', 25000),
(305, 'Machine Learning', '6 Months', 45000),
(306, 'Cloud Computing', '3 Months', 35000),
(307, 'Cyber Security', '4 Months', 38000),
(308, 'DevOps', '5 Months', 42000);


SELECT * FROM courses;



CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    enrollment_date DATE,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


INSERT INTO enrollments
(enrollment_id, student_id, enrollment_date, course_id)
VALUES
(401, 101, '2026-01-10', 301),
(402, 102, '2026-01-11', 302),
(403, 103, '2026-01-12', 303),
(404, 104, '2026-01-13', 304),
(405, 105, '2026-01-14', 305),
(406, 106, '2026-01-15', 306),
(407, 107, '2026-01-16', 307),
(408, 108, '2026-01-17', 308),
(409, 109, '2026-01-18', 301),
(410, 110, '2026-01-19', 302),
(411, 111, '2026-01-20', 303),
(412, 112, '2026-01-21', 304),
(413, 113, '2026-01-22', 305),
(414, 114, '2026-01-23', 306),
(415, 115, '2026-01-24', 307),
(416, 116, '2026-01-25', 308),
(417, 117, '2026-01-26', 301),
(418, 118, '2026-01-27', 302),
(419, 119, '2026-01-28', 303),
(420, 120, '2026-01-29', 304),
(421, 101, '2026-02-01', 305),
(422, 102, '2026-02-02', 306),
(423, 103, '2026-02-03', 307),
(424, 104, '2026-02-04', 308),
(425, 105, '2026-02-05', 301),
(426, 106, '2026-02-06', 302),
(427, 107, '2026-02-07', 303),
(428, 108, '2026-02-08', 304),
(429, 109, '2026-02-09', 305),
(430, 110, '2026-02-10', 306);

SELECT * FROM enrollments;


CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    student_id INT,
    attendance_date DATE,
    attendance_status VARCHAR(100),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO attendance
(attendance_id, student_id, attendance_date, attendance_status)
VALUES
(501, 101, '2026-03-01', 'Present'),
(502, 102, '2026-03-01', 'Absent'),
(503, 103, '2026-03-01', 'Present'),
(504, 104, '2026-03-01', 'Present'),
(505, 105, '2026-03-01', 'Absent'),
(506, 106, '2026-03-02', 'Present'),
(507, 107, '2026-03-02', 'Present'),
(508, 108, '2026-03-02', 'Absent'),
(509, 109, '2026-03-02', 'Present'),
(510, 110, '2026-03-02', 'Present'),
(511, 111, '2026-03-03', 'Absent'),
(512, 112, '2026-03-03', 'Present'),
(513, 113, '2026-03-03', 'Present'),
(514, 114, '2026-03-03', 'Absent'),
(515, 115, '2026-03-03', 'Present'),
(516, 116, '2026-03-04', 'Present'),
(517, 117, '2026-03-04', 'Absent'),
(518, 118, '2026-03-04', 'Present'),
(519, 119, '2026-03-04', 'Present'),
(520, 120, '2026-03-04', 'Absent'),
(521, 101, '2026-03-05', 'Present'),
(522, 102, '2026-03-05', 'Present'),
(523, 103, '2026-03-05', 'Absent'),
(524, 104, '2026-03-05', 'Present'),
(525, 105, '2026-03-05', 'Present'),
(526, 106, '2026-03-06', 'Absent'),
(527, 107, '2026-03-06', 'Present'),
(528, 108, '2026-03-06', 'Present'),
(529, 109, '2026-03-06', 'Absent'),
(530, 110, '2026-03-06', 'Present'),
(531, 111, '2026-03-07', 'Present'),
(532, 112, '2026-03-07', 'Absent'),
(533, 113, '2026-03-07', 'Present'),
(534, 114, '2026-03-07', 'Present'),
(535, 115, '2026-03-07', 'Absent'),
(536, 116, '2026-03-08', 'Present'),
(537, 117, '2026-03-08', 'Present'),
(538, 118, '2026-03-08', 'Absent'),
(539, 119, '2026-03-08', 'Present'),
(540, 120, '2026-03-08', 'Present'),
(541, 101, '2026-03-09', 'Absent'),
(542, 102, '2026-03-09', 'Present'),
(543, 103, '2026-03-09', 'Present'),
(544, 104, '2026-03-09', 'Absent'),
(545, 105, '2026-03-09', 'Present'),
(546, 106, '2026-03-10', 'Present'),
(547, 107, '2026-03-10', 'Absent'),
(548, 108, '2026-03-10', 'Present'),
(549, 109, '2026-03-10', 'Present'),
(550, 110, '2026-03-10', 'Absent');

SELECT * FROM attendance;


CREATE TABLE marks (
    mark_id INT PRIMARY KEY,
    student_id INT,
    subject VARCHAR(100),
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);


INSERT INTO marks
(mark_id, student_id, subject, marks)
VALUES
(601, 101, 'Mathematics', 85),
(602, 102, 'Physics', 78),
(603, 103, 'Chemistry', 91),
(604, 104, 'English', 74),
(605, 105, 'Computer Science', 88),
(606, 106, 'Mathematics', 69),
(607, 107, 'Physics', 82),
(608, 108, 'Chemistry', 95),
(609, 109, 'English', 77),
(610, 110, 'Computer Science', 84),
(611, 111, 'Mathematics', 73),
(612, 112, 'Physics', 89),
(613, 113, 'Chemistry', 92),
(614, 114, 'English', 68),
(615, 115, 'Computer Science', 90),
(616, 116, 'Mathematics', 81),
(617, 117, 'Physics', 76),
(618, 118, 'Chemistry', 87),
(619, 119, 'English', 79),
(620, 120, 'Computer Science', 94),
(621, 101, 'Physics', 72),
(622, 102, 'Chemistry', 86),
(623, 103, 'English', 75),
(624, 104, 'Computer Science', 89),
(625, 105, 'Mathematics', 93),
(626, 106, 'Physics', 67),
(627, 107, 'Chemistry', 80),
(628, 108, 'English', 88),
(629, 109, 'Computer Science', 91),
(630, 110, 'Mathematics', 70),
(631, 111, 'Physics', 84),
(632, 112, 'Chemistry', 96),
(633, 113, 'English', 71),
(634, 114, 'Computer Science', 83),
(635, 115, 'Mathematics', 77),
(636, 116, 'Physics', 90),
(637, 117, 'Chemistry', 74),
(638, 118, 'English', 85),
(639, 119, 'Computer Science', 92),
(640, 120, 'Mathematics', 66),
(641, 101, 'Chemistry', 88),
(642, 102, 'English', 73),
(643, 103, 'Computer Science', 97),
(644, 104, 'Mathematics', 79),
(645, 105, 'Physics', 81),
(646, 106, 'Chemistry', 69),
(647, 107, 'English', 87),
(648, 108, 'Computer Science', 93),
(649, 109, 'Mathematics', 76),
(650, 110, 'Physics', 85);


SELECT * FROM marks;

