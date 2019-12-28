/*  Assignment 5.sql 
    Perihan Sahan 
    CS 155A, Fall 2017 */
 
 
/* Just copy / paste from mysql command-line to a text editor to do this. */

\W    

/* library database */


/* Query 0 */

SELECT user(), current_date(), version(), @@sql_mode\G

/* Query 1 */

CREATE DATABASE IF NOT EXISTS library; 

USE library; 


/* Query 2 */

CREATE TABLE books ( 
       ISBN VARCHAR(11) NOT NULL, 
       title VARCHAR (29), 
       pub_date DATE, 
       publisher_id INT(1) NOT NULL, 
       category_name VARCHAR(11) NOT NULL, 
       PRIMARY KEY (ISBN) ) ENGINE = INNODB; 

CREATE TABLE member ( 
       card_no INT (4) NOT NULL,
       last_name VARCHAR (8) NOT NULL, 
       first_name VARCHAR (8) , 
       address VARCHAR (20), 
       city VARCHAR (12) NOT NULL, 
       state CHAR (2) NOT NULL, 
       zip INT (5) NOT NULL,
       region VARCHAR (2), 
       PRIMARY KEY (card_no) )  ENGINE = INNODB;

CREATE TABLE branches ( 
       branch_id INT (4) NOT NULL,
       branch_name VARCHAR (12), 
       city VARCHAR (13) NOT NULL,
       PRIMARY KEY (branch_id) ) ENGINE = INNODB;

CREATE TABLE bookloans ( 
       ISBN VARCHAR(11) NOT NULL,
       branch_id INT (4) NOT NULL,
       card_no INT (4) NOT NULL,
       date_out DATE, 
       due_date DATE, 
       FOREIGN KEY (ISBN) REFERENCES BOOKS (ISBN),
       FOREIGN KEY (branch_id) REFERENCES BRANCHES (branch_id),
       FOREIGN KEY (card_no) REFERENCES MEMBER (card_no)
       ) ENGINE = INNODB ; 

       
     
/* Query 3 */

SOURCE c:\my_scripts\insert_data_library_database.sql


/* Query 4 */

SELECT ISBN, title, publisher_id 
  FROM books; 

DESC books; 

/* Query 5 */

ALTER TABLE books
  ADD date_added DATETIME; 


/* Query 6 */

ALTER TABLE member 
  MODIFY first_name VARCHAR (20) NOT NULL;


/* Query 7 */

DESC books; 

DESC member; 


/* Query 8 */

SELECT branch_name, city, branch_id 
  FROM branches; 







