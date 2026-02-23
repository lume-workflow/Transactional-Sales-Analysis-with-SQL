
-- ====================================================
-- Quais clientes concentram o maior volume de receita?
-- ====================================================

WITH order_totals AS ( Select 
    o.id, o.customer_id,
    COALESCE((SUM(oi.quantity * oi.unit_price) - o.discount_amount),0) as order_total
    FROM orders o
    JOIN order_items oi ON oi.order_id = o.id
    WHERE o.status = 'paid'
    GROUP BY o.id, o.customer_id
)

SELECT c.first_name, c.last_name,
    SUM(ot.order_total) as total_expend
    FROM customers c
    JOIN order_totals ot ON c.id = ot.customer_id
    GROUP BY c.first_name, c.last_name
    ORDER BY total_expend DESC LIMIT 3