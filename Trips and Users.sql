# Write your MySQL query statement below
SELECT t.request_at as Day,ROUND(SUM(IF(t.status!="completed",1,0))/count('*'),2) AS "Cancellation Rate"
FROM Trips as t
LEFT JOIN Users AS u1 ON t.client_id=u1.users_id 
LEFT JOIN Users AS u2 ON t.driver_id=u2.users_id 
WHERE t.request_at BETWEEN "2013-10-01" AND "2013-10-03" AND u1.banned='NO' AND u2.banned='NO'
group by t.request_at

/*

imple join based on problem statements

Approach
1.fist join to get user info and second join to get the driver info
2. fillter based on date and banned condition
3. group by based day

*/
