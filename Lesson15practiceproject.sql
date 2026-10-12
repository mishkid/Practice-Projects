create table if not exists Employee (	
	emp_id integer,
	f_name varchar(255),
	l_name varchar(255),
	job_id varchar(255),
	salary integer,
	manager_id integer,
	dept_id integer
);

-- first and last names of employees w/ salaries greater than Calvin

select *
from Employee e 
where f_name like 'Calvin'
;

SELECT 
emp_id,
concat (l_name,' ',f_name) as employee_name,
job_id,
salary,
manager_id,
dept_id
from 
Employee e
where 
salary > 85000
;

-- show employee id and last name of those with a salary greater than the average 

SELECT 
emp_id,
l_name,
salary
FROM 
employee 
where salary > (select avg(salary)
				from employee
				)
;

-- show empID & salary for those higher than those w/ job id MW789 
 
SELECT 
emp_id,
f_name,
salary
FROM 
Employee 
where salary > (select salary 
				from Employee
				where job_id = 'MW789'
				)
order by salary desc;
except
SELECT 
emp_id,
f_name,
salary
FROM 
Employee 
;

-- show top 3 earners 

select
f_name,
emp_id,
salary
from (select *
		from Employee  
		)
order by salary desc
limit 3;
		








