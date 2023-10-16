-- Syntax: SELECT columns from table
select *
from actor;

select * from film;

-- Query for specific columns -- select col_1, col_2, col_3, etc. from table_name
select title, description, length
from film;

select *
from actor 
where first_name like '_i%';

-- using "and" and "or" in the "where" clause
-- or - only one needs to be true
select *
from actor
where first_name like 'n%' or last_name like 'W%';

select *
from film
where title like '%h%'
order by rental_duration;

-- SQL Aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()
-- take in a column_name as an argument and return a single value

select sum(amount)
from payment;

select sum(amount)
from payment
where amount > 5;

-- AVG - finds the average a column
select avg(amount)
from payment;

-- MIN/MAX - finds the smallest/largest value in a column
-- also alias the column name - col_name AS alias_name
select min(amount) as lowest_amount_paid, max(amount) as highest_amount_paid
from payment;

-- MIN() and MAX() can work on strings as well
select min(first_name), max(last_name)
from actor;


-- COUNT() - Takes in either the column name OR * for all columns 
-- If column_name, will count how many NON-NULL rows, if * will count all rows
select *
from staff;

select count(picture)
from staff;

-- To count unique values in a column, use the DISTINCT keyword
-- COUNT(DISTINCT col_name)
select count(first_name)
from actor;

select count(distinct first_name)
from actor;

-- Calculate a new column based on other columns
select payment_id, rental_id, payment_id - rental_id as difference
from payment;

-- CONCAT - will concatenate multiple strings together
select concat(first_name, ' ', last_name) as full_name
from actor;

-- Alias the aggregated column and use in the ORDER BY
select customer_id, sum(amount) as total_spent
from payment
group by customer_id 
order by total_spent desc;

--HAVING Clause -> HAVING is  to group by/Aggregations as WHERE is to SELECT 
select customer_id, sum(amount) as total_spent
from payment 
group by customer_id 
having sum(amount) > 150
order by total_spent desc;


-- LIMIT and OFFSET clauses
-- LIMIT - limit the number of rows that are returned

select *
from film 
order by film_id 
limit 10;

-- OFFSET - start your rows after a certain number of rows using offset 
select *
from actor
offset 10; -- Skips the first 10 rows

-- can be used together
select *
from actor
offset 10
limit 5;

-- Putting all of the clauses together
-- of all customers who have made less than 20 payments and have a customer_id > 350, display
-- those who have spent 11th-20th most
select customer_id, count(*), sum(amount) as total_spend
from payment
where customer_id > 350
group by customer_id
having count(*) < 20
order by total_spend desc
offset 10
limit 10;

-- SYNTAX ORDER: (SELECT and FROM are the only mandatory)

-- SELECT (columns from table)
-- FROM (table_name)
-- WHERE (row filter)
-- GROUP BY (aggregations)
-- HAVING (filter aggregations)
-- ORDER BY (column value ASC or DESC)
-- OFFSET (number of rows to skip)
-- LIMIT (max number of rows to display)