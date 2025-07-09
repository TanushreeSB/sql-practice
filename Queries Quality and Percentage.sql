SELECT 
    query_name,
    ROUND(AVG(CAST(rating AS DECIMAL) / position), 2) AS quality,
    ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100 / COUNT(*), 2) AS poor_query_percentage
FROM Queries
GROUP BY query_name;

/*

We need to analyze query performance by computing:

Query Quality: The average rating / position, ensuring precision.
Poor Query Percentage: The percentage of queries with a rating below 3.
To achieve this, we leverage AVG, CAST, CASE, COUNT, and GROUP BY functions in MySQL.

🛠 Approach
Group by query_name to aggregate metrics per query.
Use CAST(rating AS DECIMAL) to avoid integer division.
Compute quality using AVG(rating / position) and round it to 2 decimal places.
Calculate poor_query_percentage:
Use CASE to count queries where rating < 3.
Compute the percentage of poor queries relative to the total count.
Use ROUND to format the result to 2 decimal places.

*/
