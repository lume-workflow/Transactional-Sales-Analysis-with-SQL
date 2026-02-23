-- ==================================
-- Qual é o ticket médio por mês?
-- ==================================

WITH order_totals AS (
    SELECT
        o.id AS order_id,
        DATE_TRUNC('month', o.order_date) AS order_month,
        SUM(oi.quantity * oi.unit_price) - COALESCE(o.discount_amount,0) AS order_total
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.id
    WHERE o.status = 'paid'
    GROUP BY 
        o.id,
        o.order_date,
        o.discount_amount
)

SELECT
    order_month,
    SUM(order_total) AS monthly_revenue
FROM order_totals
GROUP BY order_month
ORDER BY order_month;
