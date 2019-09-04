describe titles;

select distinct title from titles;

select last_name from employees
	where last_name like "e%e"
	group by last_name;
	
select first_name, last_name from employees
	where last_name like "e%e"
	group by last_name, first_name;
	
select distinct last_name from employees
	where last_name like "%q%"
	and last_name not like "%qu%";
	
select last_name, count(last_name) as count from employees
	where last_name like "%q%"
	and last_name not like "%qu%"
	group by last_name
	order by count desc;
	
select gender,count(*) from employees
	where first_name in ('Irena','Vidya','Maya')
	group by gender;

select concat(
	lower(substring(first_name,1,1)),
	lower(substring(last_name,1,4)),
	"_",
	substring(birth_date,6,2),
	substring(birth_date,3,2))
	as username,
	count(*) as count
	from employees
	group by username
	order by count desc;
	
-- Yes, there are duplicate usernames

