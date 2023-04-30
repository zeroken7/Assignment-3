-- Solution to Capture1
USE sql_store; -- Just in case schema isn't selected
SELECT 
    o.order_date, 
    o.order_id, 
    c.first_name, 
    s.name as shipper,
    o_s.name as status
FROM orders o
JOIN customers c USING(customer_id)
JOIN order_statuses o_s ON o.status = o_s.order_status_id
LEFT JOIN shippers s USING(shipper_id)
ORDER BY o_s.name, o.order_id;

-- Solution to Capture2
