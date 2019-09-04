use employees;

describe employees;

select * from employees where first_name in ('Irena', 'Vidya', 'Maya');

select * from employees where last_name like "e%";

select * from employees where hire_date like '199%';

select * from employees where birth_date like '%-12-25';

select * from employees where last_name like '%q%';

select * from employees where first_name="Irena"
	or first_name="Vidya"
	or first_name="Maya";
	
select * from employees where gender='M' and 
	(first_name='Irena' or
	first_name='Vidya' or
	first_name='Maya');
	
select * from employees where last_name like 'e%' or last_name like '%e';

select * from employees where last_name like 'e%' and last_name like '%e';

select * from employees where birth_date like '%-12-25' and hire_date like '199%';

select * from employees where last_name like '%q%' and last_name not like '%qu%';