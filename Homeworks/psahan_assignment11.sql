/*  Assignment 11.sql 
    Perihan Sahan 
    CS 155A, Fall 2017 */
 
 
/* Just copy / paste from mysql command-line to a text editor to do this. */

\W    

/* BOOKSTORE DATABASE */

USE bookstore ; 

/* Query 0 */

SELECT user(), current_date(), version(), @@sql_mode\G

/* Query 1 */

CREATE VIEW customer_address(first_name, last_name, customer_id, ship_line1, ship_line2, ship_city, ship_state,ship_zip, bill_line1,bill_line2, bill_city, bill_state, bill_zip) AS
SELECT c.first_name, c.last_name, a.customer_id,a.line1, a.line2, a.city, a.state, a.zip_code, a.line1, a.line2, a.city, a.state, a.zip_code 
FROM customer c 
JOIN address a ON (c.customer_id = a.customer_id);  


SELECT * FROM customer_address; 



CREATE or REPLACE view customer_info AS 
SELECT customer_id, email_address, last_name, first_name
FROM customer; 

SELECT * FROM customer_info; 


CREATE VIEW cust_address(bill_line1, bill_line2, bill_city, bill_state, bill_zip, ship_line1, ship_line2, ship_city, ship_state, ship_zip)
AS SELECT line1, line2, city, state, zip_code, line1, line2, city, state, zip_code
FROM address; 

SELECT * FROM cust_address; 



SELECT customer_id, last_name, first_name, bill_line1 FROM customer_address;


/* Query 2 */

UPDATE customer_address
SET ship_line1 = '1990 Westwood Blvd.' 
WHERE customer_id = '11119' ; 


/* Query 3 */

CREATE VIEW product_summary(product_id, order_count, order_total) AS 
SELECT product_id , quantity, item_price - discount_amount              
FROM orderitems; 

SELECT * FROM product_summary; 

/* Query 4 */

CREATE VIEW cheap_products AS
SELECT * FROM product
WHERE list_price < 50 WITH CHECK OPTION ;

SELECT * FROM cheap_products ; 

/* Query 5 */

INSERT IGNORE INTO cheap_products (product_id, category_id, product_code,
  product_name, list_price, description, discount_percent, date_added, vendor_id)
VALUES('17888', '41' , 'book db' , 'Fundamental of Database Systems' , '45.99', 
  'Fundamental of Database Systems Elmasri' , '20.00' , '2015-06-01 11:12:59' , '2') ; 

SELECT * FROM cheap_products ; 

/* Query 6 */

CREATE VIEW contact(first_name, phone_number) AS
SELECT contact_fname, phone FROM vendor WITH CHECK OPTION; 

SELECT * FROM contact; 

/* Query 7 */

CREATE VIEW order_items AS
SELECT o.order_id, o.order_date, o.tax_amount, o.ship_date, 
  i.item_price, i.discount_amount, i.item_price - i.discount_amount AS item_total, p.product_name 
FROM orders o, orderitems i, product p 
WHERE o.order_id = i.order_id 
AND i.product_id = p.product_id ; 

SELECT * FROM order_items ; 

/* Query 8 */

CREATE VIEW reorder_info AS
SELECT p.product_id, p.product_name, v.contact_fname, v.phone 
FROM product p, vendor v 
WHERE p.vendor_id = v.vendor_id ; 

SELECT * FROM reorder_info ; 