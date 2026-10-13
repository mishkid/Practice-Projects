create table if not exists Students (
	studentid integer primary key,
	first_name varchar(255),
	last_name varchar(255),
	dob date,
	major varchar(255),
	gpa integer
);

create table if not exists enrollments (
	enrollmentid integer primary KEY,
	studentid integer references students(studentid),
	courseid integer,
	semester varchar(255),
	grade varchar(255)
);

create table if not exists courses (
	courseid integer primary key REFERENCES enrollments(courseid),
	coursename varchar(255),
	department varchar references students(major)
);

create table if not exists instructors (
	instructorid integer,
	instructorname varchar(255),
	department varchar(255) references courses(department)
);

-- create CourseSummary View 

create view CourseSummary as 
	select
	c.courseid,
	c.coursename,
	c.department,
	count(enrollments.enrollmentid) as Students_enrolled
	from
	courses c 
	inner join enrollments on c.courseid = enrollments.courseid
	group by 
	c.courseid,
	c.coursename,
	c.department;

-- create instructor schedule view

create view InstructorSchedule as 
	select distinct 
	i.instructorid,
	i.instructorname,
	i.department,
	c.coursename
	from
	instructors i 
	inner join courses c on i.department = c.department
	;

--- modify coursesummary

drop view coursesummary;

create view CourseSummary as 
	select distinct
	c.courseid,
	c.coursename,
	c.department,
	count(e.enrollmentid) as Students_enrolled,
	e.semester
	from
	courses c 
	inner join enrollments e on c.courseid = e.courseid
	group by 
	c.courseid
	order BY 
	e.semester;
	
-- update isntructor schedule 

drop view instructorschedule;

create view InstructorSchedule as 
	select distinct 
	i.instructorid,
	i.instructorname,
	i.department,
	c.coursename,
	e.semester
	from
	instructors i 
	inner join courses c on i.department = c.department
	inner join enrollments e on e.courseid = c.courseid
	where e.semester like 'spring 2024'
	order by i.instructorid
	;

-- create view EligibleGraduates w/ gpa higher/equal to 3.7

create view EligibleGraduates as 
	select 
	*
	from
	students 
	where gpa >= 3.7;

-- alter eligiblegraduates to include gpas 

drop view EligibleGraduates;

create view EligibleGraduates as 
	select 
	*
	from
	students 
	where gpa >= 3.7;

-- rename coursesummary to courseenrollmentsummary

drop view CourseSummary;

create view CourseEnrollmentSummary as 
	select distinct
	c.courseid,
	c.coursename,
	c.department,
	count(e.enrollmentid) as Students_enrolled,
	e.semester
	from
	courses c 
	inner join enrollments e on c.courseid = e.courseid
	group by 
	c.courseid
	order BY 
	e.semester;

-- drop eligiblegraduates

drop view EligibleGraduates;

-- create a cte named semestercourses 

with SemesterCourses as (
	SELECT distinct
	c.courseid,
	c.coursename,
	c.department,
	e.semester
	from
	courses c 
	inner join enrollments e on c.courseid = e.courseid
	where 
	e.semester like 'spring 2024'
)
select *
from SemesterCourses; 

	

















