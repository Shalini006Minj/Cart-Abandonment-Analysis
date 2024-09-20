-- Key Metrics to Analyze:

-- 1. Cart Abandonment Rate:
SELECT 
    (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM cart_data)) AS abandonment_rate
FROM cart_data
WHERE purchase_status = 'Abandoned';

-- 2. Most Abandoned Products:
SELECT 
    p.category, c.product_id, COUNT(*) AS abandonment_count
FROM cart_data AS c
INNER JOIN product_data AS p
ON c.product_id = p.product_id
WHERE purchase_status = 'Abandoned'
GROUP BY product_id
ORDER BY abandonment_count DESC
LIMIT 5;

-- 3. Average amount spent by users who completed purchases:
SELECT 
    ROUND(AVG(total_amount),2) AS average_cart_value
FROM transaction_data
WHERE payment_status = 'Completed';

-- 4. Which products are most often bought?
SELECT 
    p.category, c.product_id, COUNT(*) AS purchase_count
FROM cart_data AS c
INNER JOIN product_data AS p
ON c.product_id = p.product_id
WHERE purchase_status = 'Purchased'
GROUP BY product_id
ORDER BY purchase_count DESC
LIMIT 5;

-- 5. Analyze cart abandonment by user location
SELECT 
    u.location, COUNT(c.cart_id) AS abandoned_carts
FROM user_data u
JOIN cart_data c ON u.user_id = c.user_id
WHERE c.purchase_status = 'Abandoned'
GROUP BY u.location
ORDER BY abandoned_carts DESC;

-- 6. Check if session length (time spent on the site) impacts cart abandonment.
SELECT 
    s.user_id, session_time, end_session_time, TIMESTAMPDIFF(MINUTE, s.session_start_time, s.session_end_time) AS session_duration, c.purchase_status
FROM session_data s
JOIN cart_data c ON s.user_id = c.user_id
WHERE c.purchase_status = 'Abandoned'
ORDER BY session_duration DESC;

SELECT 
    s.user_id, session_time, end_session_time, TIMESTAMPDIFF(MINUTE, s.session_start_time, s.session_end_time) AS session_duration, c.purchase_status
FROM session_data s
JOIN cart_data c ON s.user_id = c.user_id
WHERE c.purchase_status = 'Purchased'
ORDER BY session_duration DESC;

-- 7. Understand the top reasons why users abandon their carts.
SELECT 
    reason_for_abandonment, COUNT(*) AS reason_count
FROM abandonment_data
GROUP BY reason_for_abandonment
ORDER BY reason_count DESC;






