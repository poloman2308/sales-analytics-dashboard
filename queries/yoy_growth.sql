
-- Year-over-year monthly revenue comparison
WITH monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', s.sale_date) AS month,
        EXTRACT(YEAR FROM s.sale_date) AS year,
        EXTRACT(MONTH FROM s.sale_date) AS month_num,
        SUM(s.quantity * p.price) AS total_revenue
    FROM sales s
    JOIN products p ON s.product_id = p.product_id
    GROUP BY DATE_TRUNC('month', s.sale_date), EXTRACT(YEAR FROM s.sale_date), EXTRACT(MONTH FROM s.sale_date)
),
yoy_comparison AS (
    SELECT
        curr.month,
        curr.total_revenue AS current_year_revenue,
        prev.total_revenue AS previous_year_revenue,
        ROUND(
            CASE WHEN prev.total_revenue = 0 THEN NULL
                 ELSE ((curr.total_revenue - prev.total_revenue) / prev.total_revenue) * 100
            END, 2
        ) AS yoy_growth_pct
    FROM monthly_revenue curr
    LEFT JOIN monthly_revenue prev
        ON curr.month_num = prev.month_num
       AND curr.year = prev.year + 1
)
SELECT *
FROM yoy_comparison
ORDER BY month;
