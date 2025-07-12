# Write your MySQL query statement below
SELECT employee_id,
    IF(employee_id % 2 != 0 AND LEFT(name, 1) <> 'M', salary, 0) AS bonus
FROM Employees
ORDER BY employee_id;\

/*

In the MySQL query, we use the IF function to calculate the bonus based on the conditions specified.
If the employee_id is an odd number and the first character of the name is not 'M', then the bonus is set to the salary, otherwise, it is set to 0. 
We then select the employee_id and the calculated bonus and order the result table by employee_id in ascending order.

*/
