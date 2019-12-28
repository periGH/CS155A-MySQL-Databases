 /* Assignment1.sql
     Perihan Sahan 
     CS 155A, Fall 2017 */
\W      /* enable warnings! */


  /* Query 0 */
  SELECT user(), current_date(), version(), @@sql_mode\G

  /* Query 1 */
  CREATE DATABASE IF NOT EXISTS bookdb;
  USE bookdb;

  /* Query 2 */
  DROP TABLE IF EXISTS books;
  CREATE TABLE books (
      isbn CHAR(10),
      author VARCHAR(100) NOT NULL,
      title VARCHAR(128) NOT NULL,
      price DECIMAL(7 , 2 ) NOT NULL,
      subject VARCHAR(30) NOT NULL,
      PRIMARY KEY (isbn)
      )ENGINE = INNODB;

  /* Query 3 */
  INSERT INTO books
  VALUES ('0345377648', 'Anne Rice', 'Lasher', 14.00, 'FICTION');
  INSERT INTO books
  VALUES('1557044287','Ridley cott','Gladiator',26.36,'FICTION');
  INSERT INTO books
  VALUES ('0684856093', 'Sean Covey', 'The 7 Habits', 12, 'CHILDREN');

  /* Query 4 */
  SHOW TABLES;

  /* Query 5 */
  DESCRIBE books;

  /* Query 6 */
  SELECT *
  FROM books;

  /* Query 7 */
  SELECT ISBN, title, price
  FROM books;

  