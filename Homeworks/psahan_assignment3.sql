
/*  Assignment 3.sql 
    Perihan Sahan
    CS 155A, Fall 2017 */


\W   /* enable warnings! */

/* BOOKSTORE */

USE bookstore;

/* Query 0 */

SELECT user(), current_date(), version(), @@sql_mode\G

/* Query 1 */
SELECT * 
FROM customer 
WHERE customer_id BETWEEN 22229 AND 66669;

SELECT last_name, first_name, customer_id 
FROM customer; 

SELECT last_name, first_name, customer_id 
FROM customer 
WHERE customer_id BETWEEN 22229 AND 66669; 


/* Query 2 */
SELECT *
FROM employee
WHERE NOT(salary = 3400 OR salary = 3000 OR salary = 6000);

SELECT last_name
FROM employee
WHERE last_name LIKE 'S%'; 

SELECT *
FROM employee
WHERE last_name LIKE 'S%' AND NOT (salary = 3400 OR salary = 3000 OR salary=6000);

SELECT first_name, last_name, salary 
FROM employee;

SELECT first_name, last_name, salary 
FROM employee
WHERE last_name LIKE 'S%' AND NOT (salary = 3400 OR salary = 3000 OR salary=6000);


/* Query 3 */
SELECT order_id, order_date, ship_date 
FROM orders
WHERE ship_date IS NULL ; 


/* Query 4 */
SELECT *
FROM customer
WHERE last_name REGEXP 'IN' ; 

SELECT last_name, first_name
FROM customer;

SELECT last_name, first_name
FROM customer
WHERE last_name REGEXP 'IN' 
ORDER BY first_name DESC; 


/* Query 5 */
SELECT product_id, product_name, list_price 
FROM product 
WHERE list_price > 30 AND list_price < 900; 


/* Query 6 */
SELECT order_id, order_date 
FROM orders
WHERE order_date BETWEEN '2015-03-01' AND '2015-03-31 18:37:22'
ORDER BY order_date DESC; 

SELECT order_id, order_date 
FROM orders
WHERE order_date BETWEEN '2015-03-01' AND '2015-04-01' 
ORDER BY order_date DESC;

SELECT order_id, order_date 
FROM orders
WHERE order_date > '2015-02-28' AND order_date < '2015-04-01' 
ORDER BY order_date DESC; 


SELECT order_id, order_date 
FROM orders
WHERE order_date REGEXP '^.....03' 
ORDER BY order_date DESC;


/* Query 7 */
SELECT order_id, ship_date
FROM orders
WHERE ship_date > '2015-01-10' ; 


/* Query 8 */
SELECT order_id, order_date
FROM orders 
WHERE order_date REGEXP '^.....04' ;

SELECT order_id, order_date
FROM orders 
WHERE order_date <= '2015-04-01 23:11:12' ; 

SELECT order_id, order_date
FROM orders 
WHERE order_date <= '2015-04-02' ; 


/* Query 9 */
SELECT product_id, product_code, product_name 
FROM product;

SELECT product_id, product_code, product_name 
FROM product
WHERE product_name REGEXP '^.E.L'
ORDER BY product_code DESC; 


/* Query 10 */
SELECT product_id, category_id, vendor_id, list_price
FROM product
WHERE list_price > 1110.00 AND (category_id = 11 OR category_id = 61) AND (vendor_id = 2 OR vendor_id =1) ;







