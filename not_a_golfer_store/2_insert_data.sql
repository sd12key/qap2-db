-- set default schema to be not_a_golfer_store
-- valid only for current session
SET search_path TO not_a_golfer_store;

-- was used for debug purposes, removing all data
-- from the tables, and resetting serial id counters
TRUNCATE TABLE products, customers, orders, order_items RESTART IDENTITY;

-- insert data into students table
INSERT INTO products (product_name, price, stock_quantity) 
VALUES 
    ('The Dude''s Signature Bowling Ball', 99.99, 20),
    ('Walter''s Shomer Shabbos Ball Cleaner', 14.99, 50),
    ('Donny''s ''Am I Wrong?'' Bowling Shoes', 69.99, 15),
    ('The Rug That Ties the Lane Together', 129.99, 10),
    ('The Marmot Ball Bag', 34.99, 25),
    ('Jackie Treehorn''s Lane Lubricant', 22.49, 30),
    ('Mark It Zero Scorebook', 9.99, 40),
    ('The Nihilist Wrist Guard', 19.99, 35),
    ('Over the Line! Foul Line Tape', 8.99, 45),
    ('The Big Lebowski Pin Set', 54.99, 20),
    ('Dude''s Bowling Robe', 79.99, 12),
    ('Walter''s Dog Carrier', 39.99, 18),
    ('''Shut Up Donny!'' Earplugs', 5.99, 60),
    ('Gutterball Recovery Kit', 24.99, 22),
    ('Jeffrey''s White Russian Flask', 29.99, 15);

-- insert data into professors table
INSERT INTO customers (first_name, last_name, email) 
VALUES 
    ('Jeffrey','Lebowski','thedude@marmot.edu'),
    ('Jesus','Quintana','quintanaj@marmot.edu'),
    ('Jackie','Treehorn', 'treehornj@marmot.edu'),
    ('Walter','Sobchak','sobchakw@marmot.edu'),
    ('Donny','Kerabatsos','kerabatsosd@marmot.edu'),
    ('Uli','Kunkel','kunkelu@marmot.edu'),
    ('Karl','Hungus','hungusk@marmot.edu');

INSERT INTO orders (customer_id, order_date)
VALUES 
    ((SELECT id FROM customers WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski'), '2024-06-12'),
    ((SELECT id FROM customers WHERE first_name = 'Uli' AND last_name = 'Kunkel'), '2024-07-08'),
    ((SELECT id FROM customers WHERE first_name = 'Walter' AND last_name = 'Sobchak'), '2024-07-20'),
    ((SELECT id FROM customers WHERE first_name = 'Donny' AND last_name = 'Kerabatsos'), '2024-08-05'),
    ((SELECT id FROM customers WHERE first_name = 'Jesus' AND last_name = 'Quintana'), '2024-08-10'),
    ((SELECT id FROM customers WHERE first_name = 'Jackie' AND last_name = 'Treehorn'), '2024-10-05'),
    ((SELECT id FROM customers WHERE first_name = 'Karl' AND last_name = 'Hungus'), '2024-10-22'),
    ((SELECT id FROM customers WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski'), '2024-12-25'),
    ((SELECT id FROM customers WHERE first_name = 'Walter' AND last_name = 'Sobchak'), '2025-01-10');


INSERT INTO order_items (order_id, product_id, quantity)
VALUES
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski') AND order_date = '2024-06-12'), (SELECT id FROM products WHERE product_name = 'The Dude''s Signature Bowling Ball'), 2),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski') AND order_date = '2024-06-12'), (SELECT id FROM products WHERE product_name = 'Mark It Zero Scorebook'), 1),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski') AND order_date = '2024-06-12'), (SELECT id FROM products WHERE product_name = 'Gutterball Recovery Kit'), 3),

    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Uli' AND last_name = 'Kunkel') AND order_date = '2024-07-08'), (SELECT id FROM products WHERE product_name = 'Gutterball Recovery Kit'), 2),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Uli' AND last_name = 'Kunkel') AND order_date = '2024-07-08'), (SELECT id FROM products WHERE product_name = 'The Nihilist Wrist Guard'), 1),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Uli' AND last_name = 'Kunkel') AND order_date = '2024-07-08'), (SELECT id FROM products WHERE product_name = '''Shut Up Donny!'' Earplugs'), 3),

    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Walter' AND last_name = 'Sobchak') AND order_date = '2024-07-20'), (SELECT id FROM products WHERE product_name = 'Walter''s Shomer Shabbos Ball Cleaner'), 1),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Walter' AND last_name = 'Sobchak') AND order_date = '2024-07-20'), (SELECT id FROM products WHERE product_name = 'The Marmot Ball Bag'), 3),

    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Donny' AND last_name = 'Kerabatsos') AND order_date = '2024-08-05'), (SELECT id FROM products WHERE product_name = 'The Dude''s Signature Bowling Ball'), 2),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Donny' AND last_name = 'Kerabatsos') AND order_date = '2024-08-05'), (SELECT id FROM products WHERE product_name = 'Mark It Zero Scorebook'), 1),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Donny' AND last_name = 'Kerabatsos') AND order_date = '2024-08-05'), (SELECT id FROM products WHERE product_name = 'Jackie Treehorn''s Lane Lubricant'), 3),

    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Jesus' AND last_name = 'Quintana') AND order_date = '2024-08-10'), (SELECT id FROM products WHERE product_name = 'Jackie Treehorn''s Lane Lubricant'), 3),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Jesus' AND last_name = 'Quintana') AND order_date = '2024-08-10'), (SELECT id FROM products WHERE product_name = 'The Rug That Ties the Lane Together'), 2),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Jesus' AND last_name = 'Quintana') AND order_date = '2024-08-10'), (SELECT id FROM products WHERE product_name = 'Gutterball Recovery Kit'), 1),

    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Jackie' AND last_name = 'Treehorn') AND order_date = '2024-10-05'), (SELECT id FROM products WHERE product_name = 'The Big Lebowski Pin Set'), 4),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Jackie' AND last_name = 'Treehorn') AND order_date = '2024-10-05'), (SELECT id FROM products WHERE product_name = '''Shut Up Donny!'' Earplugs'), 2),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Jackie' AND last_name = 'Treehorn') AND order_date = '2024-10-05'), (SELECT id FROM products WHERE product_name = 'Jeffrey''s White Russian Flask'), 3),

    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Karl' AND last_name = 'Hungus') AND order_date = '2024-10-22'), (SELECT id FROM products WHERE product_name = 'The Rug That Ties the Lane Together'), 3),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Karl' AND last_name = 'Hungus') AND order_date = '2024-10-22'), (SELECT id FROM products WHERE product_name = 'The Big Lebowski Pin Set'), 2),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Karl' AND last_name = 'Hungus') AND order_date = '2024-10-22'), (SELECT id FROM products WHERE product_name = 'Walter''s Dog Carrier'), 1),

    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski') AND order_date = '2024-12-25'), (SELECT id FROM products WHERE product_name = 'Walter''s Dog Carrier'), 1),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski') AND order_date = '2024-12-25'), (SELECT id FROM products WHERE product_name = 'The Nihilist Wrist Guard'), 2),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Jeffrey' AND last_name = 'Lebowski') AND order_date = '2024-12-25'), (SELECT id FROM products WHERE product_name = 'Over the Line! Foul Line Tape'), 3),

    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Walter' AND last_name = 'Sobchak') AND order_date = '2025-01-10'), (SELECT id FROM products WHERE product_name = 'Donny''s ''Am I Wrong?'' Bowling Shoes'), 2),
    ((SELECT id FROM orders WHERE customer_id = (SELECT id FROM customers WHERE first_name = 'Walter' AND last_name = 'Sobchak') AND order_date = '2025-01-10'), (SELECT id FROM products WHERE product_name = 'Over the Line! Foul Line Tape'), 1);

-- check
-- SELECT * FROM products;
-- SELECT * FROM customers;
-- SELECT * FROM orders;
-- SELECT * FROM order_items;

-- showing order history with full details
SELECT 
    orders.id AS order_id,
    orders.order_date AS placed_on,
    customers.first_name || ' ' || customers.last_name AS by_customer,
    products.id AS ordered_product_id,
    products.product_name AS ordered_product,
	products.price,
    order_items.quantity AS ordered_quantity
FROM orders
JOIN customers ON orders.customer_id = customers.id
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id;
