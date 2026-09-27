create table if not exists patients_datasets(
	pid varchar(100) primary key,
	date date,
	p_name varchar(100),
	age integer,
	weight integer,
	gender varchar(100),
	location varchar(100),
	phone_no integer,
	disease varchar(100),
	doctor_name varchar(100),
	doctor_id integer
);

Insert into Patients_datasets(pid,date,p_name,age,weight,gender,location,phone_no,disease,doctor_name,doctor_id)
	Values('AP2021','2019-06-15','Sarath','67','76','Male','chennai','5462829','Cardiac','Mohan','21'),
		  ('AP2022','2019-02-13','John','62','80','Male','banglore','1234731','Cancer','Suraj','22'),
	      ('AP2023','2018-01-08','Henry','43','65','Male','Kerala','9028320','Liver','Mehta','23'),
          ('AP2024','2020-02-04','Carl','56','72','Female','Mumbai','9293829','Asthma','Karthik','24'),
          ('AP2025','2017-09-15','Shikar','55','71','Male','Delhi','7821281','Cardiac','Mohan','21'),
          ('AP2026','2018-07-22','Piyush','47','59','Male','Haryana','8912819','Cancer','Suraj','22'),
          ('AP2027','2017-03-25','Stephen','69','55','Male','Gujarat','8888211','Liver','Mehta','23'),
   		  ('AP2028','2019-04-22','Aaron','75','53','Male','Banglore','9012192','Asthma','Karthik','24');


  /* Write a query to display the total number of patients in the table */

select
count(*)
from patients_datasets;

/* Write a query to display the patient id and patient name with the current date */

SELECT 
pid,
p_name,
date('now') as current_date
FROM 
patients_datasets;

/* Write a query to display the old patient name and the new patient name in uppercase */

SELECT 
p_name,
upper(p_name) as upper_name
FROM 
patients_datasets;

/* Write a query to display the patients' names along with the total number of characters in their name */

SELECT 
p_name,
length(p_name) as name_length
from
patients_datasets;

/* Write a query to combine the patient's name and the doctor's name in a new column */

select
p_name,
doctor_name,
concat(p_name,', ',doctor_name) as p_and_d_name
FROM 
patients_datasets;

/* Write a query to extract the year for a given date and place it in a separate column */

select
date,
substr(date,1,4) as year
from
patients_datasets;

/* Write a query to display duplicate entries in the doctor name column */

SELECT 
doctor_name
from
patients_datasets
order by doctor_name;





