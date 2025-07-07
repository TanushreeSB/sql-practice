SELECT w1.id 
FROM Weather w1
JOIN Weather w2 
ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;

/*
To find days with higher temperatures than the previous day, compare each record to the one just before it. This is a classic case of self-joining on dates.
Use a JOIN to compare each row (w1) to the day before (w2) using DATEDIFF = 1.
Filter the result where w1.temperature > w2.temperature to identify increasing temperature days.
*/
