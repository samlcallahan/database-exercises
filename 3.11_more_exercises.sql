use employees;

select m.dept_name,
m.manager_salary,
e.avg_emp_salary
from (
	select dept_name,
	salary as manager_salary
	from departments
	join dept_manager as dm 
	using(dept_no)
	left join salaries as s 
	using(emp_no)
	where s.to_date > now()
	and dm.to_date > now()
	) as m
join (
	select dept_name,
	avg(salary) as avg_emp_salary
	from salaries as s
	join dept_emp using(emp_no)
	join departments using(dept_no)
	where s.to_date > now()
	group by dept_name
	) as e
using(dept_name);

-- Yes, in production and customer service the managers are paid less than the average for their departments