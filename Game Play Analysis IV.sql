WITH FirstLogin AS (
    SELECT
        player_id,
        MIN(event_date) AS first_login
    FROM Activity
    GROUP BY player_id
),
ConsecutiveLogin AS (
    SELECT
        a.player_id
    FROM Activity a
    JOIN FirstLogin fl
    ON a.player_id = fl.player_id
    AND a.event_date = DATE_ADD(fl.first_login, INTERVAL 1 DAY)
)
SELECT
    ROUND(
        COUNT(DISTINCT cl.player_id) * 1.0 / COUNT(DISTINCT fl.player_id),
        2
    ) AS fraction
FROM FirstLogin fl
LEFT JOIN ConsecutiveLogin cl
ON fl.player_id = cl.player_id;

/*

We want to find how many players logged in again the day after their first login.
To solve this, we use SQL's WITH clause (CTE) to break the problem into small, readable parts.

FirstLogin CTE: find the first login date per player.
ConsecutiveLogin CTE: check if the same player logged in the next day.
Count how many players did log in next day vs total unique first logins.
Use ROUND() to format the final fraction.
*/
