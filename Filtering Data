- Queries Executed in pgAdmin 4, the following queries were executed to retrieve information from the film database.

- Query 1: Film title contains the word 'Uptown' in any position. Searching for films with 'Uptown' in their title.

SELECT film_id, title, description
FROM film
WHERE LOWER(title) LIKE '%uptown%';

- Query 2: Film length is more than 120 minutes and rental rate is more than 2.99

SELECT film_id, title, description
FROM film
WHERE length > 120 AND rental_rate > 2.99;

- Query 3: Rental duration is between 3 and 7 days (exclusive)

SELECT film_id, title, description
FROM film
WHERE rental_duration > 3 AND rental_duration < 7;

- Query 4: Film replacement cost is less than 14.99

SELECT film_id, title, description
FROM film
WHERE replacement_cost < 14.99;

- Query 5: Film rating is either PG or G: 

SELECT film_id, title, description
FROM film
WHERE rating IN ('PG', 'G');

- Query 6: Film Rating is either PG or G with Additional Information (Count, Avg, Max, Min)

SELECT
  COUNT(*) AS "count of movies",
  AVG(rental_rate) AS "average movie rental rate",
  MAX(rental_duration) AS "maximum rental duration",
  MIN(rental_duration) AS "minimum rental duration"
FROM film
WHERE rating IN ('PG', 'G');

- Query 7: Query for Film Rating Grouped by Rating

SELECT
  rating,
  COUNT(*) AS "count of movies",
  AVG(rental_rate) AS "average movie rental rate",
  MAX(rental_duration) AS "maximum rental duration",
  MIN(rental_duration) AS "minimum rental duration"
FROM film
GROUP BY rating;

