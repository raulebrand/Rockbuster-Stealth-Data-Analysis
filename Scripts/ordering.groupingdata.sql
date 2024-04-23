- Queries Executed in pgAdmin 4: These SQL queries were executed in pgAdmin 4 to manipulate and analyze data from the film database.

- Query 1: Ordering Data:  Order Films by Title, Release Year, and Rental Rate.
SELECT *
FROM film
ORDER BY title ASC, release_year DESC, rental_rate DESC;

- Query 2: Grouping Data: Average Rental Rate Grouped by Film Rating.
SELECT rating, AVG(rental_rate)
FROM film
GROUP BY rating;

- Query 3: Minimum and Maximum Rental Durations Grouped by Film Rating: 
SELECT 
    rating,
    MIN(rental_duration) AS "minimum rental duration",
    MAX(rental_duration) AS "maximum rental duration"
FROM film
GROUP BY rating;
