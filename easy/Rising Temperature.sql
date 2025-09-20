-- Drop and create table
DROP TABLE IF EXISTS Weather;
CREATE TABLE Weather (
  id INT,
  recordDate DATE,
  temperature INT
);

-- Reset table
TRUNCATE TABLE Weather;

-- Insert rows
INSERT INTO Weather (id, recordDate, temperature) VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30),
(5, '2015-01-06', 35);


-- Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).
-- Works in mysql not in postgress

with data_Cte as (
select *,
lag(temperature) over( order by  recordDate ) as previous_temp,
lag(recordDate) over (order by  recordDate ) as previous_date
from Weather
)
select id 
from data_Cte
where temperature > previous_temp and datediff(recordDate,previous_date) = 1 ;

 
