/* ****************************************************************************/
/*										              	                      */
/*	                                                				          */
/*														                      */
/*	                    The Library Database  		                          */
/*																		      */
/*	                                            			                  */
/*																		      */
/* ****************************************************************************/
CREATE DATABASE IF NOT EXISTS library;
USE Library;

DROP TABLE IF EXISTS bookauthor;
DROP TABLE IF EXISTS bookloans;
DROP TABLE IF EXISTS bookcopies;
DROP TABLE IF EXISTS books;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS publisher;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS branches;

-- 
-- Create the BRANCHES table
--
CREATE TABLE branches(
    branch_id INT NOT NULL,
    branch_name VARCHAR(80) NOT NULL DEFAULT '',
    city VARCHAR(80) DEFAULT NULL,
    PRIMARY KEY (branch_id)
)  ENGINE=INNODB;

-- 
-- Create the member table
--

CREATE TABLE member (
    card_no INT(4),
    last_name VARCHAR(10) NOT NULL,
    first_name VARCHAR(10) NOT NULL,
    address VARCHAR(20),
    city VARCHAR(12),
    state VARCHAR(2),
    zip VARCHAR(5),
    region CHAR(2),
    CONSTRAINT member_region_ck CHECK (region IN ('N' , 'NW', 'NE', 'S', 'SE', 'SW', 'W', 'E')),
    PRIMARY KEY (card_no)
);

-- 
-- Create the PUBLISHER table
--
CREATE TABLE publisher (
    publisher_id INT(2),
    Name VARCHAR(23),
    contact VARCHAR(15),
    phone VARCHAR(12),
    CONSTRAINT publisher_pubid_pk PRIMARY KEY (publisher_id)
); 

-- 
-- Create the AUTHOR table
--
CREATE TABLE author(
    author_id VARCHAR(4),
    Lname VARCHAR(10),
    Fname VARCHAR(10),
    CONSTRAINT author_authorid_pk PRIMARY KEY (author_id)
); 

-- 
-- Create the BOOKS table
--
CREATE TABLE books(
    ISBN VARCHAR(10),
    title VARCHAR(30),
    pub_date DATE,
    publisher_id INT(2),
    category_name VARCHAR(12),
    CONSTRAINT books_isbn_pk PRIMARY KEY (isbn),
    CONSTRAINT books_pubid_fk FOREIGN KEY (publisher_id)
        REFERENCES publisher (publisher_id)
); 
 
-- 
-- Create the BOOKAUTHOR table
--
CREATE TABLE bookauthor(
    ISBN VARCHAR(10),
    author_id VARCHAR(4),
    CONSTRAINT bookauthor_pk PRIMARY KEY (isbn , author_id),
    CONSTRAINT bookauthor_isbn_fk FOREIGN KEY (isbn)
        REFERENCES books (isbn),
    CONSTRAINT bookauthor_authorid_fk FOREIGN KEY (author_id)
        REFERENCES author (author_id)
); 
-- 
-- Create the BOOKCOPIES  table
--
CREATE TABLE bookcopies (
    ISBN VARCHAR(10),
    branch_id INT NOT NULL,
    no_of_copies INT,
    PRIMARY KEY (ISBN , Branch_id),
    FOREIGN KEY (ISBN)
        REFERENCES BOOKS (ISBN),
    FOREIGN KEY (branch_id)
        REFERENCES BRANCHES (branch_id)
);

-- 
-- Create the BOOKLOANS table
--
CREATE TABLE bookloans (
    ISBN VARCHAR(10) NOT NULL,
    branch_id INT NOT NULL,
    card_no INT(4) NOT NULL,
    date_out DATE,
    due_date DATE,
    PRIMARY KEY (ISBN , branch_id , card_no),
    FOREIGN KEY (ISBN)
        REFERENCES BOOKS (ISBN),
    FOREIGN KEY (branch_id)
        REFERENCES branches (branch_id),
    FOREIGN KEY (card_no)
        REFERENCES MEMBER (card_no)
);