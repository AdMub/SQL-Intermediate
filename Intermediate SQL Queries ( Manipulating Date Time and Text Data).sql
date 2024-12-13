SELECT * FROM instagram.insta_data;

-- Finding Elapsed Date and Time
-- skeletal code for DATEDIFF
-- SELECT DATEDIFF(end_date, start_date) AS days_difference 
-- FROM your_table;

SELECT date_posted, DATEDIFF(NOW(), date_posted) AS days_difference 
FROM instagram.insta_data;

-- the skeletal code will look like if you’re interested in finding the difference in terms of years
-- SELECT TIMESTAMPDIFF(YEAR, start_date, end_date) AS years_difference 
-- FROM your_table;

-- finding the difference in terms of months instead
SELECT TIMESTAMPDIFF(MONTH, start_date, end_date) AS month_difference 
FROM your_table;

SELECT TIMESTAMPDIFF(MONTH, date_posted, NOW()) AS month_difference 
FROM instagram.insta_data;

-- Arithmetic Operations on Date Time Data
-- Adding days, months, years or even seconds to the current datetime data
-- SELECT DATE_ADD(datetime_column, INTERVAL value unit) AS new_datetime,
-- DATE_SUB(datetime_column, INTERVAL value unit) AS new_datetime
-- FROM your_table;

	SELECT 
	  DATE_SUB(date_posted, INTERVAL 7 MONTH) AS past,
	  date_posted,
	  DATE_ADD(date_posted, INTERVAL 4 DAY) AS future
	FROM 
	  instagram.insta_data;

-- Calculating Time Difference
SELECT 
  date_posted,
  TIMESTAMPDIFF(HOUR, date_posted, NOW()) AS hours_difference,
  TIMESTAMPDIFF(MINUTE, date_posted, NOW()) AS minutes_difference
FROM 
  instagram.insta_data;
  
  -- Extracting Date and Time
 -- SELECT DATE(date_column) AS extracted_date 
-- FROM your_table;

-- Suppose we now want to extract more detailed information from the datetime data, for instance the year, month, day, or even seconds from the data
SELECT 
  EXTRACT(YEAR FROM date_posted) AS year,
  EXTRACT(MONTH FROM date_posted) AS month,
  EXTRACT(DAY FROM date_posted) AS day,
  EXTRACT(HOUR FROM date_posted) AS hour,
  EXTRACT(MINUTE FROM date_posted) AS minute,
  EXTRACT(SECOND FROM date_posted) AS second
FROM 
  instagram.insta_data;
  
  SELECT 
  YEAR(date_posted) AS year,
  MONTH(date_posted) AS month,
  DAY(date_posted) AS day,
  HOUR(date_posted) AS hour,
  MINUTE(date_posted) AS minute,
  SECOND(date_posted) AS second
FROM 
  instagram.insta_data;
  
  -- Using Window Functions with Date Time Data
  SELECT 
  date_posted,
  number_of_likes,
  AVG(number_of_likes) OVER (
    ORDER BY date_posted 
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS seven_day_avg_likes
FROM 
  instagram.insta_data;
  
  -- String Functions
SELECT CONCAT(first_name, "'s Instagram handle is ", handle) AS message 
FROM instagram.insta_data;

-- transforming text into uppercase or lowercase
SELECT 
	first_name,
	UPPER(first_name)
FROM
	instagram.insta_data;
    
    SELECT 
	first_name,
	LOWER(first_name)
FROM
	instagram.insta_data;
    
    -- Trimming and Replacing
    SELECT 
	first_name,
	LENGTH(first_name)
FROM
	instagram.insta_data;
   
   -- The code for trimming data
    -- SELECT TRIM(special_characters FROM column_name) AS trimmed 
-- FROM your_table;

-- Replace
SELECT
	type_of_post AS original,
	REPLACE(type_of_post, 'Video', 'Videooo') AS modified 
FROM 
	instagram.insta_data;

SELECT
    date_posted,
    CONCAT(first_name, ' ', last_name) AS AdMub,
    EXTRACT(YEAR FROM date_posted) AS year_posted,
    number_of_likes
FROM
    instagram.insta_data
WHERE
    number_of_likes > 500
ORDER BY
    number_of_likes DESC;