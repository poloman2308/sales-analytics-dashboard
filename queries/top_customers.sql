
-- Top 10 customers by total spending
SELECT 
    c.name AS customer_name,
    c.region,
    ROUND(SUM(s.quantity * p.price), 2) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_id, c.name, c.region
ORDER BY total_spent DESC
LIMIT 10;
