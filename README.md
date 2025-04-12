# 📚 Bookstore Management System – SQL Project

Welcome to the Bookstore Management System SQL project! This project involves designing and implementing a relational database to manage various bookstore operations, including customers, orders, books, employees, and payments. The goal is to apply real-world SQL concepts such as schema design, data manipulation, and user role management.

# ✅ Expected Outcomes

Design a real-world relational database in MySQL.
Create optimized table schemas with constraints and relationships.
Set up access control with user roles and privileges
Perform effective SQL queries to generate insights from data.

## 💻 Requirements

MySQL Server or compatible SQL database.
SQL editor (e.g., MySQL Workbench, DBeaver, VS Code with SQL extensions).
Intermediate knowledge of SQL (DDL, DML, and basic querying).

## 🎯 Project Objectives

By completing this project, you will:
Design and implement a SQL database from scratch.
Define table schemas with appropriate data types and constraints.
Populate the tables with sample data for testing and analysis.
Implement user roles and access control to manage database security.
Execute and test SQL queries to analyze and retrieve meaningful insights from the data.

## 🏗️ Step-by-Step Instructions

### ❓ Question 1
Create a New Database
CREATE DATABASE bookstore_db;

### ❓ Question 2

Determine the table schema and data types
book
book_author
author
book_language
publisher
customer
customer_address
address_status
address
country
cust_order
order_line
shipping_method
order_history
order_status

### ❓ Question 3
Write the SQL commands to create tables that match the data structure.
Populate Tables with Sample Data
Insert sample records into each table for testing and demonstration purposes.

### ❓ Question 4
Set Up User Groups and Roles for bookstore_db
CREATE USER 'clerk'@'localhost' IDENTIFIED BY 'clerkpass';
GRANT SELECT, INSERT ON bookstore_db.* TO 'clerk'@'localhost';
CREATE USER 'manager'@'localhost' IDENTIFIED BY 'managerpass';
GRANT ALL PRIVILEGES ON bookstore_db.* TO 'manager'@'localhost';

FLUSH PRIVILEGES;

### *📃 Verify User Privileges*
SHOW GRANTS FOR 'clerk'@'localhost';
SHOW GRANTS FOR 'manager'@'localhost';

### 📂 Project Structure
The project directory is organized as follows:
```
bookstore-db/
├── schema.sql           -- Contains all CREATE TABLE statements
├── insert_data.sql      -- Contains INSERT INTO statements for sample data
├── queries.sql          -- Sample queries to test database functionality
├── users_roles.sql      -- Script to manage users and roles
└── README.md            -- Documentation for the project

## ## 🗺️ Entity Relationship Diagram (ERD)

Below is the ERD representing the structure of the Bookstore Management System database:
![ERD Diagram](Assets/ERD.png)

```

### 🙌 Contributions
Feel free to clone, extend, or modify this project. Pull Requests (PRs) are welcome!

### *✨ Good Luck!*
 Happy querying! 🚀          



