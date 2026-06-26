CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price_at_purchase DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT UNIQUE,
    amount DECIMAL(10,2) NOT NULL,
    payment_method VARCHAR(50),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

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

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Alice', 'Brown', 'alice@example.com');

SELECT * FROM products;

UPDATE products SET stock_quantity = stock_quantity - 1 WHERE product_id = 1;

DELETE FROM customers WHERE customer_id = 3;


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
