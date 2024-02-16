-- Query 1: Average amount paid by the top 5 customers
SELECT
    AVG(total_amount_paid) AS average_amount_paid
FROM
    (SELECT
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
        city.city IN ('Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhule',
                        'Kurashiki', 'Pingxiang', 'Sivas', 'Celaya', 'São Leopoldo')
    GROUP BY
        customer.customer_id, customer.first_name, customer.last_name, country.country, city.city
    ORDER BY
        total_amount_paid DESC
    LIMIT 5) AS top_5_customers;

-- Query 2: Top 5 customers based within each country
SELECT
    country.country,
    COUNT(DISTINCT top_5_customers.customer_id) AS top_customer_count
FROM
    country
LEFT JOIN
    (SELECT
        customer.customer_id,
        country.country
    FROM
        customer
    JOIN
        address ON customer.address_id = address.address_id
    JOIN
        city ON address.city_id = city.city_id
    JOIN
        country ON city.country_id = country.country_id
    LEFT JOIN
        payment ON customer.customer_id = payment.customer_id
    WHERE
        city.city IN ('Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhule',
                        'Kurashiki', 'Pingxiang', 'Sivas', 'Celaya', 'São Leopoldo')
    GROUP BY
        customer.customer_id, country.country
    ORDER BY
        SUM(payment.amount) DESC
    LIMIT 5) AS top_5_customers ON country.country = top_5_customers.country
GROUP BY
    country.country
ORDER BY
    top_customer_count DESC;
