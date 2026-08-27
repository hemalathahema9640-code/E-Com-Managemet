CREATE DATABASE ECOMMERCE;

USE ECOMMERCE;

CREATE TABLE CATEGORY
(
     CATEGORYID INT PRIMARY KEY,
     CATEGORYNAME VARCHAR(50)
);

CREATE TABLE PRODUCT
(
       PRODUCTID INT PRIMARY KEY,
       PRODUCTNAME VARCHAR (1000),
       PRICE DECIMAL (10,0),
       STOCK INT,
       CATEGORYID INT,
       FOREIGN KEY (CATEGORYID)
       REFERENCES CATEGORY(CATEGORYID)
);

INSERT INTO CATEGORY VALUES
   (1, "ELECTRONICS"),
   (2, "FASHION"),
   (3, "HOME AND KITCHEN"),
   (4, "BEAUTY AND PERSONAL CARE"),
   (5, "GROCERY"),
   (6, "BOOKS AND STATIONARY"),
   (7, "SPORTS AND FITNESS"),
   (8, "TOYS AND GAMES");
   
SELECT * FROM CATEGORY;

INSERT INTO PRODUCT VALUES
    (101, "Mobile", 30000, 25, 1),
    (102, "Laptop", 120000, 30, 1),
    (103,"Headphones", 3000, 10, 1),
    (104, "Cameras", 70000, 20, 1),
    (105, "Smartwatches", 3500, 50,1),
    (106, 'Jeans', 1299.00, 25, 2),
    (107, 'Casual Shoes', 1499.00, 20, 2),
    (108, 'Hand Bag', 899.00, 18, 2),
    (109, 'Face Wash', 299.00, 30, 3),
    (110, 'Moisturizer', 399.00, 25, 3),
    (111, 'Lip Balm', 199.00, 35, 3),
	(112, 'Shampoo', 349.00, 20, 3),
    (113, 'Coffee Mug', 199.00, 50, 4),
	(114, 'Water Bottle', 499.00, 35, 4),
    (115, 'Cookware Set', 1999.00, 15, 4),
	(116, 'Table Lamp', 799.00, 20, 4),
    (117, 'Java Programming Book', 450.00, 20, 5),
	(118, 'Python Programming Book', 500.00, 18, 5),
    (119, 'Data Structures Book', 550.00, 15, 5),
	(120, 'Database Management Book', 600.00, 12, 5);
SELECT * FROM PRODUCT;
UPDATE Product
SET Price = 60000,
    Stock = 10
WHERE ProductID = 104;  
 
UPDATE Product
SET Price = 600,
    Stock = 20
WHERE ProductID = 118;

UPDATE Product
SET Price = 1600,
    Stock = 30
WHERE ProductID = 107;

UPDATE Product
SET Price = 4000,
    Stock = 40
WHERE ProductID = 105;

UPDATE Product
SET Price = 500,
    Stock = 20
WHERE ProductID = 109;

DELETE FROM PRODUCT 
WHERE CATEGORYID = 3;

SELECT * FROM Product
ORDER BY CATEGORYID
  
    
       