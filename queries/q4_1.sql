-- 1 Calculate count,  total, average, min, max, distinct actor
select count(*) as events, sum(score) as total, avg(score) as average, min(score) as minimum,
       max(score) as maximum, count(distinct user_id)
from ratings;

--2 Calculate event count and avg for each producer
select movie_id, count(*) as event, avg(score) as average
from ratings
group by movie_id
order by event desc;

--3 producers with volume
select movie_id, count(*) as event, avg(score) as average
from ratings
group by movie_id
having count(*) > 10 -- we used 10 for the threshold because the dataset is small and only one value was less than 10
order by event desc;


--4 2 dimension tells leadership which movies do well in different country
select device_country, movie_id ,count(*) as event, avg(score) as average
from ratings
group by device_country, movie_id
order by event desc;