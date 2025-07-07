SELECT d.name AS Department, 
       e.name AS Employee, 
       e.salary AS Salary
FROM Employee e
JOIN Department d ON e.departmentId = d.id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM Employee
    WHERE departmentId = e.departmentId
);

/*
Each department may have many employees, but only the one(s) with the highest salary should be selected. 
The key is filtering based on the maximum salary within each department.


Join the Employee and Department tables using departmentId.
For each employee, use a correlated subquery to check if their salary matches the max in their department.
Filter only those who match.

Complexity

Time Complexity:

(O(n^2)) — for each employee, a subquery scans their department.
Space Complexity:

(O(n)) — temporary space used by the database engine.
