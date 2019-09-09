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

select * from actor;

select last_name from actor;

select * from film;

select distinct last_name from actor;

select distinct postal_code from address;

select distinct rating from film;

select title,
description,
rating,
length
from film
where length > 180;

select payment_id,
amount,
payment_date
from payment
where payment_date >= '2005-05-27';

select payment_id,
amount,
payment_date
from payment
where payment_date-'2005-05-27';

select * from customer
where last_name like "s%"
and first_name like "%n";

select * from customer
where active=0
or last_name like "m%";

select * from category
where category_id>4
and name regexp '^[cst]';

select staff_id,
first_name,
last_name,
address_id,
picture,
email,
store_id,
active,
username,
last_update
from staff
where password is not null;

select staff_id,
first_name,
last_name,
address_id,
picture,
email,
store_id,
active,
username,
last_update
from staff
where password is null;

select phone, district
from address
where district
in ("California","England","Taipei","West Java");

select payment_id,amount,payment_date
from payment
where date(payment_date)
in (date("2005-05-25"),date("2005-05-27"),date("2005-05-29"));

select * from film
where rating
in ("G","PG-13","NC-17");

select * from payment
where date(payment_date)
between "2005-05-25 24:00:00" and "2005-05-26 23:59:59";

select * from film
where char_length(description)
between 100 and 120;

select * from film
where description like "A Thoughtful%";

select * from film
where description like "%boat";

select * from film
where description like "%database%"
and length>180;

select * from payment
limit 20;

select payment_date, amount
from payment
where amount > 5
limit 1001 offset 999;

select * from customer
limit 100 offset 101;

select * from film
order by length;

select distinct rating
from film
order by rating desc;

select payment_date, amount
from payment
order by amount desc
limit 10;

select * from film;

select title,
description,
special_features,
length,
rental_duration
from film
where special_features like "%Behind the Scenes%"
and rental_duration between 5 and 7
and length<120
order by length desc
limit 10;

select c.first_name as customer_first_name,
c.last_name as customer_last_name,
a.first_name as actor_first_name,
a.last_name as actor_last_name
from customer as c
left join actor as a
on c.last_name=a.last_name;

select c.first_name as customer_first_name,
c.last_name as customer_last_name,
a.first_name as actor_first_name,
a.last_name as actor_last_name
from customer as c
right join actor as a
on c.last_name=a.last_name;

select c.first_name as customer_first_name,
c.last_name as customer_last_name,
a.first_name as actor_first_name,
a.last_name as actor_last_name
from customer as c
inner join actor as a
on c.last_name=a.last_name;

select city, country
from city
left join country
using(country_id);

select title,
description,
release_year,
language.name as language
from film
left join language
using(language_id);

select first_name,
last_name,
address,
address2,
city,
district,
postal_code
from staff
left join address using(address_id)
left join city using(city_id);

select avg(replacement_cost) from film;

select rating,
avg(replacement_cost)
from film
group by rating;

select name, count(*)
from category
join film_category using(category_id)
group by name;

select title, count(*) as total
from film
join inventory using(film_id)
join rental using(inventory_id)
group by title
order by total desc
limit 5;

select title, sum(amount) as total
from film
join inventory using(film_id)
join rental using(inventory_id)
join payment using(rental_id)
group by title
order by total desc
limit 5;

select concat(last_name,", ",first_name) as name,
sum(amount) as total
from customer
join payment using(customer_id)
group by customer_id
order by total desc
limit 1;

select concat(last_name,", ",first_name) as actor_name,
count(*) as total
from actor
join film_actor using(actor_id)
group by actor_id
order by total desc
limit 5;

select month(payment_date) as month,
store_id,
sum(amount) as sales
from payment
join rental using(rental_id)
join inventory using(inventory_id)
where payment_date like "2005%"
group by month,store_id;

select title,
concat(last_name,", ",first_name) as customer_name,
phone,
address
from rental
join customer using(customer_id)
join address using(address_id)
join inventory using(inventory_id)
join film using(film_id)
where return_date is null;