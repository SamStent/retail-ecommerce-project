CREATE TABLE customers (
    customer_id VARCHAR PRIMARY KEY,
    gender VARCHAR(10),
    age INT,
    city VARCHAR(100)
);

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255),
    product_category VARCHAR(100),
    price NUMERIC(10,2)
);

CREATE TABLE orders (
    order_id VARCHAR PRIMARY KEY,
    customer_id VARCHAR REFERENCES customers(customer_id),
    order_date DATE,
    payment_method VARCHAR(50)
);

CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id VARCHAR REFERENCES orders(order_id),
    product_id INT REFERENCES products(product_id),
    quantity INT,
    rating INT
);

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;

-- ================================