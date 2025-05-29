
-- View: Monthly KPIs for revenue, order volume, average order value
CREATE OR REPLACE VIEW v_monthly_kpis AS
SELECT
    DATE_TRUNC('month', s.sale_date) AS month,
    COUNT(s.sale_id) AS total_orders,
    ROUND(SUM(s.quantity * p.price), 2) AS total_revenue,
    ROUND(AVG(s.quantity * p.price), 2) AS avg_order_value
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY month
ORDER BY month;
