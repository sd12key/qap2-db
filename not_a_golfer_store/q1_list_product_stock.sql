-- set default schema to be not_a_golfer_store
-- valid only for current session
SET search_path TO not_a_golfer_store;

-- the names and stock quantities of all products
SELECT 	product_name, 
		stock_quantity AS qty_in_stock
		FROM products
