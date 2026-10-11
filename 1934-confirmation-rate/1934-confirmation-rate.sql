with a as
(
    select 
    s.user_id,
    count(c.action) as Total
    from Signups as s
    left join Confirmations as c
    on s.user_id = c.user_id 
    group by s.user_id 
),
b as 
(
    select 
    s.user_id,
    count(c.action) as TotalC
    from Signups as s
    left join Confirmations as c
    on s.user_id = c.user_id 
    where c.action = 'confirmed'
    group by s.user_id 
)
select 
s.user_id ,
COALESCE(
    ROUND(cast(b.TotalC as float) / NULLIF(a.Total, 0), 2),
    0
) AS confirmation_rate 
from Signups as s
left join a
on s.user_id = a.user_id 
left join b
on a.user_id = b.user_id 
