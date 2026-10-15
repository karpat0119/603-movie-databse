-- 1 subquery using in for users who country in brazil or vietnam on movies that are available and after 2015
select user_name from users where user_id in
(select ratings.user_id from ratings where device_country in ('Brazil', 'Vietnam')
 and movie_id in (select movie_id from movies where is_available = true and release_year > 2015)) order by user_name;

--2 same at 1 but with a CTE
with country as (select distinct user_id from ratings
    where device_country in ('Brazil', 'Vietnam')
    and movie_id in (select movie_id from movies where is_available = true and release_year > 2015))

select user_name from users
join country on country.user_id = users.user_id order by user_name;

--3 same results as 1 and 2 but with a join
select distinct user_name from users
join ratings on ratings.user_id = users.user_id
join movies on movies.movie_id = ratings.movie_id
where device_country in ('Brazil', 'Vietnam')
and movies.is_available = true and movies.release_year > 2015
order by user_name;

--4 comparison to prove the three queries have thave values.
with q1 as (
        select user_name from users where user_id in
        (select ratings.user_id from ratings where device_country in ('Brazil', 'Vietnam')
         and movie_id in (select movie_id from movies where is_available = true and release_year > 2015))
    ),
    q2 as (
        with country as (select distinct user_id from ratings
            where device_country in ('Brazil', 'Vietnam')
            and movie_id in (select movie_id from movies where is_available = true and release_year > 2015))

        select user_name from users
        join country on country.user_id = users.user_id order by user_name
    ),
    q3 as (
        select distinct user_name from users
        join ratings on ratings.user_id = users.user_id
        join movies on movies.movie_id = ratings.movie_id
        where device_country in ('Brazil', 'Vietnam')
        and movies.is_available = true and movies.release_year > 2015
    )
    select 'q1 not in q2' as check_name, count(*) as missing_rows
      from q1 where user_name not in (select user_name from q2)
    union all
    select 'q2 not in q1', count(*) from q2 where user_name not in (select user_name from q1)
    union all
    select 'q1 not in q3', count(*) from q1 where user_name not in (select user_name from q3)
    union all
    select 'q3 not in q1', count(*) from q3 where user_name not in (select user_name from q1);


--5 The input condition where all three would not meet is if there are duplicate usernames the first two queries
-- would not be able to handle it and give a higher count than the third query which has distinct on there

