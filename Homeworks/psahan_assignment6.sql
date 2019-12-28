/*  Assignment 6.sql 
    Perihan Sahan
    CS 155A, Fall 2017 */
 
 
/* Just copy / paste from mysql command-line to a text editor to do this. */

\W    

/* BOOKSTORE database used for this assignment.  */

USE bookstore; 

/* Query 0 */

SELECT user(), current_date(), version(), @@sql_mode\G

/* Query 1 */

INSERT INTO category ( category_id, category_name )
  VALUES ( 81, 'Musical Instruments');

SELECT * FROM category; 


/* Query 2 */

UPDATE category
SET category_name = 'Cameras and Camcorders'
WHERE category_id = 81; 

SELECT * FROM category; 

/* Query 3 */

INSERT INTO product ( product_id, category_id, product_code, product_name, description, 
             list_price, discount_percent, date_added, vendor_id )
  VALUES ( 17234 , 81 , 'Camera640' , 'Canon' , 'Canon EOS Rebel T5 DSLR Camera' ,
           '755.99' , '0' , '2016-04-30 13:14:15' , 2 ); 

SELECT * FROM product; 


/* Query 4 */

UPDATE product 
SET discount_percent = 30 
WHERE category_id = 81; 


/* Query 5 */

DELETE FROM product 
WHERE category_id = '81' ; 

DELETE FROM category
WHERE category_name = 'Cameras and Camcorders' ; 

SELECT * FROM product; 


/* Query 6 */

UPDATE orders 
SET card_type = 'American Express' 
WHERE order_id = '9' ; 


/* Query 7 */

DELETE FROM orderitems 
WHERE order_id = '5' ; 

DELETE FROM orders
WHERE order_id = '5' ; 

/* Query 8 */

UPDATE employee 
SET salary = '6500' 
WHERE salary = '6000' ; 

select * from employee; 

/* Query 9 */

INSERT INTO customer ( customer_id , email_address ,  password , 
                       first_name , last_name ) 
  VALUES ( 99999 , 'rick@raven.com' , ' ' , 'Rick' , 'Raven' ); 

SELECT * FROM customer ; 

/* Query 10 */

UPDATE customer 
SET password = 'secret' 
WHERE email_address = 'rick@raven.com' ; 

SELECT * FROM customer; 

/* Query 11 */

UPDATE customer
SET password = 'reset' ; 


SELECT * FROM customer; 





