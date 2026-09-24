USE ECOMMERCE;


-- =========================================
-- CREATE PAYMENT TABLE
-- =========================================

CREATE TABLE PAYMENT
(
    PAYMENTID INT PRIMARY KEY,
    ORDER_ID INT,
    PAYMENTMODE VARCHAR(20),
    PAYMENTDATE DATE,
    PAYMENTAMOUNT DECIMAL(10,2),
    PAYMENTSTATUS VARCHAR(20),

    FOREIGN KEY (ORDER_ID)
    REFERENCES ORDERTABLE(ORDER_ID)
);


-- =========================================
-- 1. INSERT VALUES
-- =========================================

INSERT INTO PAYMENT VALUES
(601, 1001, 'UPI',  '2026-09-15', 33000.00, 'SUCCESSFUL'),
(602, 1002, 'CARD', '2026-09-15', 120000.00, 'SUCCESSFUL'),
(603, 1003, 'UPI',  '2026-09-16', 9600.00,  'FAILED'),
(604, 1004, 'CARD', '2026-09-16', 1000.00,  'SUCCESSFUL'),
(605, 1005, 'UPI',  '2026-09-17', 2899.00,  'SUCCESSFUL'),
(606, 1006, 'CASH', '2026-09-17', 600.00,    'SUCCESSFUL'),
(607, 1007, 'CARD', '2026-09-18', 7000.00,   'FAILED'),
(608, 1008, 'UPI',  '2026-09-18', 60000.00,  'SUCCESSFUL'),
(609, 1009, 'CASH', '2026-09-19', 1098.00,   'SUCCESSFUL'),
(610, 1010, 'CARD', '2026-09-19', 10999.00,  'SUCCESSFUL');

SELECT * FROM PAYMENT;


-- =========================================
-- 2. UPDATE & CHANGE PAYMENT STATUS
-- =========================================

UPDATE PAYMENT
SET PAYMENTSTATUS = 'SUCCESSFUL'
WHERE PAYMENTID = 603;

UPDATE PAYMENT
SET PAYMENTSTATUS = 'SUCCESSFUL'
WHERE PAYMENTID = 607;


SELECT * FROM PAYMENT
WHERE PAYMENTID IN (603, 607);


-- =========================================
-- 3. DISPLAY SUCCESSFUL PAYMENT
-- =========================================

SELECT * FROM PAYMENT
WHERE PAYMENTSTATUS = 'SUCCESSFUL';


-- =========================================
-- 4. DISPLAY FAILED TRANSACTION
-- =========================================

SELECT * FROM PAYMENT
WHERE PAYMENTSTATUS = 'FAILED';


-- =========================================
-- 5. DISPLAY PAYMENT BASED ON PAYMENT MODE
-- =========================================

-- UPI PAYMENT

SELECT * FROM PAYMENT
WHERE PAYMENTMODE = 'UPI';


-- CARD PAYMENT

SELECT * FROM PAYMENT
WHERE PAYMENTMODE = 'CARD';


-- CASH PAYMENT

SELECT * FROM PAYMENT
WHERE PAYMENTMODE = 'CASH';


-- =========================================
-- 6. NUMBER OF TRANSACTIONS IN EACH MODE
-- =========================================

SELECT PAYMENTMODE,
       COUNT(*) AS NUMBEROFTRANSACTIONS
FROM PAYMENT
GROUP BY PAYMENTMODE;


-- =========================================
-- 7. TOTAL AMOUNT RECEIVED IN EACH MODE
-- =========================================

SELECT PAYMENTMODE,
       SUM(PAYMENTAMOUNT) AS TOTALAMOUNTRECEIVED
FROM PAYMENT
WHERE PAYMENTSTATUS = 'SUCCESSFUL'
GROUP BY PAYMENTMODE;