# Write your MySQL query statement below
DELETE P1 from Person p1
JOIN Person p2
ON p1.email = p2.email AND p1.id > p2.id;

/*
We use a self-join on the Person table to identify rows with the same email but higher IDs. Then, we delete those rows, keeping only the row with the smallest ID for each unique email.
*/
