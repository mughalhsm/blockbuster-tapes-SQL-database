\c nc_flix

DROP TABLE IF EXISTS tapes;

CREATE TABLE tapes (
    stock_id SERIAL PRIMARY KEY,
    store_id INT REFERENCES stores(store_id),
    movie_id INT REFERENCES movies(movie_id)
);

INSERT INTO tapes 
(store_id, movie_id)
VALUES
(1, 22), 
(1, 22), 
(1, 21), 
(1, 7), 
(1, 7), 
(1, 7),
(1, 15), 
(1, 15), 
(1, 16), 
(1, 16),
(2, 22), 
(2, 17), 
(2, 17), 
(2, 18), 
(2, 18), 
(2, 10), 
(3, 12), 
(3, 21),
(3, 21),
(3, 5), 
(4, 14), 
(4, 15), 
(4, 16), 
(4, 22), 
(4, 2), 
(4, 2);

SELECT * 
FROM tapes;


-- The Manchester store has 1 copy of Toy Story, 2 copies of each of the Back To The Future films and a copy of Taxi Driver
-- The Newcastle store has 1 copy of Girl, Interrupted, 2 copies of Pulp Fiction and 1 copy of the Care Bears movie
-- The Birmingham store has 1 copy of each of the Star Wars films (I, IV and IX), 1 copy of Toy Story and 2 copies of the Breakfast Club
