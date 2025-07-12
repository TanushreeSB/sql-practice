# Write your MySQL query statement below
SELECT teacher_id, COUNT(DISTINCT(subject_id)) AS cnt
FROM Teacher
GROUP BY teacher_id

/*

We need to count the number of unique subjects each teacher teaches. Given a Teacher table, where each row represents a teacher along with a subject they teach, we must count the distinct subject_id values for each teacher_id.

- Approach
Group by teacher_id

This ensures we process each teacher's records separately.
Count distinct subject_id values

Use COUNT(DISTINCT subject_id) to ensure we count only unique subjects per teacher.
Select required columns

Retrieve teacher_id and the calculated count (cnt).

- Complexity Analysis
Grouping (GROUP BY teacher_id)

Since we're grouping by teacher_id, this operation runs in O(N log M), where M is the number of unique teachers.
Counting distinct subjects (COUNT(DISTINCT subject_id))

This operation requires scanning the subject_id column for each teacher, which is approximately O(N log K), where K is the number of unique subjects per teacher.

Overall Complexity:
The dominant factor is grouping and distinct counting, leading to an approximate O(N log M + N log K) ≈ O(N log N) complexity in the worst case.

*/

