use football;
SELECT ROW_NUMBER() OVER() AS row_num, name
FROM football.players;

-- rough syntax of how the code will look like
-- SELECT column_name1, 
-- window_function OVER(ORDER BY column_name2) AS column_name
-- FROM dataset;

-- Implementing Window Functions
SELECT ROW_NUMBER() OVER(ORDER BY last_season DESC) AS row_num,
name, last_season
FROM football.players;

-- statement is used in conjunction with window functions to divide the result set into partitions based on the values of one or more columns. 
-- SELECT column_name1, 
-- window_function OVER(PARTITION BY column_name ORDER BY coumn_name2) AS column_name
-- FROM dataset;

SELECT ROW_NUMBER() OVER(PARTITION BY last_season ORDER BY last_season DESC) AS row_num, name, last_season
FROM football.players;

-- Aggregate Functions and Window Functions
-- skeletal code
-- SELECT column_name1, 
-- aggregate_function OVER(ORDER BY column_name2) AS column_name
-- FROM dataset

SELECT COUNT(name) OVER(PARTITION BY last_season ORDER BY last_season DESC) AS total_sum,
name, last_season
FROM football.players;

-- Ranking Data
-- skeletal code
-- SELECT column_name1, 
-- RANK() OVER (ORDER BY coumn_name2) AS column_name
-- FROM dataset;

SELECT RANK() OVER(PARTITION BY last_season ORDER BY highest_market_value_in_eur DESC) AS ranked,
    name, 
    highest_market_value_in_eur
FROM football.players;

-- To prevent skipping, we can replace RANK() with DENSE_RANK()
SELECT DENSE_RANK() OVER(PARTITION BY last_season ORDER BY highest_market_value_in_eur DESC) AS ranked,
    name, 
    highest_market_value_in_eur
FROM football.players;

-- LEAD & LAG
-- rough syntax of how the code will look like
-- SELECT LAG(column_name, lag_number) OVER (ORDER BY column_name2) AS lag_name
-- FROM dataset;

SELECT name, LAG(name, 1) OVER( ORDER BY highest_market_value_in_eur) AS lag_name
FROM football.players;

SELECT name, LAG(name, 2) OVER( ORDER BY highest_market_value_in_eur) AS lag_name
FROM football.players;

SELECT name, LEAD(name, 1) OVER( ORDER BY highest_market_value_in_eur) AS lead_name
FROM football.players;

SELECT name, LEAD(name, 1) OVER( ORDER BY highest_market_value_in_eur DESC) AS lead_name
FROM football.players;

-- Bounded and Unbounded

SELECT name, highest_market_value_in_eur,
SUM(highest_market_value_in_eur) OVER (ORDER BY highest_market_value_in_eur DESC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS total_sum
FROM football.players;

SELECT name, highest_market_value_in_eur,
SUM(highest_market_value_in_eur) OVER (ORDER BY highest_market_value_in_eur DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS total_sum
FROM football.players;

SELECT name, highest_market_value_in_eur,
SUM(highest_market_value_in_eur) OVER (ORDER BY highest_market_value_in_eur DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS total_sum
FROM football.players;

SELECT name, height_in_cm,
SUM(height_in_cm) OVER (ORDER BY height_in_cm DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS total_sum
FROM football.players;

-- NTILES
SELECT name, highest_market_value_in_eur,
NTILE(4) OVER (ORDER BY highest_market_value_in_eur DESC) AS splits
FROM football.players;

SELECT name, highest_market_value_in_eur,
NTILE(4) OVER (ORDER BY highest_market_value_in_eur) AS splits
FROM football.players;

SELECT name, height_in_cm,
SUM(height_in_cm) OVER (ORDER BY height_in_cm DESC ROWS BETWEEN 3 PRECEDING AND CURRENT ROW) AS AdMub
FROM football.players;