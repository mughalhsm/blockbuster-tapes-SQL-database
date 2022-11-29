\c nc_flix

DROP TABLE IF EXISTS rentals;

CREATE TABLE rentals (
    rental_id SERIAL PRIMARY KEY,
    stock_id INT REFERENCES tapes(stock_id), 
    rental_start DATE, 
    rental_end DATE,
    customer_id INT REFERENCES customers(customer_id)
);



