# Write your MySQL query statement below
SELECT
contest_id, ROUND(COUNT(DISTINCT user_id) * 100 / (SELECT COUNT(user_id)
FROM Users), 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id; 

/*


To solve this problem, we need to calculate the percentage of users registered in each contest relative to the total number of users. This requires finding the distinct users for each contest and dividing by the total number of users in the Users table. The results must be ordered by percentage in descending order and, for ties, by contest_id in ascending order.

Approach
Count Users for Each Contest:

Use COUNT(DISTINCT r.user_id) to find the number of distinct users registered for each contest.
Calculate the Percentage:

Divide the number of registered users for a contest by the total number of users in the Users table using (SELECT COUNT(*) FROM Users) to get the total count. Multiply by 100 to get a percentage.
Use ROUND(..., 2) to format the percentage to two decimal places.
Group and Sort:

Use GROUP BY r.contest_id to calculate the percentage for each contest.
Use ORDER BY percentage DESC, r.contest_id ASC to order the results as required.

*/
