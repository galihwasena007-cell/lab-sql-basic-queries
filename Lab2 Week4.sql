-- Use the Sakila database
USE sakila;

-- 1) Display all available tables
SHOW TABLES;
-- (Alternative)
SELECT TABLE_NAME
FROM information_schema.TABLES
WHERE TABLE_SCHEMA = 'sakila'
ORDER BY TABLE_NAME;

-- 2) Retrieve all data from actor, film, customer
SELECT * FROM actor;
SELECT * FROM film;
SELECT * FROM customer;

-- 3) Specific columns
-- 3.1 Titles of all films
SELECT title FROM film ORDER BY title;

-- 3.2 Languages used in films, aliased as 'language'
SELECT name AS language FROM language ORDER BY language;

-- 3.3 First names of all employees (staff)
SELECT first_name FROM staff ORDER BY first_name;

-- 4) Retrieve unique release years
SELECT DISTINCT release_year FROM film ORDER BY release_year;

-- 5) Counting records
-- 5.1 Number of stores
SELECT COUNT(*) AS store_count FROM store;

-- 5.2 Number of employees
SELECT COUNT(*) AS employee_count FROM staff;

-- 5.3 How many films are available for rent vs rented
-- (A) Total copies available in inventory (all rentable copies in the catalog)
SELECT COUNT(*) AS total_inventory_copies FROM inventory;

-- (B) Total rentals ever made (how many times copies were rented)
SELECT COUNT(*) AS total_rentals FROM rental;

-- 5.4 Number of distinct actor last names
SELECT COUNT(DISTINCT last_name) AS distinct_actor_last_names FROM actor;

-- 6) Retrieve the 10 longest films
SELECT film_id, title, length
FROM film
ORDER BY length DESC, title
LIMIT 10;

-- 7) Filtering
-- 7.1 All actors named exactly 'SCARLETT'
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'SCARLETT'
ORDER BY last_name, actor_id;