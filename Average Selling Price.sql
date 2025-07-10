# Write your MySQL query statement below
SELECT p.product_id,IFNULL(ROUND(SUM(u.units * price) / SUM(u.units), 2), 0) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u
ON p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;

/*

Step 1: Joining Prices with UnitsSold (JOIN)
We join the Prices table with the UnitsSold table using product_id where the purchase_date falls within the start_date and end_date.
This ensures each unit sold is matched with the correct price.

Step 2: Calculating the Total Price and Units Sold
We compute the total selling price as SUM(units * price).
We compute the total number of units sold as SUM(units).

Step 3: Computing the Average Selling Price
We divide the total selling price by total units sold using AVG(price).
If a product has no sales, we return 0 using IFNULL.

Step 4: Rounding
The result is rounded to two decimal places using ROUND().

*/
