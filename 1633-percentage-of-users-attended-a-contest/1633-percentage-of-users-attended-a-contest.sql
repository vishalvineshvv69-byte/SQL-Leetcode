select 
r.contest_id,
round((cast(count(r.user_id)as float)/(select distinct count(*) from Users)) * 100,2) as percentage 
from Register as r
group by r.contest_id 
order by round((cast(count(r.user_id)as float)/(select count(*) from Users)) * 100,2) desc ,contest_id asc