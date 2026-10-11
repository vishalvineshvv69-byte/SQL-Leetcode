with c as 
(
select 
p.email,
count(p.email) as f
from Person as p
group by p.email
)
select 
c.email
from c
where c.f > 1