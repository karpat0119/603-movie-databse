--Part a total number of events and failures
select movie_id, count(*) as events,
       sum(case when withdrawn_reason = 'Spam detected' then 1 else 0 end) as failure
from ratings
group by movie_id
order by failure desc;

-- Part b subtotal per region grand total
select coalesce(device_country, 'Grand Total') as region, count(*) as events
from ratings
group by rollup (device_country, movie_id)
having movie_id isnull
order by device_country;

--part c performance per producer and failure baseline percentage for high volume producers
with prod as (
    select movie_id, count(*) as events,
           sum(case when withdrawn_reason = 'Spam detected' then 1 else 0 end) as failure
    from ratings
    group by movie_id
)

select count(*) as prod, sum(events) as events, sum(failure) as failure,
       round(avg(100.0 * failure/events),2) || '%'as failureBaselinePercentage
from prod
where events > 10;
