create database grocery;
use grocery;

-- 1. Supplier Table
CREATE TABLE IF NOT EXISTS supplier (
    sup_id TINYINT auto_increment primary KEY,
    sup_name VARCHAR(255),
    address TEXT
);
select * from supplier;
-- 2. Categories Table
CREATE TABLE IF NOT EXISTS categories (
    cat_id TINYINT auto_increment PRIMARY KEY,
    cat_name VARCHAR(255)
);

-- 3. Employees Table
CREATE TABLE IF NOT EXISTS employees (
    emp_id TINYINT auto_increment PRIMARY KEY,
    emp_name VARCHAR(255),
    hire_date VARCHAR(255)
);
-- 4. Customers Table
CREATE TABLE IF NOT EXISTS customers (
    cust_id SMALLINT auto_increment PRIMARY KEY,
    cust_name VARCHAR(255),
    address TEXT
);
-- 5. Products Table
CREATE TABLE IF NOT EXISTS products (
    prod_id TINYINT auto_increment PRIMARY KEY,
    prod_name VARCHAR(255),
    sup_id TINYINT,
    cat_id TINYINT,
    price DECIMAL(10,2),
    FOREIGN KEY (sup_id) REFERENCES supplier(sup_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (cat_id) REFERENCES categories(cat_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);
-- 6. Orders Table
CREATE TABLE IF NOT EXISTS orders (
    ord_id SMALLINT auto_increment PRIMARY KEY,
    cust_id SMALLINT,
    emp_id TINYINT,
    order_date VARCHAR(255),
    FOREIGN KEY (cust_id) REFERENCES customers(cust_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);
-- 7. Order_Details Table
CREATE TABLE IF NOT EXISTS order_details (
    ord_detID SMALLINT AUTO_INCREMENT PRIMARY KEY,
    ord_id SMALLINT,
    prod_id TINYINT,
    quantity TINYINT,
    each_price DECIMAL(10,2),
    total_price DECIMAL(10,2),
    FOREIGN KEY (ord_id) REFERENCES orders(ord_id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (prod_id) REFERENCES products(prod_id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

alter table order_details
modify ord_detID smallINT AUTO_INCREMENT;

alter table order_details
change OrderDetailID ord_detID SMALLINT;
alter table order_details
change OrderID ord_id SMALLINT,
change ProductID prod_id TINYINT,
change PriceEach each_price DECIMAL(10,2),
change TotalPrice total_price DECIMAL(10,2);


alter table order_details
add constraint FOREIGN KEY (ord_id) REFERENCES orders(ord_id)
        ON UPDATE CASCADE ON DELETE CASCADE;
alter table order_details
add constraint FOREIGN KEY (prod_id) REFERENCES products(prod_id)
        ON UPDATE CASCADE ON DELETE CASCADE;



select * from order_details;
select * from orders;
select * from supplier;
select * from products;
select * from employees;
select * from customers;
select * from categories;

desc  order_details;
desc  orders;
desc  supplier;
desc products;



