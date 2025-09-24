-- Simple & portable

use leetcode;
DROP TABLE IF EXISTS Activity;

CREATE TABLE Activity (
  player_id    INT,
  device_id    INT,
  event_date   DATE,
  games_played INT
);

INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
  (1, 2, '2016-03-01', 5),
  (1, 2, '2016-03-02', 6),
  (2, 3, '2017-06-25', 1),
  (3, 1, '2016-03-02', 0),
  (3, 4, '2018-07-03', 5);


-- Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. 
-- In other words, you need to determine the number of players who logged in on the day immediately following their initial login, and divide it by the number of total players.

WITH first_login AS (
  SELECT 
    player_id,
    MIN(event_date) AS first_date
  FROM Activity
  GROUP BY player_id
),
login_after_first AS (
  SELECT 
    f.player_id,
    MIN(a.event_date) AS next_date
  FROM first_login f
  JOIN Activity a
    ON f.player_id = a.player_id
   AND a.event_date > f.first_date
  GROUP BY f.player_id
)
SELECT 
  ROUND(
    COUNT(
      CASE 
        WHEN DATEDIFF(next_date, first_date) = 1 THEN 1 
      END
    ) / COUNT(DISTINCT f.player_id), 
    2
  ) AS fraction
FROM first_login f
LEFT JOIN login_after_first l 
  ON f.player_id = l.player_id;



