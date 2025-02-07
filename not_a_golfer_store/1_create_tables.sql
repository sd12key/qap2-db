-- create new schema, not to mix all of
-- my tables in the default public schema
CREATE SCHEMA IF NOT EXISTS not_a_golfer_store;

-- set default schema to be not_a_golfer_store
-- valid only for current session
SET search_path TO not_a_golfer_store;

-- drop tables if they exist
DROP TABLE IF EXISTS order_items, orders, customers, products;

-- products table
-- price and stock_quantity should be non-negative
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name TEXT NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    stock_quantity INT NOT NULL CHECK (stock_quantity >= 0)
);

-- customers table
-- email probably should be UNIQUE
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    email TEXT UNIQUE
);

-- orders table
-- order_date should not be NULL
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    order_date DATE NOT NULL
);

-- order_items table
-- quantity should be positive
CREATE TABLE order_items (
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (order_id, product_id)
);
