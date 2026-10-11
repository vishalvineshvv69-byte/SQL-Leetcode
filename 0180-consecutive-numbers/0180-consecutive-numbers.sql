with cte as 
(
    select 
    l.id,
    l.num as p,
    lag(l.num,1) over ( order by l.id) as p1,
    lag(l.num,2) over (order by l.id) as p2
    from Logs as l
)
select distinct
c.p as ConsecutiveNums 
from cte as c
where c.p = c.p1
and c.p1 = c.p2