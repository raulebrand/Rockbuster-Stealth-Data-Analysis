- Query 1: Common Table Expressions (CTEs): Top 5 Customers by Payment Amount in Specific Cities

WITH top_5_customers AS ( SELECT
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
        city.city IN ('Aurora', 'Atlixco', 'Xintai', 'Adoni', 'Dhule','Kurashiki', 'Pingxiang', 'Sivas', 'Celaya', 'São Leopoldo')
    GROUP BY
        customer.customer_id, country.country
    ORDER BY
        SUM(payment.amount) DESC
    LIMIT 5)
SELECT
    country.country,
    COUNT(DISTINCT top_5_customers.customer_id) AS top_customer_count
FROM
    country
LEFT JOIN
    top_5_customers ON country.country = top_5_customers.country
GROUP BY
    country.country
ORDER BY
    top_customer_count DESC;
