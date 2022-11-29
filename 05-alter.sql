\c nc_flix


\echo '\n The store with the highest total of sequels is:'


WITH sequels AS (SELECT store_id, COUNT(store_id)
sequel_count
FROM tapes
JOIN movies
ON tapes.movie_id = movies.movie_id
WHERE title 
LIKE '%Episode IV%'
OR title 
LIKE '%Episode IX%'
OR title
LIKE '%II%'
GROUP BY store_id)

SELECT *
FROM sequels
JOIN stores
ON stores.store_id = sequels.store_id
ORDER BY sequel_count DESC LIMIT 1;

\echo '\n Altering table to make sequels column:'

-- SELECT
-- movie_id, 
-- title, 
-- rating, 
-- CASE 
--     WHEN title LIKE '%Episode I%' OR title LIKE '%Back%' THEN 'Y'
--     ELSE 'N'
-- END sequel
-- FROM movies;

-- ALTER TABLE movies
-- ADD sequel VARCHAR(10);


UPDATE movies
SET sequel = 'N';


UPDATE movies
SET sequel = 'Y'
WHERE 
title 
LIKE '%II%'
OR 
title 
LIKE '%Episode I%';

UPDATE movies
SET sequel = 'N'
WHERE title = 'Episode I - The Phantom Menace';


SELECT *
FROM movies
ORDER BY movie_id;


WITH sequels AS SELECT *
FROM tapes
JOIN movies
ON tapes.movie_id = movies.movie_id;


WITH sequels AS (SELECT store_id, COUNT(store_id)
sequel_count
FROM tapes
JOIN movies
ON tapes.movie_id = movies.movie_id
WHERE sequel = 'Y'
GROUP BY store_id)

SELECT *
FROM sequels
JOIN stores
ON stores.store_id = sequels.store_id
ORDER BY sequel_count DESC LIMIT 1;






