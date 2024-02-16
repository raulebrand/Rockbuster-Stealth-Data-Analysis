pgAdmin 4-- Query 1: Top 10 countries for Rockbuster in terms of customer numbers
SELECT
    country.country,
    COUNT(customer.customer_id) AS customer_count
FROM
    country
JOIN
    city ON country.country_id = city.country_id
JOIN
    address ON city.city_id = address.city_id
JOIN
    customer ON address.address_id = customer.address_id
GROUP BY
    country.country
ORDER BY
    customer_count DESC
LIMIT 10;

-- Query 2: Top 10 cities under 10 top countries

SELECT
    city.city,
    country.country,
    COUNT(customer.customer_id) AS customer_count
FROM
    city
JOIN
    address ON city.city_id = address.city_id
JOIN
    customer ON address.address_id = customer.address_id
JOIN
    country ON city.country_id = country.country_id
WHERE
    city.country_id IN (
        SELECT
            country_id
        FROM
            country
        WHERE
            country.country IN ('India', 'China', 'United States', 'Japan', 'Mexico', 'Brazil', 'Russian Federation', 'Philippines', 'Turkey', 'Indonesia'))
GROUP BY
    city.city, country.country
ORDER BY
    customer_count DESC
LIMIT 10;

-- Query 3: Top 5 customers from the top 10 cities

SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    country.country,
    city.city,
    SUM(payment.amount) AS total_amount_paid
FROM
    customer
JOIN
    address ON customer.address_id = address.address_id
JOIN
    city ON address.city_id = city.city_id
JOIN
    country ON city.country_id = country.country_id
JOIN
    payment ON customer.customer_id = payment.customer_id
WHERE
    city.city IN ('Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhule','Kurashiki', 'Pingxiang', 'Sivas', 'Celaya', 'São Leopoldo')
GROUP BY
    customer.customer_id, customer.first_name, customer.last_name,
    country.country, city.city
ORDER BY
    total_amount_paid DESC
LIMIT 5;
