-- Part A
-- 1 left join for all producers
select distinct movies.movie_id as producer
from movies
left join ratings on ratings.movie_id = movies.movie_id;

--2 inner join
select distinct movies.movie_id as producer
from movies
inner join ratings on ratings.movie_id = movies.movie_id;

-- 2 producers are missing 15 and 14 from the inner join. The reason is because inner join did not find any matching rows so
-- it dropped those rows. Left join did not so as a result we kept producers 15 and 14.

-- Part b

--3 right join for all producers
select distinct movies.movie_id as producer
from ratings
right join movies on ratings.movie_id = movies.movie_id;

--4 full outer join
select distinct movies.movie_id as producer
from movies
full outer join  ratings on ratings.movie_id = movies.movie_id;

-- the things a full outer join can show tha the other joins can't is we can see the blanks that come from both sides.

-- part C
--not exists
select movies.movie_id as producer
from movies
where not exists (select 1 from ratings where ratings.movie_id = movies.movie_id);

-- except
select movie_id as producer
from movies
except
select movie_id from ratings;

-- These two concepts was able to identify the same producers.
--The difference between these two concepts is not exists checks each event. Except gets the difference of producers with producers with events.


