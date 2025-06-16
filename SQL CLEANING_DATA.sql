SELECT *
FROM synthetic_online_retail_data;

-- RETRIEVING NULLS AND BLANKS
SELECT * FROM `synthetic_online_retail_data`
WHERE review_score IS NULL OR review_score = "";

SELECT  * FROM `synthetic_online_retail_data`
WHERE review_score IS NULL AND review_score ="" ;

-- RETREIVING USING "LIKE OR" AND "LIKE AND"
SELECT *
FROM synthetic_online_retail_data
WHERE payment_method LIKE '%F' OR '%S';

SELECT *
FROM synthetic_online_retail_data
WHERE city LIKE '%F' AND '%S';

SELECT *
FROM synthetic_online_retail_data
WHERE category_name LIKE 'F%' OR 'S%';

SELECT *
FROM synthetic_online_retail_data
WHERE product_name LIKE 'F%' AND 'S%';

-- RETRIEVING USING NOT
SELECT * FROM `synthetic_online_retail_data`
WHERE review_score !="";

SELECT * FROM `synthetic_online_retail_data`
WHERE NOT product_name = "Smartphone";

-- Retrieving attributes only
SELECT review_score
FROM synthetic_online_retail_data;

-- order by and limit
SELECT product_name, quantity
FROM synthetic_online_retail_data
WHERE quantity >=2 
ORDER BY quantity DESC;

SELECT review_score, quantity
FROM synthetic_online_retail_data
ORDER BY quantity DESC;

-- Filling blanks with AVG
SELECT ROUND(AVG(review_score), 0)
FROM `synthetic_online_retail_data`;

UPDATE synthetic_online_retail_data
SET review_score =3
WHERE review_score = "" OR review_score IS NULL;

UPDATE synthetic_online_retail_data
SET review_score = (SELECT AVG(review_score))
 WHERE review_score = "" OR review_score IS NULL;
 
 -- LIMIT
 SELECT product_name, quantity, price
 FROM synthetic_online_retail_data
 ORDER BY price DESC
 LIMIT 5;
 
 -- Aggregate functions
SELECT COUNT(product_id)
FROM synthetic_online_retail_data;

SELECT ROUND(SUM(price), 4)
FROM synthetic_online_retail_data;

SELECT ROUND(AVG(price), 4)
FROM synthetic_online_retail_data;

SELECT MAX(quantity)
FROM synthetic_online_retail_data;

SELECT MIN(quantity)
FROM synthetic_online_retail_data;

-- AGGREGATE FUNCTIONS WITH CONDITIONS
SELECT SUM(price)
FROM synthetic_online_retail_data
WHERE quantity IN (4,1);

-- GROUP AND HAVING 
-- Retrieve the top 5 sales price and product_name for the payment_method Credit card and Cash on delivery

SELECT product_name, SUM(price) AS TOTAL_SALES
FROM synthetic_online_retail_data
GROUP BY product_name, payment_method
HAVING payment_method IN ("Credit card", "Cash on delivery")
ORDER BY TOTAL_SALES DESC
LIMIT 5;

-- RETRIEVING PRODUCT WITH HIGHEST SALES
SELECT product_name, SUM(price) AS TOTAL_SALES
FROM synthetic_online_retail_data
GROUP BY product_name
ORDER BY TOTAL_SALES DESC;


