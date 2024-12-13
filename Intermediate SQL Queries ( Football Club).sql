-- select *
-- from club;
-- from players;
-- from player_valuations;

-- Filtering for Data with Multiple Conditions
SELECT * 
FROM football.players 
INNER JOIN football.club 
ON football.players.current_club_id = football.club.club_id 
WHERE football.club.name = "Manchester United" AND height_in_cm > 170 AND position = "Midfield";

SELECT * 
FROM football.players 
INNER JOIN football.club ON football.players.current_club_id = football.club.club_id WHERE football.club.name = "Manchester United" OR 
football.players.country_of_citizenship = "England";

SELECT * 
FROM football.players 
INNER JOIN football.club ON football.players.current_club_id = football.club.club_id 
WHERE football.club.name != "Manchester United";

SELECT *
FROM football.players
INNER JOIN football.club
ON football.players.current_club_id = football.club.club_id
WHERE football.club.name IN ("Manchester United", "Chelsea FC", "Liverpool");

SELECT *
FROM football.players
INNER JOIN football.club
ON football.players.current_club_id = football.club.club_id
WHERE football.club.name NOT IN ("Manchester United", "Chelsea FC", "Liverpool");

-- Filtering for Data Between a Range of Values
--- SELECT *
-- FROM ___
-- WHERE ___ BETWEEN __ AND __;

SELECT name, squad_size
FROM football.club
WHERE squad_size BETWEEN 25 AND 27;

SELECT name, squad_size
FROM football.club
WHERE squad_size > 24 AND squad_size < 28;

-- Regular Expressions and String Pattern Detection
SELECT *
FROM football.club
WHERE football.club.name LIKE "man%";

SELECT *
FROM football.club
WHERE football.club.name LIKE "%united";

SELECT *
FROM football.club
WHERE football.club.name LIKE "%chester%";

-- Setting Conditions with Cases

SELECT *
CASE
WHEN condition1 THEN output1
WHEN condition2 THEN output2
WHEN condition3 THEN output3
ELSE output4
END AS colum_name
FROM dataset;

-- filter for player heights whose range falls into four different categories of Giant, Tall, Medium, or Short. Finally, we name the column “height”
SELECT football.players.name, football.players.height_in_cm,
CASE
WHEN football.players.height_in_cm >= 190 THEN "Giant"
WHEN football.players.height_in_cm >= 183 THEN "Tall"
WHEN football.players.height_in_cm <= 173 THEN "Short"
ELSE "Medium"
END AS height
FROM football.players;

-- Introducing Subqueries
-- Single Row Subqueries
-- compare the average market valuations of the different football players and compare it with the valuations of each football player.
SELECT player_id, football.player_valuations.market_value_in_eur,
(SELECT AVG(football.player_valuations.market_value_in_eur) FROM football.player_valuations)
from football.player_valuations;

-- Multiple Row Subqueries
SELECT football.players.name
FROM football.players
WHERE player_id IN
(select player_id
from football.player_valuations
WHERE football.player_valuations.market_value_in_eur > 100000);

-- Common Table Expressions (CTE)
WITH cte_name (column1, column2, ...) AS (

– insert query here

)[

WITH valuations AS (
SELECT *
FROM football.player_valuations
WHERE football.player_valuations.market_value_in_eur >= 10000
)
SELECT *
FROM valuations;

with squad_numbers AS (
SELECT *
FROM football.club
where football.club. squad_size > 33
)
select *
from squad_numbers;

with squad_numbers AS (
select *
from football.club
where football.club.squad_size > 33 and name like "%FC"
)
select * 
from squad_numbers;

with squad_numbers as (
select *
from football.club
where football.club.name like "%FC" and squad_size > 33
)
select *
from squad_numbers;




