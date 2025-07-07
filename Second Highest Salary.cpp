# Write your MySQL query statement below
SELECT(
    SELECT DISTINCT SALARY
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

/*

To find the second highest salary, we don’t need to compare every pair. Instead, we can sort salaries in descending order and skip the top one.

- Use a subquery with ORDER BY salary DESC to sort all salaries.
- Apply DISTINCT to eliminate duplicates.
- Use LIMIT 1 OFFSET 1 to skip the top salary and fetch the second unique one.
- Wrap it all with a main SELECT to return a single value.

Complexity
Time Complexity:

( O(n \log n) ) — For sorting salaries.
Space Complexity:

( O(n) ) — For storing intermediate result set from subquery.

*/
