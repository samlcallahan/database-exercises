use employees;

select first_name,
last_name
from employees 
where hire_date in (
	select hire_date
	from employees
	where emp_no=101010);

select distinct t.title as title
from titles as t
join employees as e
on t.emp_no=e.emp_no
where e.first_name="Aamod";

select count(distinct m.emp_no) as past_employee_count
from (
	select emp_no
	from dept_emp
	where to_date not like "9999%") as m
	where m.emp_no not in (
		select emp_no
		from dept_emp
		where to_date like "9999%");
	
select first_name,
last_name
from dept_manager as dm
join employees as e
on dm.emp_no=e.emp_no
where e.gender="F"
and dm.to_date like "9999%";

select e.first_name as first_name,
e.last_name as last_name,
s.salary as salary
from employees as e
join salaries as s
on e.emp_no=s.emp_no
where salary > (
	select avg(salary)
	from salaries
	where to_date like "9999%")
and s.to_date like "9999%";

select count(*)
from salaries
where salary > (
	select max(salary) - stddev(salary)
	from salaries
--	where to_date like "9999%"
	)
and to_date like "9999%";

select concat(100*p.proportion,"%")
from (
	select h.count_high / t.count_total as proportion
	from (
		select count(*) as count_total
		from salaries
		where to_date like "9999%"
		) as t,
		(select count(*) as count_high
		from salaries
		where salary > (
			select max(salary) - stddev(salary)
			from salaries
--			where to_date like "9999%"
			)
		and to_date like "9999%") as h) as p;

select distinct d.dept_name as dept_name
from dept_manager as dm
join employees as e
on dm.emp_no=e.emp_no
join departments as d
on dm.dept_no=d.dept_no
where e.gender="F"
and dm.to_date like "9999%";

select e.first_name as first_name, 
e.last_name as last_name
from employees as e
join salaries as s
on e.emp_no=s.emp_no
where s.salary = (
	select max(salary)
	from salaries);

select distinct d.dept_name as dept_name
from departments as d
join dept_emp as de
on de.dept_no=d.dept_no
join salaries as s
on de.emp_no=s.emp_no
where s.salary = (
	select max(salary)
	from salaries);