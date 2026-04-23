-- 1. Revenue total
SELECT SUM(oi.quantity * p.price) AS total_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- 2. Número total de órdenes
SELECT COUNT(*) AS total_orders
FROM orders;

-- 3. Ticket promedio por orden
SELECT AVG(order_revenue) AS avg_order_value
FROM vw_sales_summary;

-- 4. Valor total por cliente (LTV básico)
SELECT AVG(total_spent) AS avg_customer_value
FROM vw_customer_value;

-- 5. Top 5 productos por revenue
SELECT product_name, revenue
FROM vw_product_performance
ORDER BY revenue DESC
LIMIT 5;

-- 6. Ciudad con mayor revenue
SELECT city, revenue
FROM vw_city_sales
ORDER BY revenue DESC
LIMIT 1;

-- 7. Rating promedio general
SELECT AVG(rating) AS avg_rating
FROM order_items;

-- 8. Revenue mensual (para gráficos)
SELECT month, revenue
FROM vw_monthly_sales
ORDER BY month;



