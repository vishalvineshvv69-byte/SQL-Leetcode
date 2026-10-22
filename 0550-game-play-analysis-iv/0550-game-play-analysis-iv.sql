with cte as 
(
select
a.player_id ,
a.event_date,
min(a.event_date) over (partition by a.player_id) login_date,
lead(a.event_date) over(partition by a.player_id  order by a.event_date asc ) next_date
from Activity as a
)
select 
round(cast(count(distinct x.player_id ) as float ) / (select  count(distinct player_id)from Activity) ,2) as fraction  
from cte as x
where dateadd(day,1,login_date) = next_date