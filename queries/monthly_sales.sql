
-- Monthly total revenue from sales
SELECT 
    DATE_TRUNC('month', s.sale_date) AS month,
    ROUND(SUM(s.quantity * p.price), 2) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY month
ORDER BY month;
