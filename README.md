# NC-flix

Video streaming services are all well and good, but they lack a certain physical quality. Not to miss out on a questionable business venture, Northcoders is bringing back the **video rental store**!

Business is somewhat slow at the moment (surprisingly!) so we've been tasked to start thinking about how we store our data. At the moment we have the following three tables:

-   stores

-   customers

-   movies

## Task 1

1. Query the database to retrieve all of the movie titles that were released in the 21st century.

2. Query the database to find the oldest customer.

3. Query the database to find the customers who's name begin with the letter _D_. Organise the results by age, youngest to oldest.

4. Query the database to find the average rating of the movies released in the 1980s. **If there are any `null` ratings you should treat them as a 0 rating**

5. The rise in living costs is affecting rentals, drop the cost of all rentals by 5% and display the updated table. **As this is a monetary value make sure it is rounded to 2 decimal places**

> _**If you want to run the updates multiple times without going bankrupt, the data will need to be reset. We've added a bash script that will run all of the *.sql files in the ./db folder. Try running the command `./run-all.sh` from your terminal in the root of this repository. This will save the output of each *.sql file in the ./db directory to a \*.txt file of the same name.**_

## Task 2

We need a way to keep track of stock across our stores. Each individual VHS tape (very retro, we know), should have it's own `stock_id` so that we know which copy is being rented. Also if a copy gets damaged/lost this means we'll know which one it is. Stores can (and should) stock multiple copies of the same film.

1. Create a `stock` table with the following columns:

-   `stock_id` - PK
-   `store_id` - FK
-   `movie_id` - FK

2. Insert some data into this table. You'll want at least 15 rows (but the more the better) and some stores should have multiple copies. Here's some information to get you started:

-   The Leeds store has 2 copies of Toy Story, a copy of Pulp Fiction, 3 copies of Highlander and 2 copies of Star Wars episodes IV and IX.
-   The Manchester store has 1 copy of Toy Story, 2 copies of each of the Back To The Future films and a copy of Taxi Driver
-   The Newcastle store has 1 copy of Girl, Interrupted, 2 copies of Pulp Fiction and 1 copy of the Care Bears movie
-   The Birmingham store has 1 copy of each of the Star Wars films (I, IV and IX), 1 copy of Toy Story and 2 copies of the Breakfast Club

## Task 3

1. Create a `genres` table with the following data:

| genre_slug | description                                                    |
| ---------- | -------------------------------------------------------------- |
| family     | Fun for everyone!                                              |
| comedy     | A giggle a minute                                              |
| romance    | I feel it in my fingers, I feel it in my toes                  |
| fantasy    | There be elves and and witches                                 |
| action     | Shooty shooty punchy punchy                                    |
| drama      | Plot driven story time                                         |
| crime      | Watch out, there's gangsters about                             |
| sci_fi     | Your scientists were so preoccupied with whether they could... |

2. Movies can often be associated with more than one genre. Create this many-many relationship between the `genres` table and the `movies`.

3. Insert some data about the film genres. Feel free to use the information in the table below:

| Film                               | Genres               |
| ---------------------------------- | -------------------- |
| Ghostbusters II                    | Family, Comedy       |
| The Breakfast Club                 | Comedy, Drama        |
| Todo Sobre Mi Madre                | Comedy, Drama        |
| The Lion King II: Simba''s Pride   | Family               |
| The Care Bears Movie               | Family               |
| Tron                               | Fantasy, Action      |
| Highlander                         | Fantasy, Action      |
| Cleopatra                          | Romance, Drama       |
| Catch Me If You Can                | Comedy, Drama, Crime |
| Taxi Driver                        | Drama, Crime         |
| The Princess Switch                | Comedy, Romance      |
| Girl, Interrupted                  | Drama                |
| The Fellowship of the Ring         | Fantasy, Action      |
| Episode I - The Phantom Menace     | Action, Sci-Fi       |
| Episode IV - A New Hope            | Action, Sci-Fi       |
| Episode IX - The Rise of Skywalker | Action, Sci-Fi       |
| Back to the Future                 | Comedy, Sci-Fi       |
| Back to the Future Part II         | Comedy, Sci-Fi       |
| The Godfather                      | Drama, Crime         |
| Raiders of the Lost Ark            | Action, Fantasy      |
| Pulp Fiction                       | Crime                |
| Toy Story                          | Family               |
| Groundhog Day                      | Comedy, Romance      |
| A Fish Called Wanda                | Comedy, Crime        |
| Independance Day                   | Action, Sci-Fi       |

## Task 4

**If there are any `null` ratings you should treat them as a 0 rating!**

1. Query the database to find the number of films in stock for each genre.

2. Query the database to find the average rating for films in stock in Newcastle.

3. Query the database to retrieve all the films released in the 90s which have a rating greater than the total average.

4. Query the database to find the amount of films in stock, across **all** stores, of the top rated film of the five most recently released films.

5. Query the database to find a list of all the locations customers live in which **don't** contain a store.

6. Query the database to find a list of all the locations we have influence over (locations of stores and/or customers), **there should be no repeated data**.

7. Of the stores which exist in locations that have customers, calculate which store has the largest catalogue of stock. What is the most abundant genre in that store?

## Task 5

1. Query the database to find the store with store with the highest total copies of sequels.

    > _Note: For now let's assume you can tell if a film is a sequel if the title contains something like 'II' or 'VI'._

2. This is likely not a good way to identify sequels going forward. Alter the movies table to track this information better and then update previous query to make use of this new structure.

## Task 6

1. Design a way of storing information on rentals. A rental should track the following information:

    - rental_id
    - stock_id
    - rental_start
    - rental_end
    - customer_id

    Add some rental rows we can query later.

2. Create a single output with the following information:

-   store_id, location, number of customers in the same location
-   number of films available in store
-   most valued customer (customer with the most rentals)
-   most popular film (film with most rentals)
-   average rating of each store (calculated as average of all films in store) rounded to **1 decimal place**

_hint: it might be helpful to build up the query bullet point by bullet point_

**If there are any `null` ratings you should treat them as a 0 rating!**

3. Jersey is having a movie night and wishes to rend a film! However they are limited by number of factors:

-   The film must be age appropriate (classification of U)
-   The film must be available in Leicester.
-   The film must not have been rented more than 5 times already

Instead of creating a list of only the films that match this criteria, create an output which marks `yes` or `no` in a column that represents the requirement. An example has been given below:

| title   | age_appropriate | in_stock_nearby | not_too_mainstream |
| ------- | --------------- | --------------- | ------------------ |
| x-men 2 | no              | yes             | yes                |

## Task 7

1. We are refining the quality of the films we currently have in our database by removing the lowest rated. Management has asked you to create an output with information about the lowest rated film of each genre:

-   Genre name
-   Film title
-   Rating

2. Management is now trying to refine the quality of stock in the **Manchester** store particularly. Create an output that that shows:

-   Genre name
-   Film title
-   Rating

**_If the store doesn't stock any films of a certain genre then do not include that genre in the output table._**

## Task 8

An Entitiy Relationship Diagram (ERD) is a good way to visualise the structure of a database and it's relationships. Use the following free software [dbdiagram.io](https://dbdiagram.io/home) to draw out the relationships between the different tables.

## Task 9

Using `pg8000` build the following python functions:
