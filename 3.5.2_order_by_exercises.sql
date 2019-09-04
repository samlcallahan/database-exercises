use employees;

describe employees;

select * from employees where first_name in ('Irena', 'Vidya', 'Maya')
    order by first_name;
    
select * from employees where first_name in ('Irena', 'Vidya', 'Maya')
    order by first_name,last_name;

select * from employees where first_name in ('Irena', 'Vidya', 'Maya')
    order by last_name,first_name;

select * from employees where first_name in ('Irena', 'Vidya', 'Maya')
    order by last_name desc,first_name desc;

select * from employees where last_name like '%e%' order by emp_no;

select * from employees where last_name like '%e%' order by emp_no desc;

select * from employees where birth_date like '%-12-25' and hire_date like '199%' order by
	hire_date desc,
	birth_date desc;