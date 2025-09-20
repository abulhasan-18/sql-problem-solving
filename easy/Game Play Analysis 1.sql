-- Drop and create table
DROP TABLE IF EXISTS Activity;
CREATE TABLE Activity (
  player_id INT,
  device_id INT,
  event_date DATE,
  games_played INT
);

-- Reset table
TRUNCATE TABLE Activity;

-- Insert rows
INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-05-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);

-- Write a solution to find the first login date for each player.
-- Return the result table in any order.

select 
	a.player_id as player_id, 
	min(event_Date) as first_login
from activity a
group by a.player_id;


-- Write a solution to find the last login date for each player.
-- Return the result table in any order.

select 
	a.player_id as player_id, 
	max(event_Date) as first_login
from activity a
group by a.player_id;

-- Write a solution to find the most login date for each player.
-- Return the result table in any order.

with most_login as(
select 
	a.player_id as player_id, 
	count(event_Date) as many_login
from activity a
group by a.player_id
), ranked as (
select
	*,
	rank() over(order by many_login desc) as rank_login
from most_login
)
select 
	player_id,
	many_login
from ranked 
where rank_login = 1;