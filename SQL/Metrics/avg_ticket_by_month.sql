-- ============================================================
-- Quanto a empresa faturou por mês, considerando apenas
-- pedidos pagos e descontando os descontos aplicados?
-- ============================================================

WITH order_totals AS (
    SELECT
        o.id,
        DATE_TRUNC('month', o.order_date) AS month,
        COALESCE(SUM(oi.quantity * oi.unit_price) - o.discount_amount, 0) AS order_total
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.id
    WHERE o.status = 'paid'
    GROUP BY o.id, o.order_date, o.discount_amount
)

SELECT
    TO_CHAR(ot.month, 'YYYY-MM') AS month,
ROUND(SUM(ot.order_total) / COUNT(ot.id), 2) AS avg_ticket
FROM order_totals ot
GROUP BY ot.month
ORDER BY ot.month;
