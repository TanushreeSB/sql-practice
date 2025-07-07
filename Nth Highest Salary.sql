CREATE FUN.CTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N - 1;
      # Write your MySQL query statement below.
    RETURN(
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET N
    );
END

/*

To retrieve the Nth highest salary, we need to sort the distinct salaries in descending order.
Then we use SQL's LIMIT with OFFSET to skip the first (N-1) values and fetch the Nth one.

- Subtract 1 from N since SQL OFFSET is zero-based.
- Use SELECT DISTINCT salary to remove duplicates.
- Order salaries in descending order.
- Apply LIMIT 1 OFFSET N-1 to fetch the Nth unique highest salary

*/
