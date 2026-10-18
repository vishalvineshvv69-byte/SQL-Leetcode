select 
a.activity_date as day,
count(distinct  a.user_id ) as active_users 
from Activity as a
where a.activity_date between '2019-06-28' AND '2019-07-27'
group by a.activity_date 