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
use sakila;

select * from actor;

select lower(first_name),
lower(last_name)
from actor;

select actor_id, first_name, last_name
from actor
where first_name="joe";

select * from actor
where last_name like "%gen%";

select * from actor
where last_name like "%li%"
order by last_name, first_name;

select * from country;

select country_id, country
from country
where country
in ("Afghanistan","Bangladesh","China");

select last_name,
count(*) as count
from actor
group by last_name;

select last_name,
count(*) as count
from actor
group by last_name
having count > 1;

show create table address;

select first_name,
last_name,
address
from staff
join address using(address_id);

select staff_id,
sum(amount)
from payment
join staff using(staff_id)
where payment_date like "2005-08%"
group by staff_id;

select title, count(*)
from film_actor
join film using(film_id)
group by title;

select count(*)
from inventory
join film using(film_id)
where title="Hunchback Impossible";

select title from film
join language using(language_id)
where language.name="English"
and title like "K%"
or title like "Q%";

select first_name,last_name
from actor
join film_actor using(actor_id)
join film using(film_id)
where title="Alone Trip";

select first_name,
last_name,
email
from customer
join address using(address_id)
join city using(city_id)
join country using(country_id)
where country="Canada";

select distinct title from film
join film_category using(film_id)
join category using (category_id)
where category.name="Family";

select store_id, sum(amount)
from store
join staff using(store_id)
join payment using(staff_id)
group by store_id;

select store_id, city, country
from store
join address using(address_id)
join city using(city_id)
join country using (country_id);

select category.name as genre,
sum(amount) as gross_revenue
from category
join film_category using(category_id)
join film using(film_id)
join inventory using(film_id)
join rental using(inventory_id)
join payment using(rental_id)
group by genre
order by gross_revenue desc
limit 5;