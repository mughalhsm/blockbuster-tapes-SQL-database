\c nc_flix


\echo '\n The number of films in stock for each genre:'

WITH genre_count AS (SELECT genre_id , COUNT(genre_id)
AS film_count
FROM tapes
JOIN movies_genres on tapes.movie_id = movies_genres.movie_id
GROUP BY genre_id)

SELECT genre_slug, film_count
FROM genres
JOIN genre_count
ON genre_count.genre_id = genres.genre_id;


\echo '\n Here is the average rating for films in stock in Newcastle:'

WITH newcastle_avergae_rating AS (SELECT * 
FROM movies 
WHERE title IN (SELECT title 
FROM tapes
JOIN movies ON movies.movie_id = tapes.movie_id
WHERE tapes.store_id = 3))
SELECT ROUND(AVG(coalesce(rating, 0)), 2)
FROM newcastle_avergae_rating;


\echo '\n Here are all the films made in 90s with above average rating available in Leeds'

SELECT * 
FROM movies 
WHERE movie_id IN (SELECT movie_id
FROM tapes
WHERE tapes.store_id = 1)
AND release_date >= '1990-01-01'
AND release_date < '2000-01-01'
AND rating > (SELECT AVG(COALESCE(rating, 0)) FROM movies);


\echo '\n Here is the number of copies of the top rated film of the 5 most recently released films we have in stock across all stores:'

WITH top_5_stock AS (SELECT * 
FROM tapes 
WHERE movie_id in (SELECT movie_id 
FROM movies 
WHERE movie_id IN (SELECT movie_id
FROM tapes)
AND rating > 0
ORDER BY rating DESC LIMIT 5))
SELECT COUNT(stock_id)
FROM top_5_stock;



\echo '\n These are the locations where our customers live which dont have stores:'

SELECT DISTINCT location
FROM customers
WHERE location NOT IN (SELECT city 
FROM stores);


\echo '\n This store has the highest quantity of stock:'

WITH store_stock AS (SELECT store_id, COUNT(store_id) AS store_count
FROM tapes
GROUP BY store_id)

SELECT store_count, city 
FROM stores
JOIN store_stock
ON stores.store_id = store_stock.store_id
ORDER BY store_count DESC LIMIT 1;

\echo '\n ...and this is the most abundant genre in that store:'

WITH abundant_genre AS (SELECT genre_id, COUNT(genre_id)
AS genre_count
FROM tapes
JOIN movies_genres 
ON movies_genres.movie_id = tapes.movie_id
WHERE store_id = 1
GROUP BY genre_id)

SELECT genre_slug
FROM abundant_genre
JOIN genres
ON genres.genre_id = abundant_genre.genre_id
ORDER BY genre_count DESC LIMIT 1;




