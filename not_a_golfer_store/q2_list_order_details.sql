-- set default schema to be not_a_golfer_store
-- valid only for current session
SET search_path TO not_a_golfer_store;

-- list order details for order.id = 5
SELECT
    order_items.order_id AS order_id,
	order_items.product_id AS product_id,
    products.product_name, 
    order_items.quantity AS qty_ordered
FROM order_items
JOIN products ON order_items.product_id = products.id
WHERE order_items.order_id = 5;
