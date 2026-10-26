-- Source: https://github.com/francispaintsil/database-normalization-at-Fred-furniture-main/blob/9aafc68ad0f7f977143e5843f949ee959d6d45cd/main.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 6

CREATE TABLE customers AS
SELECT DISTINCT customer_id, customer_phone, customer_email
FROM store;

CREATE TABLE items AS
SELECT DISTINCT item_1_id as item_id, item_1_name as name, item_1_price as price 
FROM store
UNION
SELECT DISTINCT item_2_id as item_id, item_2_name as name, item_2_price as price
FROM store
WHERE item_2_id IS NOT NULL
UNION
SELECT DISTINCT item_3_id as item_id, item_3_name as name, item_3_price as price
FROM store
WHERE item_3_id IS NOT NULL;

CREATE TABLE orders_items AS
SELECT order_id, item_1_id as item_id 
FROM store
UNION ALL
SELECT order_id, item_2_id as item_id
FROM store
WHERE order_id IS NOT NULL
UNION ALL
SELECT order_id, item_3_id as item_id
FROM store
WHERE order_id IS NOT NULL;

CREATE TABLE orders AS
SELECT order_id, order_date, customer_id
FROM store;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE orders
ADD FOREIGN KEY (customer_id) 
REFERENCES customers(customer_id);

ALTER TABLE orders_items
ADD FOREIGN KEY (item_id) 
REFERENCES items(item_id);

ALTER TABLE orders_items
ADD FOREIGN KEY (order_id) 
REFERENCES orders(order_id);

