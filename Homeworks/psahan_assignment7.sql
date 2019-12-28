/*  Assignment 7.sql 
    PERIHAN SAHAN 
    CS 155A, Fall 2017 */
 
 
/* Just copy / paste from mysql command-line to a text editor to do this. */

\W    

/* BOOKSTORE database used for this assignment.*/

USE bookstore;

/* Query 0 */

SELECT user(), current_date(), version(), @@sql_mode\G

/* Query 1 */

SELECT category_name, product_name, list_price 
FROM product p 
JOIN category c 
ON p.category_id = c.category_id 
ORDER BY category_name, product_name; 

/* Query 2 */

SELECT first_name, last_name, line1, city, state, zip_code 
FROM address a 
JOIN customer c 
ON a.customer_id = c.customer_id 
WHERE c.email_address = 'allan.sherwood@yahoo.com' ; 

SELECT first_name, last_name, line1, city, state, zip_code 
FROM address a, customer c 
WHERE a.customer_id = c.customer_id 
AND ( email_address = 'allan.sherwood@yahoo.com'); 


/* Query 3 */

SELECT first_name, last_name, line1, city, state, zip_code
FROM address a, customer c
WHERE a.customer_id = c.customer_id
AND (a.address_id = c.shipping_address_id);

/* Query 4 */

SELECT last_name, first_name, order_date, product_name, 
       item_price, quantity
FROM customer AS c 
JOIN orders AS o ON o.customer_id = c.customer_id 
JOIN orderitems AS r ON o.order_id = r.order_id
JOIN product AS p ON r.product_id = p.product_id
ORDER BY last_name, order_date; 

/* Query 5 */

SELECT p.product_name, p.list_price
FROM product p
JOIN product x
ON p.product_id <> x.product_id
AND p.list_price = x.list_price ;

/* Query 6 */

SELECT product_id, product_name,
       v.company_name, list_price 
FROM product p 
JOIN vendor v 
ON p.vendor_id = v.vendor_id ; 


/* Query 7 */

SELECT c.category_name, p.product_id 
FROM product p 
RIGHT JOIN category c 
ON product_id = 'NULL' ; 

/* Query 8 */

SELECT o.order_id, order_date, product_name, quantity,
       ( item_price + ship_amount + tax_amount)- discount_amount  AS amount
FROM product p 
JOIN orderitems o ON (p.product_id = o.product_id)
JOIN orders r ON (o.order_id = r.order_id) ; 

       
/* Query 9 */

SELECT c.first_name, c.last_name, o.ship_date, order_date
FROM customer c
JOIN orders o 
ON c.customer_id = o.customer_id 
ORDER BY ship_date, order_date; 


/* Query 10 */

SELECT product_name, o.order_id, shipping_address_id 
FROM product p 
JOIN orderitems o ON (p.product_id = o.product_id)
JOIN orders r ON (o.order_id = r.order_id)
JOIN customer c ON (r.customer_id = c.customer_id)
ORDER BY product_name ; 


/* Query 11 */

SELECT last_name, first_name, o.order_id, order_date,
       o.product_id, product_name
FROM product AS p
JOIN orderitems AS o ON o.product_id = p.product_id
JOIN orders AS r ON o.order_id = r.order_id
JOIN customer AS c ON r.customer_id = c.customer_id; 





