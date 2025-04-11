CREATE DATABASE BookStoreDB;

USE BookStoreDB;

-- Author table
CREATE TABLE author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(100),
    lastName VARCHAR(100)
);

-- Publisher table
CREATE TABLE publisher (
    publisher_id INT  PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(100)
);

-- Book_language table
CREATE TABLE book_language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_code VARCHAR(20),
    language_name VARCHAR(100)
);

-- Books table
CREATE TABLE book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    language_id INT,
    publisher_id INT,  -- This column was missing
    num_pages INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id),
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id)
);

-- Book_author table
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
); 

-- Address_status table
CREATE TABLE address_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_description VARCHAR(50)
); 

-- Country table
CREATE TABLE country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(100) NOT NULL
);

-- Address table
CREATE TABLE address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);
-- Customer table
CREATE TABLE customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR(100),
    lastName VARCHAR(100),
    email VARCHAR(200) UNIQUE
); 

-- Customer_address table
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- Shipping_method table
CREATE TABLE shipping_method (
    shipping_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100),
    cost DECIMAL(10,2)
);

-- Cust_order table
CREATE TABLE cust_order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    shipping_id INT,
    status_id INT,
    address_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_id) REFERENCES shipping_method(shipping_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id)
);

-- Order_status table
CREATE TABLE order_status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_value VARCHAR(50)
); 

-- Order_line table
CREATE TABLE order_line (
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10,2),
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- Order_history table
CREATE TABLE order_history (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    status_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
); 


-- Insert into author
INSERT INTO author (firstName, lastName) VALUES
('George', 'Orwell'),
('Jane', 'Austen'),
('J.K.', 'Rowling'),
('Mark', 'Twain'),
('Leo', 'Tolstoy'),
('F. Scott', 'Fitzgerald'),
('Ernest', 'Hemingway'),
('Charles', 'Dickens'),
('Agatha', 'Christie'),
('Stephen', 'King');


-- Insert into publisher
INSERT INTO publisher (publisher_name) VALUES
('Penguin Books'),
('HarperCollins'),
('Bloomsbury'),
('Random House'),
('Simon & Schuster'),
('Oxford Press'),
('Scholastic'),
('Vintage'),
('Macmillan'),
('Tor Books');


-- Insert into book_language
INSERT INTO book_language (language_code, language_name) VALUES
('EN', 'English'),
('FR', 'French'),
('ES', 'Spanish'),
('DE', 'German'),
('IT', 'Italian'),
('RU', 'Russian'),
('ZH', 'Chinese'),
('JA', 'Japanese'),
('AR', 'Arabic'),
('PT', 'Portuguese');


-- Insert into book
INSERT INTO book (title, language_id, publisher_id, num_pages, price) VALUES
('1984', 1, 1, 328, 15.99),
('Pride and Prejudice', 1, 2, 279, 12.50),
('Harry Potter and the Philosopher\'s Stone', 1, 3, 223, 20.00),
('The Adventures of Tom Sawyer', 1, 4, 274, 11.99),
('War and Peace', 6, 5, 1225, 25.50),
('The Great Gatsby', 1, 6, 180, 10.99),
('The Old Man and the Sea', 1, 7, 127, 9.99),
('A Tale of Two Cities', 1, 8, 489, 14.50),
('Murder on the Orient Express', 1, 9, 256, 13.75),
('The Shining', 1, 10, 447, 18.25);


-- Insert into book_author
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);


-- Insert into address_status
INSERT INTO address_status (status_description) VALUES
('Home'),
('Billing'),
('Shipping'),
('Office'),
('Primary'),
('Secondary'),
('Vacation'),
('Temporary'),
('Permanent'),
('Other');

-- Insert into country
INSERT INTO country(country_name) 
VALUES("Kenya"), ("Tanzania"), ("Uganda"), ("Rwanda"), ("Burundi"), ("Congo"), ("Nigeria"),
("Angola"), ("Botswana"), ("South Africa"), ("Ethiopia"), ("Ghana"), ("Mozambique"), ("Liberia");

-- Insert into address
INSERT INTO address (street, city, state, postal_code, country_id) VALUES
('123 Main St', 'Nairobi', 'Nairobi', '00100', 1),
('456 Elm St', 'Dar es Salaam', 'Dar es Salaam', '11101', 2),
('789 Oak Ave', 'Kampala', 'Central', '00233', 3),
('101 Pine Rd', 'Kigali', 'Kigali', '0001', 4),
('202 Maple Dr', 'Bujumbura', 'Bujumbura Mairie', '0002', 5),
('303 Cedar Ln', 'Kinshasa', 'Kinshasa', '0003', 6),
('404 Birch St', 'Lagos', 'Lagos', '100001', 7),
('505 Spruce Ave', 'Luanda', 'Luanda', '0004', 8),
('606 Willow Way', 'Gaborone', 'South-East', '0005', 9),
('707 Palm Blvd', 'Johannesburg', 'Gauteng', '2000', 10);

-- Insert into customer
INSERT INTO customer (firstName, lastName, email) VALUES
('Alice', 'Smith', 'alice@example.com'),
('Bob', 'Johnson', 'bob@example.com'),
('Charlie', 'Brown', 'charlie@example.com'),
('Diana', 'Prince', 'diana@example.com'),
('Ethan', 'Hunt', 'ethan@example.com'),
('Fiona', 'Gallagher', 'fiona@example.com'),
('George', 'Bluth', 'george@example.com'),
('Hannah', 'Montana', 'hannah@example.com'),
('Ivan', 'Drago', 'ivan@example.com'),
('Jack', 'Sparrow', 'jack@example.com');


-- Insert into customer_address
INSERT INTO customer_address (customer_id, address_id, status_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);


-- Insert into shipping_method
INSERT INTO shipping_method (method_name, cost) VALUES
('Standard Shipping', 5.00),
('Express Shipping', 10.00),
('Overnight', 20.00),
('Two-Day Shipping', 7.50),
('Same-Day Delivery', 15.00),
('International Economy', 25.00),
('International Express', 40.00),
('Drone Delivery', 50.00),
('Weekend Delivery', 12.00),
('Eco Shipping', 4.00);

-- Insert into cust_order
INSERT INTO cust_order (customer_id, shipping_id, status_id, address_id) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 1, 4),
(5, 5, 2, 5),
(6, 6, 3, 6),
(7, 7, 1, 7),
(8, 8, 2, 8),
(9, 9, 3, 9),
(10, 10, 1, 10);

-- Insert into order_status
INSERT INTO order_status (status_value) VALUES
('Processing'),
('Shipped'),
('Delivered'),
('Cancelled'),
('Returned'),
('On Hold'),
('Backordered'),
('Awaiting Payment'),
('Completed'),
('Failed');

-- Insert into order_line
INSERT INTO order_line (order_id, book_id, quantity, price) VALUES
(1, 1, 1, 15.99),
(1, 2, 1, 12.50),
(2, 3, 2, 40.00),
(3, 4, 1, 11.99),
(4, 5, 1, 25.50),
(5, 6, 1, 10.99),
(6, 7, 2, 19.98),
(7, 8, 1, 14.50),
(8, 9, 3, 41.25),
(9, 10, 1, 18.25);

-- Insert into order_history
INSERT INTO order_history (order_id, status_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 1),
(3, 4),
(4, 1),
(5, 2),
(6, 3),
(7, 1);

-- Create users
CREATE USER 'store_admin'@'localhost' IDENTIFIED BY 'AdminPass123';
CREATE USER 'store_manager'@'localhost' IDENTIFIED BY 'ManagerPass123';
CREATE USER 'store_staff'@'localhost' IDENTIFIED BY 'StaffPass123';
CREATE USER 'store_viewer'@'localhost' IDENTIFIED BY 'ViewerPass123';

-- Grant permissions
GRANT ALL PRIVILEGES ON BookstoreDB.* TO 'store_admin'@'localhost';

-- Manage data
GRANT SELECT, INSERT, UPDATE, DELETE ON BookstoreDB.* TO 'store_manager'@'localhost';

GRANT SELECT, INSERT, UPDATE ON BookstoreDB.* TO 'store_staff'@'localhost';

-- Viewer
GRANT SELECT ON BookstoreDB.* TO 'store_viewer'@'localhost';

-- List order lines with book details and total price
SELECT 
    ol.order_id,
    b.title AS book_title,
    ol.quantity,
    ol.price,
    (ol.quantity * ol.price) AS total_price
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id;

-- Total revenue per book
SELECT 
    b.title AS book_title,
    SUM(ol.quantity * ol.price) AS total_revenue
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
GROUP BY b.title;

-- Number of orders per customer
SELECT 
    c.firstName, 
    c.lastName, 
    COUNT(o.order_id) AS num_orders
FROM customer c
LEFT JOIN cust_order o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

-- Orders with customer names, order status, and shipping method
SELECT 
    c.firstName, 
    c.lastName, 
    o.order_id, 
    os.status_value AS order_status, 
    sm.method_name AS shipping_method
FROM cust_order o
JOIN customer c ON o.customer_id = c.customer_id
JOIN order_status os ON o.status_id = os.status_id
JOIN shipping_method sm ON o.shipping_id = sm.shipping_id;

-- Show all customers and their addresses
SELECT 
    c.firstName, 
    c.lastName, 
    a.street, 
    a.city, 
    a.state, 
    a.postal_code, 
    co.country_name
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN country co ON a.country_id = co.country_id;

-- Get a list of all books with their authors, publishers, and language
SELECT 
    b.title AS book_title,
    a.firstName AS author_first_name, 
    a.lastName AS author_last_name, 
    p.publisher_name, 
    bl.language_name
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
JOIN publisher p ON b.publisher_id = p.publisher_id
JOIN book_language bl ON b.language_id = bl.language_id;