Create Table if not exists Student_datasets(
	s_id integer primary key autoincrement,
	s_fname varchar(150),
	s_lname varchar(150),
	student_c integer,
	age integer
);

create table if not exists marksheet_datasets(
	ranking integer primary key,
	score integer,
	year date,
	class integer,
	s_id integer references Student_datasets(s_id)
);

insert into Student_datasets(s_fname,s_lname,student_c,age)
	values('krishna','gee','10','18'),
		  ('stephen','christ','10','17'),
		  ('kailash','kumar','10','18'),
		  ('ashish','jain','10','16'),
		  ('khusbu','jain','10','17'),
		  ('madhan','lal','10','16'),
		  ('saurab','kothari','10','15'),
		  ('vinesh','roy','10','14'),
		  ('rishika','r','10','15'),
		  ('sara','rayan','10','16'),
		  ('rosy','kumar','10','16');

insert into marksheet_datasets(score,year,class,ranking,s_id)
	values('989','2014','10','1','1'),
		  ('454','2014','10','10','2'),
		  ('880','2014','10','4','3'),
		  ('870','2014','10','5','4'),
		  ('720','2014','10','7','5'),
		  ('670','2014','10','8','6'),
		  ('900','2014','10','3','7'),
		  ('540','2014','10','9','8'),
		  ('801','2014','10','6','9'),
		  ('420','2014','10','11','10'),
		  ('970','2014','10','2','11'),
		  ('720','2014','10','12','12');


/* Write a query to display the student ID and first name of every student in the 
students table whose age is greater than or equal to 16 and whose last name is Kumar */

SELECT 
s_id,
s_fname,
s_lname,
age
from 
Student_datasets 
where 
age >= 16
and 
s_lname like 'kumar';

/* Write a query to display the details of every student from 
the marksheet table whose score is between 800 and 1000 */

select *
from Student_datasets 
inner join marksheet_datasets on marksheet_datasets.s_id = Student_datasets.s_id 
where score 
between 800 and 1000
order by s_id;


/* Write a query to increase the score in the marksheet table 
by five and create a new score column to display this new score */

select 
score,
year,
class,
s_id,
score + 5 as new_score
from marksheet_datasets;


/* Write a query to display the marksheet table in descending order of the score */

select *
from marksheet_datasets
order by score desc;


/* Write a query to display the details of every student whose first name starts with an ‘a’ */

select *
from Student_datasets 
where s_fname like 'a%';






















