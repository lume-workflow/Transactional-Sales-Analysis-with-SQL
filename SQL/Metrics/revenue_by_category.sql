SELECT
    p.category,
    COALESCE(SUM(oi.quantity * oi.unit_price), 0) AS total
FROM products p
JOIN order_items oi ON oi.product_id = p.id
JOIN orders o ON o.id = oi.order_id
WHERE o.status = 'paid'
GROUP BY p.category;
