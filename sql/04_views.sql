-- 1) Vista: resumen de ventas
CREATE OR REPLACE VIEW vw_sales_summary AS
SELECT 
    o.order_id,
    o.order_date,
    o.payment_method,
    c.customer_id,
    c.city,
    SUM(oi.quantity * p.price) AS order_revenue
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY 
    o.order_id, o.order_date, o.payment_method,
    c.customer_id, c.city;

-- 2) Vista: valor total por cliente
CREATE OR REPLACE VIEW vw_customer_value AS
SELECT 
    c.customer_id,
    c.city,
    SUM(oi.quantity * p.price) AS total_spent,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.city;

-- 3) Vista: rendimiento por producto
CREATE OR REPLACE VIEW vw_product_performance AS
SELECT 
    p.product_id,
    p.product_name,
    p.product_category,
    SUM(oi.quantity) AS total_units_sold,
    SUM(oi.quantity * p.price) AS revenue,
    AVG(oi.rating) AS avg_rating
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, p.product_category;

-- 4) Vista: ventas por categoría
CREATE OR REPLACE VIEW vw_category_sales AS
SELECT 
    p.product_category,
    SUM(oi.quantity) AS total_units,
    SUM(oi.quantity * p.price) AS revenue,
    AVG(oi.rating) AS avg_rating
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category;

-- 5) Vista: ventas mensuales
CREATE OR REPLACE VIEW vw_monthly_sales AS
SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(oi.quantity * p.price) AS revenue,
    SUM(oi.quantity) AS total_units,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY month
ORDER BY month;

-- 6) Vista: ventas por ciudad
CREATE OR REPLACE VIEW vw_city_sales AS
SELECT 
    c.city,
    SUM(oi.quantity * p.price) AS revenue,
    SUM(oi.quantity) AS total_units,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.city
ORDER BY revenue DESC;

-- 7) Vista: rating por categoría
CREATE OR REPLACE VIEW vw_category_ratings AS
SELECT 
    p.product_category,
    AVG(oi.rating) AS avg_rating,
    COUNT(*) AS total_reviews
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_category
ORDER BY avg_rating DESC;

-- 8) Vista: ticket promedio por ciudad
CREATE OR REPLACE VIEW vw_city_avg_ticket AS
SELECT 
    c.city,
    AVG(oi.quantity * p.price) AS avg_ticket
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY c.city
ORDER BY avg_ticket DESC;

-- 9) Vista: resumen general (vista maestra)
CREATE OR REPLACE VIEW vw_master_sales AS
SELECT 
    o.order_id,
    o.order_date,
    o.payment_method,
    c.customer_id,
    c.gender,
    c.age,
    c.city,
    p.product_id,
    p.product_name,
    p.product_category,
    oi.quantity,
    p.price,
    (oi.quantity * p.price) AS revenue,
    oi.rating
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;