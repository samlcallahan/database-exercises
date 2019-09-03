use employees;

show tables;

select * from employees.employees;

show create table employees;
-- int, date, varchar, enum('M','F')

-- which tables do I think contain a numeric type column?
-- probably all of them excet departments

-- which have a string type?
-- again probably all of them except salaries or dept_emp.

-- which tables have a date type?
-- probably all but departments

select * from employees limit 10;

select * from departments limit 10;
-- they don't appear to be directly related.

select * from dept_emp limit 10;
-- dept_emp relates the two. the emp_no from employees is tied to a dept_no from departments.
-- this table shows which employee is in which department, and when they joined/left.

show create table dept_manager;