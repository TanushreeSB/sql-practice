# Write your MySQL query statement below
SELECT 
    s.user_id, 
    ROUND(AVG(IF(c.action = 'confirmed', 1, 0)), 2) AS confirmation_rate
FROM 
    Signups AS s 
LEFT JOIN 
    Confirmations AS c 
ON 
    s.user_id = c.user_id
GROUP BY 
    s.user_id;


/*

We need to calculate the average confirmation rate for each user based on whether their action was "confirmed".

- Approach
Use a LEFT JOIN to include all users from Signups, even those without confirmations.

Use IF(action = 'confirmed', 1, 0) to treat confirmed actions as 1 and others as 0.

Calculate the average using AVG(...) and round it to 2 decimal places.

Group by user_id to compute each user’s confirmation rate.

- Complexity:
Time complexity: O(n) — where n is the total number of records in the Confirmations table.

Space complexity:  O(1) — we are using constant extra space.

*/
