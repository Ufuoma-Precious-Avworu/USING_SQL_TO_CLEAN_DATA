-- Temporal cleaning (why you can't use select to clean)
SELECT Customer_Name, TRIM(Customer_Name)
FROM `dirty data 2`;
 
 -- Retrieving by attributes
SELECT Customer_Name
FROM `dirty data 2`;

SELECT *
FROM `dirty data 2`;

-- permanent cleaning

UPDATE `dirty data 2`
SET Customer_Name =TRIM(Customer_Name);

-- FINDING OUTLIERS USING AGGREGATE FUNCTIONS
SELECT MIN(Price_per_Unit)
FROM`dirty data 2`;

SELECT MAX(Quantity)
FROM`dirty data 2`;

-- Replace Outliers
UPDATE `dirty data 2`
SET Quantity =9
WHERE Quantity >10;

UPDATE `dirty data 2`
SET Quantity = 1
WHERE Quantity <1;

UPDATE `dirty data 2`
SET Price_per_Unit = (SELECT AVG(Price_per_Unit)
WHERE Price_per_Unit <500)
WHERE Price_per_Unit >500;

UPDATE `dirty data 2`
SET Price_per_Unit = (SELECT AVG(Price_per_Unit)
WHERE Price_per_Unit <500)
WHERE Price_per_Unit = 0;

-- REMOVING NULLS AND BLANKS
UPDATE `dirty data 2`
SET Carrier = "USPS"
WHERE Carrier = "" OR Carrier IS NULL;

DELETE FROM `dirty data 2` 
WHERE Order_ID IS NULL OR Order_ID ="";

-- WE CONNOT USE AGGREGATE SO WE USE SUB QUERY

UPDATE `dirty data 2`
SET Price_per_Unit = (SELECT AVG(Price_per_Unit)
WHERE Price_per_Unit <500)
WHERE Price_per_Unit IS NULL;

SELECT *
FROM `dirty data 2`;

UPDATE `dirty data 2`
SET Carrier = REPLACE("GLOBE","GLOBE","Globe");

-- STANDARDIZING NUMERICAL DATA

SELECT ROUND(AVG(Price_per_Unit), 2)
FROM `dirty data 2`;

-- FILLING ZERO's OR NULLS IN Price_per_Unit

UPDATE `dirty data 2`
SET Price_per_Unit = 253.86
WHERE Price_per_Unit = "" OR Price_per_Unit IS NULL;

UPDATE `dirty data 2`
SET Destination_City =LOWER(Destination_City);

UPDATE `dirty data 2`
SET Carrier = UPPER(Carrier);

-- CHANGING DATA TYPE {DDL COMMAND}
ALTER TABLE `dirty data 2`
MODIFY COLUMN Order_ID VARCHAR(70);

-- CHANGING DATE FORMAT
UPDATE `dirty data 2`
SET Order_Date = STR_TO_DATE(Order_Date, '%Y-%m-%d')
WHERE Order_Date LIKE '%-%-%';

SELECT* FROM `dirty data 2`;

-- REMOVING DUPLICATES 
-- METHOD 1
CREATE TABLE `CLEANED DATA` AS
SELECT DISTINCT * FROM `dirty data 2`;

-- METHOD 2
-- CTE (COMMON TABBE EXPRESSION) TEMPORAL TABLE FOR THE PURPOSE OF A PARTICULAR QUERY TO BE EXECUTED

 -- THE QUERY TO RETRIEVE AND SEE THE DUPLICATES
 
WITH DUPLICATES AS(
SELECT Order_ID, ROW_NUMBER() OVER(PARTITION BY Order_ID, Product ORDER BY Order_ID) AS ROW_NUM
FROM `dirty data 2`)
SELECT *
FROM DUPLICATES
WHERE ROW_NUM >=1;

-- THE QUERT TO DELETE DUPLICATES

WITH DUPLICATES AS (
SELECT Order_ID, ROW_NUMBER() OVER(PARTITION BY Customer_Name, Product ORDER BY Order_ID) AS ROW_NUM
FROM `dirty data 2`)
DELETE FROM `dirty data 2`
WHERE Order_ID IN(
SELECT Order_ID FROM DUPLICATES
WHERE ROW_NUM >1);

-- METHOD 3
DELETE FROM `dirty data 2`
WHERE
Order_ID IN (SELECT
Customer_Name, Product, MAX(Order_ID)
FROM`dirty data 2`
GROUP BY Customer_Name, Product
HAVING COUNT(*) > 1);

-- USING THE LIKE FUNCTION
-- ends with A
SELECT *
FROM `dirty data 2`
WHERE Customer_Name LIKE '%A';
-- starts with A
SELECT *
FROM `dirty data 2`
WHERE Customer_Name LIKE 'A%';
-- has A in it
SELECT *
FROM `dirty data 2`
WHERE Customer_Name LIKE "%A%";
 

 







