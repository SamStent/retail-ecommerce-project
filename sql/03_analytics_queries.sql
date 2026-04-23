-- ================================================
-- = ANALYTICS QUERIES - RETAIL ECOMMERCE PROJECT =
-- ================================================

-- 1. Revenue total del dataset
SELECT
	SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- 2. Revenue por ciudad
SELECT
	c.city,
	SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.city
ORDER BY revenue DESC;

-- 3. Top 5 productos por revenue
SELECT 
    p.product_name,
    SUM(oi.quantity) AS total_units,
    SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY revenue DESC
LIMIT 5;

-- 4. Ventas por categoría de producto
SELECT 
    p.product_category,
    SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category
ORDER BY revenue DESC;

-- 5. Número de órdenes por método de pago
SELECT 
    payment_method,
    COUNT(*) AS total_orders
FROM orders
GROUP BY payment_method
ORDER BY total_orders DESC;

-- 6. Rating promedio por categoría
SELECT 
    p.product_category,
    AVG(oi.rating) AS avg_rating
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category
ORDER BY avg_rating DESC;

-- 7. Revenue por mes
SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.quantity * p.price) AS revenue
FROM order_items oi
JOIN orders o ON oi.order_id = o.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- 8. Clientes con mayor gasto total (Top 10)
SELECT 
    c.customer_id,
    c.city,
    SUM(oi.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.city
ORDER BY total_spent DESC
LIMIT 10;

-- 9. Cantidad de productos vendidos por categoría
SELECT 
    p.product_category,
    SUM(oi.quantity) AS total_units
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category
ORDER BY total_units DESC;

-- 10. Órdenes por rango de edad
SELECT 
    CASE 
        WHEN age < 25 THEN '18-24'
        WHEN age BETWEEN 25 AND 34 THEN '25-34'
        WHEN age BETWEEN 35 AND 44 THEN '35-44'
        WHEN age BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY age_group
ORDER BY total_orders DESC;

