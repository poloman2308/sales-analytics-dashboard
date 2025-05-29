
-- Monthly revenue by product category
SELECT
    DATE_TRUNC('month', s.sale_date) AS month,
    p.category,
    ROUND(SUM(s.quantity * p.price), 2) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY month, p.category
ORDER BY month, p.category;
