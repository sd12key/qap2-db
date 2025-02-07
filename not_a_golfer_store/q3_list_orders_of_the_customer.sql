-- set default schema to be not_a_golfer_store
-- valid only for current session
SET search_path TO not_a_golfer_store;

-- list all orders with full details for the customer 
-- with first name 'Jeffrey' and last name 'Lebowski'
SELECT
	customers.first_name || ' ' || customers.last_name AS customer_name,
    orders.id AS order_id, 
    orders.order_date, 
    products.id AS product_id, 
    products.product_name, 
    order_items.quantity AS qty_ordered
FROM orders
JOIN order_items ON orders.id = order_items.order_id
JOIN products ON order_items.product_id = products.id
JOIN customers ON orders.customer_id = customers.id
WHERE customers.first_name = 'Jeffrey' AND customers.last_name = 'Lebowski';
