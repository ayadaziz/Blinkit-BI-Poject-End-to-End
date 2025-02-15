
ALTER TABLE blinkit_products
ALTER COLUMN price TYPE NUMERIC USING price::NUMERIC;

ALTER TABLE blinkit_order_items
ALTER COLUMN quantity TYPE NUMERIC USING quantity::NUMERIC;


ALTER TABLE blinkit_orders
ALTER COLUMN order_date TYPE TIMESTAMP USING order_date::TIMESTAMP;


ALTER TABLE blinkit_inventory
ALTER COLUMN stock_received TYPE numeric USING stock_received::numeric;