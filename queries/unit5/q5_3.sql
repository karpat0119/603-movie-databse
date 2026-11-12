-- cross join
select m.movie_id as producer, g.genre_name as catalogTag
from movies m
cross join genres g;

-- count in cross join query is 75, genres is 5 and movies is 15.
-- It's multiplication matches because 15 times 5 is 75.
-- This is good if you want every combination,
-- but it can be bad if its millions of records this query then becomes expensive to run.


-- explain analyze
explain
select movies.title as producer, users.user_name as actor, ratings.rating_id as event,
ratings.rated_at as eventDate
from ratings
join movies on movies.movie_id = ratings.movie_id
join users on users.user_id = ratings.user_id;
-- the algorithm used is a nested loop and hash join
-- Nested loop was selected as there was an index on movies_pkey. And hash was used to put the user ids in a hash table
-- the hash table can cause a slow down if we run out of memory for new users in the hash table.


