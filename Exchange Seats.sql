# Write your MySQL query statement below
SELECT
id,
CASE 
WHEN id % 2 = 0 THEN LAG(student) OVER(ORDER BY id)
ELSE COALESCE(LEAD(student) OVER(ORDER BY id), student)
END AS student
FROM Seat 

/*

Intuition & Description
Given that the task specifies dealing with odd and even IDs, we can efficiently separate these scenarios using a CASE WHEN clause.

For the records where the ID is even, swap the names with the preceding record. 
This can be achieved using the SQL window function LAG(student) OVER (ORDER BY id) to retrieve the name from the line above.

For records with an odd ID, swap the names with the subsequent record. Use the window function LEAD(student) OVER (ORDER BY id) to fetch the name from the line below.

It's important to note that for the last record with an odd ID, there will be no subsequent name to fetch.

In such cases, ensure the student's name remains unchanged by using the COALESCE function to default to the original value in the student column when the window function returns null.

*/


*************************************************************************************************************************************************************************************************************************

# Write your MySQL query statement below
SELECT 
    CASE
        WHEN id % 2 = 1 AND id + 1 IN (SELECT id FROM Seat) THEN id + 1
        WHEN id % 2 = 0 THEN id - 1
        ELSE id
    END AS id,
    student

FROM Seat
ORDER BY id;

/*

The problem requires swapping adjacent seat assignments while keeping the last student in place if there is an odd number of students. Since the id column increments continuously from 1, we can identify adjacent students using simple arithmetic conditions.

Approach
We check if the id is odd and if the next seat (id + 1) exists in the table.
If true, swap the id with id + 1.
If the id is even, swap it with id - 1.
If there is no adjacent seat (last row in case of an odd number of students), retain the original id.
The CASE statement handles these conditions efficiently.

*/
