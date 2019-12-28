/*  Assignment 4.sql 
    Perihan Sahan
    CS 155A, Fall 2017 */
 
 
/* Just copy / paste from mysql command-line to a text editor to do this. */

\W    

/* Bookstore database used for this assignment. */

USE bookstore;

/* Query 0 */

SELECT user(), current_date(), version(), @@sql_mode\G

/* Query 1 */

CREATE TABLE computer (

    serial_number INT(7), 
    make CHAR(2) NOT NULL, 
    model CHAR(18),
    processor_type CHAR(13) NOT NULL,
    memory VARCHAR(12),
    disk_size VARCHAR(11), 
    
    PRIMARY KEY(serial_number) )  ENGINE=INNODB;

DESC computer;

/* Query 2 */

INSERT INTO computer VALUES(
		9871234, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871245, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871256, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871267, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 
		'6.0 GBytes', '1.0 TBytes');
INSERT INTO computer VALUES(
		9871278, 'HP', 'Pavilion 500-210qe', 'Intel i5-4530', 
		'6.0 GBytes', '1.0 TBytes');


DESC computer;


/* Query 3 */

ALTER TABLE computer
ADD processor_speed DECIMAL(2,1);

DESC computer;


/* Query 4 */

SELECT * FROM computer;


/* Query 5 */

DESC computer; 


/* Query 6 */

ALTER TABLE computer
DROP COLUMN processor_speed; 

DESC computer; 


/* Query 7 */

RENAME TABLE computer
  TO computer_backup; 


/* Query 8 */

SHOW TABLES; 


/* Query 9 */

DROP TABLE IF EXISTS computer_backup; 

SHOW TABLES; 


/* Query 10 */

ALTER TABLE employee
ADD SalaryYearToDate DECIMAL(6,2);


/* Query 11 */

ALTER TABLE employee
DROP COLUMN SalaryYearToDate; 


/* Query 12 */

SHOW COLUMNS FROM employee; 

DESC employee; 



