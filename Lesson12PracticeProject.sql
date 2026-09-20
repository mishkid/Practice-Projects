CREATE TABLE IF NOT EXISTS Sales_Datasets( 
	Id integer primary key autoincrement,
	c_id integer,
	Order_date Date,
	Order_no Varchar(100),
	c_name varchar(100),
	s_code integer,
	p_name varchar(100),
	qty integer,
	price integer
);

create table if not exists Product_datasets(
	p_code integer primary key,
	p_name varchar(150) REFERENCES Sales_datasets(p_name),
	price integer,
	stock integer,
	category varchar(150)
	);

create table if not exists customer_datasets(
	c_id integer primary key REFERENCES Sales_datasets(c_id),
	c_name varchar(150),
	c_location varchar(150),
	c_phoneno integer
	);

 
INSERT into Sales_Datasets(c_id,order_date,order_no,c_name,s_code,p_name,qty,price)
Values ('9212','24/07/2016','HM06','Jessica','11','pencil','3','30'),
		('3921','19/10/2016','HM09','Mukesh','17','biscuits','10','600'),
		('9875','30/10/2016','HM10','Stephen','2','cornoto','10','500'),
		('1212','12/04/2018','HM03','Oliver','20','kiwi','3','420'),
		('1910','02/05/2018','HM05','Mohan','20','kiwi','2','280'),
		('5334','20/09/2018','HM08','Chirsty','16','chocolate','2','50'),
		('1246','11/01/2019','HM07','Vignesh','19','apple','5','600'),
		('1910','15/03/2019','HM01','Mohan','5','mayanoise','4','360'),
		('1111','10/02/2021','HM04','Nisha','25','conditioner','5','1000'),
		('2123','12/02/2021','HM02','Biyush','3','pen','2','20');


--- Write a query to display
--- order ID, customer ID, order date, price, and quantity columns of the sales table

SELECT 
order_no,
c_id,
order_date,
price,
qty
from Sales_datasets;

--- Write a query to show details from the product table where the category is stationary

select *
from Product_datasets
where category like 'stationary';

--- Write a query to display the unique categories in the product table

select distinct 
category
from product_datasets;

--- Write a query to display the product details in descending order of price

select *
from Product_datasets 
order by price DESC;












