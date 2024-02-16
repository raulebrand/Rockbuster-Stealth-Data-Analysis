- Summarizing & Cleaning Data in SQL (pgAdmin4)

- Query 1: Checking for Duplicate (film_id & customer_id)

SELECT film_id, COUNT(*)
FROM film
GROUP BY film_id
HAVING COUNT(*) > 1;
  
  SELECT customer_id, COUNT(*)
FROM customer
GROUP BY customer_id
HAVING COUNT(*) > 1;

- Query 2: Checking for Missing Values (film_id & customer_id)

SELECT COUNT(*)
FROM film
WHERE film_id IS NULL;

SELECT COUNT(*)
FROM customer
WHERE customer_id IS NULL;

- Query 3: Checking for Non-uniform Data (film_id & customer_id)

SELECT DISTINCT title, release_year, language_id, rental_duration
FROM film;

SELECT DISTINCT first_name, last_name, address_id, last_update
FROM customer;


