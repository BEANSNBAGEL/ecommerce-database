INSERT INTO customers (first_name, last_name, email)
VALUES ('Alice', 'Brown', 'alice@example.com');
SELECT * FROM products;
UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;
DELETE FROM customers
WHERE customer_id = 3;
