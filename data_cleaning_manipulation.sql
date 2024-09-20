-- Cart data cleaning/manipulation
SELECT * FROM sql_project.cart_data;

ALTER TABLE sql_project.cart_data ADD new_date_column DATE; 

ALTER TABLE sql_project.cart_data ADD new_removed_from_cart_date DATE;

UPDATE sql_project.cart_data
SET new_date_column = DATE(added_to_cart_date);

UPDATE sql_project.cart_data
SET new_removed_from_cart_date = DATE(removed_from_cart_date);

-- Abandonment data cleaning/manipulation
SELECT * FROM sql_project.abandonment_data;

ALTER TABLE sql_project.abandonment_data ADD new_abandonment_date DATE; 

UPDATE sql_project.abandonment_data
SET new_abandonment_date = DATE(abandonment_date);

-- Product data cleaning/manipulation
SELECT * FROM sql_project.product_data;

ALTER TABLE sql_project.product_data ADD new_date_added DATE; 

UPDATE sql_project.product_data
SET new_date_added = DATE(date_added);

-- Transaction data cleaning/manipulation
SELECT * FROM sql_project.transaction_data;

ALTER TABLE sql_project.transaction_data ADD new_transaction_date DATE; 

UPDATE sql_project.transaction_data
SET new_transaction_date = DATE(transaction_date);

-- User data cleaning/manipulation
SELECT * FROM sql_project.user_data;

ALTER TABLE sql_project.user_data ADD new_registration_date DATE; 

UPDATE sql_project.user_data
SET new_registration_date = DATE(registration_date);

-- Session data cleaning/manipulation
SELECT * FROM sql_project.session_data;

ALTER TABLE sql_project.session_data
ADD session_date DATE,
ADD session_time TIME;

ALTER TABLE sql_project.session_data
ADD end_session_date DATE,
ADD end_session_time TIME;

UPDATE sql_project.session_data
SET session_date = DATE(session_start_time),
    session_time = TIME(session_start_time);
    
UPDATE sql_project.session_data
SET end_session_date = DATE(session_end_time),
    end_session_time = TIME(session_end_time);
