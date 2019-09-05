use employees;

select * from dept_emp;

select d.dept_name as department_name,
	concat(e.first_name," ",e.last_name) as department_manager
	from dept_manager as dm
	join departments as d
	on dm.dept_no=d.dept_no
	join employees as e
	on dm.emp_no=e.emp_no
	where dm.to_date like "9999%";
	
select d.dept_name as department_name,
	concat(e.first_name," ",e.last_name) as department_manager
	from dept_manager as dm
	join departments as d
	on dm.dept_no=d.dept_no
	join employees as e
	on dm.emp_no=e.emp_no
	where dm.to_date like "9999%"
	and e.gender="F";

select t.title as Title,count(*) as Count
	from titles as t
	join dept_emp as de
	on t.emp_no=de.emp_no
	where de.dept_no="d009"
	and t.to_date like "9999%"
	group by t.title;

select d.dept_name as department_name,
	concat(e.first_name," ",e.last_name) as department_manager,
	s.salary as salary
	from dept_manager as dm
	join departments as d
	on dm.dept_no=d.dept_no
	join employees as e
	on dm.emp_no=e.emp_no
	join salaries as s
	on dm.emp_no=s.emp_no
	where dm.to_date like "9999%"
	and s.to_date like "9999%";
	
select d.dept_no as dept_no,
	d.dept_name as dept_name,
	count(de.dept_no) as num_employees
	from departments as d
	join dept_emp as de
	on d.dept_no=de.dept_no
	where de.to_date like "9999%"
	group by d.dept_no;

select d.dept_name as dept_name,
	avg(s.salary) as average_salary
	from salaries as s
	join dept_emp as de
	on s.emp_no=de.emp_no
	join departments as d
	on d.dept_no=de.dept_no
	where de.to_date like "9999%"
	and s.to_date like "9999%"
	group by d.dept_name
	order by average_salary desc
	limit 1;

select e.first_name as first_name,
	e.last_name as last_name
	from employees as e
	join salaries as s
	on e.emp_no=s.emp_no
	join dept_emp as de
	on e.emp_no=de.emp_no
	where de.dept_no="d001"
	and s.to_date like "9999%"
	order by s.salary desc
	limit 1;

select e.first_name as first_name,
	e.last_name as last_name,
	s.salary as salary,
	d.dept_name as dept_name
	from dept_manager as dm
	join employees as e
	on dm.emp_no=e.emp_no
	join salaries as s
	on dm.emp_no=s.emp_no
	join departments as d
	on dm.dept_no=d.dept_no
	where dm.to_date like "9999%"
	and s.to_date like "9999%"
	order by salary desc
	limit 1;

select concat(e.first_name," ",last_name) as employee_name,
	m.dept_name as department_name,
	m.mgr_name as manager_name
	from employees as e
	join dept_emp as de
	on e.emp_no=de.emp_no
	join
		(select d.dept_no,
		d.dept_name,
		concat(e.first_name," ",e.last_name) as mgr_name
		from employees as e
		join dept_manager as dm
		on e.emp_no=dm.emp_no
		join departments as d
		on dm.dept_no=d.dept_no
		where dm.to_date like "9999%")
		as m
		on de.dept_no=m.dept_no
	where de.to_date like "9999%";
	
select m.dept_name as department_name,
	concat(e.first_name," ",e.last_name) as name,
	m.salary as salary
	from employees as e
	join salaries as s
	on e.emp_no=s.emp_no
	join
		(select d.dept_name as dept_name,
			max(s.salary) as salary
			from salaries as s
			join dept_emp as de
			on s.emp_no=de.emp_no
			join departments as d
			on de.dept_no=d.dept_no
			group by dept_name) as m
			on m.salary=s.salary
	where s.to_date like "9999%";