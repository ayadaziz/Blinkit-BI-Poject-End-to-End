SELECT 
blinkit_orders.order_id,
blinkit_customers.customer_id,
blinkit_orders.delivery_partner_id,
blinkit_order_items.product_id,
f1.feedback_id,
blinkit_customers.area,
blinkit_customers.customer_name,
blinkit_customers.customer_segment,
blinkit_products.product_name,
blinkit_products.category,
blinkit_products.price,
blinkit_order_items.quantity,
ROUND(blinkit_products.price * blinkit_order_items.quantity) AS value,
dp1.promised_time,
dp1.delivery_time_minutes,
dp1.actual_time,
dp1.reasons_if_delayed,
f1.rating,
f1.feedback_text,
f1.sentiment,
blinkit_orders.order_date::DATE AS date
FROM blinkit_orders
LEFT JOIN blinkit_customers ON blinkit_customers.customer_id = blinkit_orders.customer_id
LEFT JOIN blinkit_order_items ON blinkit_order_items.order_id = blinkit_orders.order_id
LEFT JOIN blinkit_products ON blinkit_products.product_id = blinkit_order_items.product_id
LEFT JOIN blinkit_customer_feedback f1 ON f1.customer_id = blinkit_orders.customer_id
LEFT JOIN blinkit_customer_feedback f2 ON f2.order_id = blinkit_orders.order_id
LEFT JOIN blinkit_delivery_performance dp1 ON dp1.delivery_partner_id =  blinkit_orders.delivery_partner_id
LEFT JOIN blinkit_delivery_performance dp2 ON dp2.order_id =  blinkit_orders.order_id


