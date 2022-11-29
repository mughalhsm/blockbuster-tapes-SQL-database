\c nc_flix

\echo '\n Here are all the movie titles which were released in the 21st century:'

SELECT *
FROM movies 
WHERE release_date > '2000-01-01';


\echo '\n This is our oldest customer:'

SELECT *
FROM customers
ORDER BY date_of_birth
LIMIT 1;

\echo '\n Customers beginning with D (youngest to oldest):'

SELECT *
FROM customers
WHERE customer_name LIKE 'D%'
ORDER BY date_of_birth DESC;



\echo '\n This is the average rating of the all the movies made in the 80s:'


SELECT ROUND(AVG(coalesce(rating, 0)), 2)
FROM movies
WHERE release_date > '1980-01-01'
and release_date < '1990-01-01';

\echo '\n This is the average rating of the all the movies made in the 80s without setting null values to 0:'

SELECT ROUND(AVG(rating), 2)
FROM 
movies;


\echo '\n After decreasing the price of the movie rentals, the movie table now looks like:'

-- Reset database everytime I run the following command. 
-- UPDATE movies
-- SET 
-- cost = ROUND((cost * 0.8), 2)
-- RETURNING *;
SELECT *
FROM movies;



