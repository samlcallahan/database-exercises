use bayes_815;

show create table employees.employees;

create temporary table employees_with_departments as
	select emp_no,first_name,last_name,dept_no,dept_name
	from employees.employees
	join employees.dept_emp using(emp_no)
	join employees.departments using(dept_no);
	
alter table employees_with_departments
add full_name varchar(31);

update employees_with_departments
set full_name=concat(first_name," ",last_name);

alter table employees_with_departments
drop first_name,
drop last_name;

-- other way:

create temporary table alt_employees_with_departments as
	select emp_no,dept_no,dept_name,concat(first_name," ",last_name)
	from employees.employees
	join employees.dept_emp using(emp_no)
	join employees.departments using(dept_no);
	
create temporary table payment_in_cents as
	select payment_id, cast((amount * 100) as signed) as cents
	from sakila.payment;

create temporary table sal_and_dept as
	select emp_no,dept_name,salary
	from employees.departments
	join employees.dept_emp using(dept_no)
	join employees.salaries using(emp_no);

-- tried this, didn't work because you can't reference a temporary table twice in one statement (unclear why)
select dept_name, ((avg(salary)-a.avg_total)/a.stddev_total) as zscore
	from sal_and_dept,
		(select avg(salary) as avg_total,
		stddev(salary) as stddev_total
		from sal_and_dept) as a
	group by dept_name;

-- found this workaround online, still unclear why it won't work, but instructors weren't familiar with 'with' statements
with cte (avg_total,stddev_total) as (
	select avg(salary) as avg_total,
	stddev(salary) as stddev_total
	from sal_and_dept)
select dept_name,
((avg(salary)-avg_total)/stddev_total) as zscore
from sal_and_dept, cte
group by dept_name;

create temporary table avg_sal_by_dept as
	select dept_name,avg(salary) as avg_salary
	from employees.departments
	join employees.dept_emp using(dept_no)
	join employees.salaries as s using(emp_no)
	where s.to_date > now()
	group by dept_name;
	
-- add temp table with just stddev and avg salary on it. do a join with no on clause.

create temporary table avg_and_stddev as
	select avg(salary) as avg_total,
	stddev(salary) as stddev
	from employees.salaries
	where to_date > now();
	
select dept_name, 
(avg_salary-avg_total)/stddev as z_score
from avg_sal_by_dept
join avg_and_stddev;