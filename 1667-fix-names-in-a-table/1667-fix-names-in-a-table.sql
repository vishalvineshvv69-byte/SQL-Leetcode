select 
u.user_id ,
upper(left(trim(u.name),1)) + lower(substring(trim(u.name),2,len(trim(u.name)))) as name
from Users as u
order by u.user_id