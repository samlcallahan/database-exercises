use employees;

select concat(first_name," ",last_name) 
	as full_name
	from employees
	where last_name like "%e" 
	and first_name like "e%";
	
select upper(concat(first_name," ",last_name)) 
	as full_name
	from employees
	where last_name like "%e" 
	and last_name like "e%";

select first_name, last_name, datediff(now(),hire_date) as tenure from employees 
	where birth_date 
	like '%-12-25' 
	and hire_date like '199%' 
	order by birth_date,
    hire_date desc;
    
select max(salary), min(salary) from salaries;

select concat(
	lower(substring(first_name,1,1)),
	lower(substring(last_name,1,4)),
	"_",
	substring(birth_date,6,2),
	substring(birth_date,3,2))
	as username
	from employees;