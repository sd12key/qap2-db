-- set default schema to be not_a_golfer_store
-- valid only for current session
SET search_path TO not_a_golfer_store;

-- deduct from available stock
-- quantities of products
-- which were ordered in order.id = 5
-- not sure if GREATEST() is SQL-standard...
UPDATE products
SET stock_quantity = GREATEST(stock_quantity - order_items.quantity, 0)
FROM order_items
WHERE products.id = order_items.product_id
AND order_items.order_id = 5;

-- another way do do the same thing using JOIN (so FROM is not needed).
--
-- UPDATE products
-- JOIN order_items ON products.id = order_items.product_id
-- SET products.stock_quantity = GREATEST(products.stock_quantity - order_items.quantity, 0)
-- WHERE order_items.order_id = 5;
--

-- check the resulting quantities
SELECT 	products.id AS product_id, 
    	products.product_name, 
    	products.stock_quantity AS remaining_qty
		FROM products
JOIN order_items ON products.id = order_items.product_id
WHERE order_items.order_id = 5;
