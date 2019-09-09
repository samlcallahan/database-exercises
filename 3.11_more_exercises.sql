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

use world;

select * from city;

select * from country;

select * from countrylanguage;

select Language,
Percentage
from countrylanguage
join country
on country.Code=countrylanguage.CountryCode
join city using(CountryCode)
where city.Name="Santa Monica"
order by Percentage;

select Region,
count(*) as num_countries
from country
group by Region
order by num_countries;

select Region,
sum(Population) as population
from country
group by Region
order by population desc;

select Continent,
sum(Population) as population
from country
group by Continent
order by population desc;

-- all of these are wrong because it doesn't weight by population
select avg(LifeExpectancy)
from country;

select Continent,
avg(LifeExpectancy) as life_expectancy
from country
group by Continent
order by life_expectancy;

select Region,
avg(LifeExpectancy) as life_expectancy
from country
group by Region
order by life_expectancy;

select * from country
where Name!=LocalName;

select count(*) from country
where LifeExpectancy<50;

select District from city
where Name="Morón";

select Region from country
join city on city.CountryCode=country.Code
where city.Name="Morón";

select country.Name from country
join city on city.CountryCode=country.Code
where city.Name="Morón";

select LifeExpectancy from country
join city on city.CountryCode=country.Code
where city.Name="Morón";