/*  Assignment 10.sql 
    PERIHAN SAHAN
    CS 155A, Fall 2017 */
 
 
/* Just copy / paste from mysql command-line to a text editor to do this. */

\W    

/* BOOKSTORE DATABASE */

USE bookstore; 

/* Query 0 */

SELECT user(), current_date(), version(), @@sql_mode\G

/* Query 1 */

SELECT list_price, FORMAT(list_price,1), 
       CONVERT(list_price, SIGNED), 
       CAST(list_price AS SIGNED) 
FROM product; 

/* Query 2 */

SELECT date_added, CAST(date_added AS DATE), 
       DATE_FORMAT( CAST(date_added AS DATETIME), '%Y-%m'), 
       CAST(date_added AS TIME)
FROM product; 


/* Query 3 */

SELECT list_price, discount_percent, 
       (list_price*discount_percent)/100 AS discount_amount, 
       ROUND ((list_price*discount_percent)/100, 2)
FROM product; 


/* Query 4 */

SELECT order_date, DATE_FORMAT(order_date, '%Y'), 
       DATE_FORMAT(order_date, '%b-%d-%Y'), 
       DATE_FORMAT(order_date, '%l:%i %p'), 
       DATE_FORMAT(order_date, '%m/%d/%y %l:%i')
FROM orders; 


/* Query 5 */

SELECT card_number,  LENGTH(card_number), RIGHT(card_number,4), 
       CONCAT('XXXX-XXXX-XXXX-', RIGHT(card_number, 4))
FROM orders; 

/* Query 6 */

SELECT order_id, order_date, 
       DATE_ADD(order_date, INTERVAL 2 DAY) AS approx_ship_date,
       ship_date, DATEDIFF(ship_date, order_date) AS days_to_ship
FROM orders 
      WHERE order_date BETWEEN '2015-03-01' AND '2015-04-01' ;
       
        






