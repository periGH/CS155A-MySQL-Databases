/*  Assignment 8.sql 
    Perihan Sahan
    CS 155A, Fall 2017 */
 
 
/* Just copy / paste from mysql command-line to a text editor to do this. */

\W    

/* Library Database */

USE library; 

/* Query 0 */

SELECT user(), current_date(), version(), @@sql_mode\G

/* Query 1 */

SELECT p.Name, COUNT(*) AS numbers_of_publisher
FROM books b
JOIN publisher p ON (p.publisher_id = b.publisher_id)
GROUP BY b.publisher_id ; 


/* Query 2 */

SELECT count(*) as number_of_books
FROM books
WHERE publisher_id = '3' ;

/* Query 3 */

SELECT title, ISBN, MIN(pub_date)
FROM books; 

/* Query 4 */

SELECT category_name, count(*) AS number_of_books
FROM books 
WHERE category_name = 'computer'; 

/* Query 5 */

SELECT category_name, count(*) AS number_of_books
FROM books
GROUP BY category_name; 

/* Query 6 */

SELECT p.Name, b.Title
FROM publisher p 
JOIN books b ON (b.publisher_id = p.publisher_id)
WHERE title= 'Database Implementation'; 

/* Query 7 */

SELECT o.title, m.last_name, m.address, MAX(due_date), count(*)
FROM member m, books o, branches b, bookloans s 
WHERE m.card_no = s.card_no AND o.ISBN = s.ISBN AND 
   b.branch_id = s.branch_id AND b.city = 'Foster City'  
GROUP BY o.title, m.last_name, m.address
HAVING MAX(due_date) <= '2015-06-12'; 

/* Query 8 */

SELECT r.branch_id, r.branch_name, count(*) AS number_of_books
FROM branches r
JOIN bookloans o ON (r.branch_id = o.branch_id)
GROUP BY branch_id, branch_name; 

/* Query 9 */

SELECT m.card_no, first_name, last_name, address, count(b.date_out) AS number_of_books
FROM member m
JOIN bookloans b ON (b.card_no = m.card_no)
GROUP BY m.card_no, first_name, last_name
HAVING count(b.date_out) = 1; 

/* Query 10 */

SELECT b.author_id, count(*) AS number_of_books
FROM bookauthor b, author a 
WHERE a.author_id = b.author_id AND a.Lname='White' AND a.Fname='Lisa'; 

