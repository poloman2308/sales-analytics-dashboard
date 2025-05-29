
-- Total revenue by region
SELECT
    c.region,
    ROUND(SUM(s.quantity * p.price), 2) AS total_revenue
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.region
ORDER BY total_revenue DESC;
