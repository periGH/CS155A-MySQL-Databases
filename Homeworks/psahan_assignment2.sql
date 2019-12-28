/* Assignment2.sql
Perihan Sahan 
CS 155A, Fall 2017 */
\W /* enable warnings! */

USE bookstore;

/* Query 0 */
SELECT user(), current_date(), version(), @@sql_mode\G

/* Query 1 */
SELECT * 
FROM customer 
WHERE customer_id != 77779;

SELECT last_name, first_name, customer_id 
FROM customer;

/* Query 2 */
SELECT product_name, description
FROM product 
WHERE category_id > 21;

/* Query 3 */
SELECT  last_name, first_name, customer_id, email_address
FROM customer 
WHERE customer_id = 11119;

/* Query 4 */
SELECT item_id, item_price, discount_amount, quantity, 
item_price * quantity AS price_total, 
discount_amount * quantity AS discount_total, 
(item_price - discount_amount) * quantity AS item_total
FROM orderitems
ORDER BY item_total DESC
LIMIT 5;

/* Query 5 */
SELECT store_id "store ID" , region_id "region ID" , region_name "region name" 
FROM store; 

/* Query 6 */
SELECT customer_id, email_address
FROM customer; 

/* Query 7 */
SELECT DISTINCT customer_id
FROM orders; 

/* Query 8 */
 SELECT product_name, list_price, discount_percent,
(list_price * discount_percent) / 100 AS discount_amount,
list_price - (list_price * discount_percent) / 100 AS discount_price
FROM product 
ORDER BY discount_price DESC
LIMIT 5; 

/* Query 9 */
SELECT customer_id, CONCAT(line1, ', ', line2, ', ', zip_code) AS mailing_list, CONCAT(city, ', ', state) AS city_state
FROM address;

/* Query 10 */
SELECT CONCAT(last_name , ',' , first_name) AS "full_name"
FROM customer; 


