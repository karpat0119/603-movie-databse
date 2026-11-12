-- 1 below are the people behind the events
select movies.title as producer, users.user_name as actor, ratings.rating_id as event,
ratings.rated_at as eventDate
from ratings
join movies on movies.movie_id = ratings.movie_id
join users on users.user_id = ratings.user_id;

-- 2 producer(movies) associated with each catalogTag
select movies.movie_id as producer, genres.genre_name as catalogTag
from movies
join movie_genres on movie_genres.movie_id = movies.movie_id
join genres on genres.genre_id = movie_genres.genre_id;

--3
select a.movie_id as producerA, b.movie_id as producerB, a.release_year,
a.origin_country as countryA, b.origin_country as countryB
from movies a
join movies b on a.release_year = b.release_year and a.movie_id < b.movie_id
where a.movie_id in (2, 3) or b.movie_id in (2, 3);
