--1.a wrong query leaves out the nulls
select count(*) from ratings where withdrawn_reason!= 'Spam detected'
and movie_id in (select movie_id from movies where is_available = true and release_year > 2015);

--1.b rows left out from 1.a
select count(*) from ratings where withdrawn_reason is null
and movie_id in (select movie_id from movies where is_available = true and release_year > 2015);

--1.c corrected query where we are showing the nulls as well
select count(*) from ratings where (withdrawn_reason!= 'Spam detected' or withdrawn_reason is null)
and movie_id in (select movie_id from movies where is_available = true and release_year > 2015);

--1.d total count to show 1.c is right
select count(*) from ratings where coalesce(withdrawn_reason, 'none') !='Spam detected'
and movie_id in (select movie_id from movies where is_available = true and release_year > 2015);


--2. error
select movies.release_year as year from movies where year > 2015 and is_available = true;

-- subquery fix
select * from (select movies.release_year as year, movies.is_available from movies) k
where year > 2015 and is_available = true;

-- where condition
select movies.release_year as year from movies where release_year > 2015 and is_available = true;
