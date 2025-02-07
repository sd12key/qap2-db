-- set default schema to be not_a_golfer_store
-- valid only for current session
SET search_path TO not_a_golfer_store;

-- step 1: remove order_items associated with order.id = 5
DELETE FROM order_items 
WHERE order_id = 5;

-- step2: now remove the order itself
DELETE FROM orders 
WHERE id = 5;

-- NOTE: order is important, first remove order_items, then the order itself
-- otherwise we get error, since order_items has a foreign key pointing to orders


-- optional checks

-- check that order_id 5 is no longer in orders
-- SELECT id AS remaining_orders 
-- FROM orders 
-- ORDER BY id;

-- check order_id 5 is no longer in order_items
-- SELECT DISTINCT order_id AS remaining_orders_in_order_items 
-- FROM order_items 
-- ORDER BY order_id;
