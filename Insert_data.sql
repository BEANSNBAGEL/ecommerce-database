INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Home Appliances');

INSERT INTO products (name, description, price, stock_quantity, category_id) VALUES
('Smartphone', 'Android phone', 499.99, 50, 1),
('Laptop', '15-inch display', 899.99, 30, 1),
('T-Shirt', 'Cotton shirt', 19.99, 100, 2),
('Microwave', '800W microwave oven', 120.00, 20, 3);

INSERT INTO customers (first_name, last_name, email, phone) VALUES
('John', 'Doe', 'john@example.com', '123456789'),
('Sarah', 'Smith', 'sarah@example.com', '987654321');

INSERT INTO orders (customer_id, status) VALUES
(1, 'Pending'),
(2, 'Completed');

INSERT INTO order_items (order_id, product_id, quantity, price_at_purchase) VALUES
(1, 1, 2, 499.99),
(1, 3, 1, 19.99),
(2, 2, 1, 899.99);

INSERT INTO payments (order_id, amount, payment_method) VALUES
(2, 899.99, 'Credit Card');
