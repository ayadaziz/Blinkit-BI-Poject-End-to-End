CREATE VIEW blinkit_database AS
SELECT  
    blinkit_orders.order_id,
    blinkit_customers.customer_id,
    blinkit_orders.delivery_partner_id,
    blinkit_order_items.product_id,
    blinkit_customer_feedback.feedback_id,
    blinkit_orders.order_date AS order_datetime,
    blinkit_customers.area,
    blinkit_customers.customer_name,
    blinkit_customers.customer_segment,
    blinkit_products.product_name,
    blinkit_products.category,
    blinkit_products.price,
    blinkit_order_items.quantity,
    ROUND(blinkit_products.price * blinkit_order_items.quantity, 2) AS Value,
    blinkit_orders.payment_method,
    blinkit_delivery_performance.promised_time,
    blinkit_delivery_performance.actual_time,
    blinkit_delivery_performance.delivery_time_minutes,
    blinkit_delivery_performance.reasons_if_delayed,
    blinkit_customer_feedback.rating,
    blinkit_customer_feedback.feedback_category,
    blinkit_customer_feedback.feedback_text,
    blinkit_customer_feedback.sentiment AS feedback_segment,
    Rating_Icon.Emoji,
    Rating_Icon.Star,
    Category_Icons.Img,
    DATE(blinkit_orders.order_date) AS Date
FROM 
    blinkit_orders
INNER JOIN blinkit_customers 
    ON blinkit_orders.customer_id = blinkit_customers.customer_id
INNER JOIN blinkit_order_items 
    ON blinkit_order_items.order_id = blinkit_orders.order_id
INNER JOIN blinkit_products 
    ON blinkit_order_items.product_id = blinkit_products.product_id
INNER JOIN blinkit_customer_feedback 
    ON blinkit_customer_feedback.customer_id = blinkit_orders.customer_id
    AND blinkit_customer_feedback.order_id = blinkit_orders.order_id
INNER JOIN blinkit_delivery_performance 
    ON blinkit_delivery_performance.delivery_partner_id = blinkit_orders.delivery_partner_id
    AND blinkit_delivery_performance.order_id = blinkit_orders.order_id
INNER JOIN Rating_Icon 
    ON blinkit_customer_feedback.rating = Rating_Icon.Rating
INNER JOIN Category_Icons 
    ON blinkit_products.category = Category_Icons.category;


