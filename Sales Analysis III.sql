# Write your MySQL query statement below
SELECT DISTINCT p.product_id, p.product_name
FROM Product p
JOIN Sales s ON p.product_id = s.product_id
WHERE s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
  AND p.product_id NOT IN (
    SELECT product_id
    FROM Sales
    WHERE sale_date < '2019-01-01' OR sale_date > '2019-03-31'
);

/*

We need to identify products that were sold only in the first quarter of 2019 (i.e., from January 1 to March 31). 
If a product was sold even once outside this date range, it should be excluded.

Approach
Join the Product and Sales tables using product_id to get all sale information along with product names.
Filter for sales that occurred between '2019-01-01' and '2019-03-31'.
Exclude products that were sold outside this date range using a subquery with NOT IN.
Use DISTINCT to avoid duplicate product entries in the result.

*/
