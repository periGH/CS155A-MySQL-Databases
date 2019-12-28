/*  Assignment 9.sql 
    Perihan Sahan 
    CS 155A, Fall 2017 */
 
 
/* Just copy / paste from mysql command-line to a text editor to do this. */

\W    

/* BOOKSTORE DATABASE */

USE bookstore; 

/* Query 0 */

SELECT user(), current_date(), version(), @@sql_mode\G

/* Query 1 */

SELECT c.category_name 
FROM category c 
WHERE c.category_id IN (SELECT category_id 
                        FROM product p 
                        WHERE c.category_id = p.category_id) 
ORDER BY category_name; 


/* Query 2 */

SELECT product_name, list_price 
FROM product 
WHERE list_price > (SELECT AVG(list_price) FROM product)
ORDER BY list_price DESC;  


/* Query 3 */

SELECT c.category_name 
FROM category c 
WHERE EXISTS (SELECT * FROM product p 
              WHERE c.category_id = p.category_id) ;


/* Query 4 */

SELECT c.email_address, o.order_id, (i.item_price - i.discount_amount)*i.quantity AS order_total 
FROM customer c
JOIN orders o ON (c.customer_id = o.customer_id)
JOIN orderitems i ON (o.order_id = i.order_id)
WHERE c.customer_id =  o.customer_id
AND o.order_id IN (SELECT order_id FROM orderitems i
                    GROUP BY order_id); 


/* Query 5 */

SELECT  c.email_address, order_id, order_date 
FROM orders o , customer c
WHERE c.customer_id = (SELECT customer_id FROM customer c
                     WHERE c.customer_id = o.customer_id 
                     GROUP BY customer_id); 

/* Query 6 */

SELECT product_id, product_name, list_price 
FROM product 
WHERE list_price > SOME (SELECT list_price FROM product); 


/* Query 7 */

SELECT last_name, first_name
FROM customer 
WHERE EXISTS (SELECT * FROM orderitems
              WHERE item_price > 300); 

/* Query 8 */

SELECT last_name, first_name, email_address
FROM customer 
WHERE EXISTS (SELECT * FROM orders 
              WHERE order_id IN (1,2,3)); 

/* Query 9 */


SELECT DISTINCT c.last_name, c.first_name, c.email_address
FROM customer c JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id
JOIN vendor v ON p.vendor_id = v.vendor_id
WHERE company_name IN 
  (SELECT company_name FROM vendor WHERE company_name LIKE 'H%');

/* Query 10 */

SELECT product_id, product_name, list_price 
FROM product 
WHERE EXISTS (SELECT category_id 
              FROM product 
              GROUP BY category_id 
              HAVING COUNT(*) > 2); 



