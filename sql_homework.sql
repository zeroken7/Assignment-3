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
USE sql_invoicing;
SELECT 
    p.date, 
    c.name as client, 
    p.amount,
    p_m.name
FROM payments p
JOIN clients c USING(client_id)
JOIN payment_methods p_m ON p.payment_method = p_m.payment_method_id;

-- Solution to Capture3
USE sql_store;
SELECT 
    c.customer_id, 
    c.first_name, 
    c.points,
    CASE
	WHEN c.points < 2000 THEN 'bronze'
        WHEN c.points < 3000 THEN 'silver'
        ELSE 'gold'
    END as type
FROM customers c
ORDER BY c.first_name;
