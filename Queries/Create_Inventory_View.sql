DROP VIEW IF EXISTS blinkit_inventory_database;


CREATE VIEW blinkit_inventory_database AS
SELECT 
    i.product_id,
    p.category,
    p.product_name,
    p.price,
    i.date,
    i.stock_received,
    i.damaged_stock,
    ROUND(p.price * i.stock_received, 2) AS price_value
FROM
    blinkit_inventorynew i
INNER JOIN blinkit_products p ON i.product_id = p.product_id;

---------------------------------------------------------------------------------