#1
SELECT 
    category, brand, ROUND(AVG(sale_price), 2) AS avg_price
FROM
    products
GROUP BY category , brand
ORDER BY avg_price DESC;

#2
SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY category ORDER BY sale_price DESC) AS price_rank
    FROM products
)
WHERE price_rank <= 5;

#3
SELECT category, brand, product, sale_price,
       ROUND(AVG(sale_price) OVER (PARTITION BY category, brand ORDER BY sale_price), 2) AS running_avg
FROM products


