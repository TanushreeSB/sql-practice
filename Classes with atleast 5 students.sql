# Write your MySQL query statement below
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;

/*
To find all the classes that have at least five students, we need to count the number of students in each class. If the count is 5 or more, we include that class in our output.

Approach
Group by class - Since multiple students can belong to the same class, we use the GROUP BY clause to count students for each class.
Count students - We use the COUNT(student) function to get the number of students per class.
Filter classes with at least 5 students - We apply the HAVING clause to keep only those classes where the count is 5 or more.
Select only the class name - The final result should return only the class names that meet the condition.
*/
