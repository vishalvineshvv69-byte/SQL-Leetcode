with cte as
(
    select
    m.num
    from MyNumbers as m
    group by m.num
    having count(m.num) = 1
)
select
max(c.num) as num
from cte as c