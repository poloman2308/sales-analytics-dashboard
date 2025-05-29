
-- View: Classify customers into spending segments
CREATE OR REPLACE VIEW v_customer_segments AS
SELECT
    c.customer_id,
    c.name AS customer_name,
    c.region,
    ROUND(SUM(s.quantity * p.price), 2) AS total_spent,
    CASE
        WHEN SUM(s.quantity * p.price) >= 5000 THEN 'Platinum'
        WHEN SUM(s.quantity * p.price) >= 2000 THEN 'Gold'
        WHEN SUM(s.quantity * p.price) >= 1000 THEN 'Silver'
        ELSE 'Bronze'
    END AS segment
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_id, c.name, c.region;
