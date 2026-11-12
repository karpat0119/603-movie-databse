

--1 find active producer - top 10 active producer
select m.title from movies m
join ratings r on r.movie_id = m.movie_id
where m.is_available = true
group by m.movie_id
order by sum(r.score) desc limit 10;

--2 find all event status distinct event status
select distinct ratings.rating_status from ratings;

--3.a filter events in one of two ways shows scores between 1 and 3
select * from ratings where score between 1 and 3;

-- 3.b filter events in second way in condition for Vietnam and UK
select * from ratings where device_country in ('Vietnam', 'UK');

-- 4.a like condition for titles with patterns
select title from movies where title like '%_0%';

--4.b find where withdrawn reason is null
select rating_id, withdrawn_reason from ratings
where withdrawn_reason is null;

--4.c replace 4.b nulls with a reason
select rating_id, coalesce(withdrawn_reason, 'None provided') as withdrawn_reason from ratings
where withdrawn_reason is null;

-- 5 query that is simple for non tech people to understand the scores
select ratings.rating_id, m.title, ratings.score as review_score,
       case
           when ratings.score >= 5 then 'Amazing'
           when ratings.score >= 3 then 'Good'
           when ratings.score >= 1.5 then 'Okay'
           else 'Bad'
        end as review
from ratings
join movies m on m.movie_id = ratings.movie_id;