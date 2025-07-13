# Write your MySQL query statement below
SELECT 
    a.visited_on,
    SUM(b.amount) AS amount,
    ROUND(SUM(b.amount) / 7, 2) AS average_amount
FROM(
    SELECT DISTINCT visited_on
    FROM Customer
) a
JOIN Customer b
    ON b.visited_on BETWEEN DATE_SUB(a.visited_on, INTERVAL 6 DAY) AND a.visited_on
GROUP BY a.visited_on
HAVING COUNT(DISTINCT b.visited_on) = 7
ORDER BY a.visited_on;


/*

To evaluate potential restaurant expansion, we need to understand the 7-day revenue trend.
A rolling or moving average helps smooth short-term fluctuations and highlight longer-term patterns.

Approach:

1) Aggregate by Day:
First, compute total revenue per visited_on date.

2) Join with Past 6 Days:
For each date, gather the revenue of the current and previous 6 days.

3) Compute Moving Average:
Calculate the average of the 7-day window.

4) Filter Starting from Day 7:
Only show results where at least 7 days of data are available.

🧮 Complexity:
Time Complexity:
O(n 
2
 ) in the worst-case due to the self-join per day, but manageable with indexes and limited dataset.

Space Complexity:
O(n) to store intermediate daily totals.
