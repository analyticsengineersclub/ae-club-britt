select customer_id, count(distinct visitor_id) as visitor_id
from `analytics-engineers-club.web_tracking.pageviews`
where customer_id is not null
group by 1 
order by 2 desc 
limit 5