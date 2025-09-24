-- Simple & portable

use leetcode;
-- Drop and recreate table
DROP TABLE IF EXISTS Insurance;

CREATE TABLE IF NOT EXISTS Insurance (
  pid INT PRIMARY KEY,
  tiv_2015 FLOAT,
  tiv_2016 FLOAT,
  lat FLOAT,
  lon FLOAT
);

-- Reset table
TRUNCATE TABLE Insurance;

-- Insert sample data
INSERT INTO Insurance (pid, tiv_2015, tiv_2016, lat, lon) VALUES
  (1, 10,  5, 10, 10),
  (2, 20, 20, 20, 20),
  (3, 10, 30, 20, 20),
  (4, 10, 40, 40, 40);





-- Write a solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:
-- have the same tiv_2015 value as one or more other policyholders, and
-- are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique).
-- Round tiv_2016 to two decimal places.

SELECT 
    ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    -- tiv_2015 must appear more than once
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    -- location must be unique
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);

