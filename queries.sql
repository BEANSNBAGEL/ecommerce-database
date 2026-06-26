INSERT INTO customers (first_name, last_name, email)
VALUES ('Alice', 'Brown', 'alice@example.com');
SELECT * FROM products;
UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;
DELETE FROM customers
WHERE customer_id = 3;
SELECT o.order_id, c.first_name, c.last_name, o.order_date, o.status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
SELECT o.order_id, p.name, oi.quantity, oi.price_at_purchase
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id;
SELECT p.name, SUM(oi.quantity * oi.price_at_purchase) AS total_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.name;
SELECT c.first_name, c.last_name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;
