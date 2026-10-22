with cte as 
(
    select 
    q.*,
    sum(q.Weight) over (order by q.turn)as runing_total
    from Queue as q
)
select top 1
x.person_name 
from cte as x
where x.runing_total <= 1000
ORDER BY x.runing_total DESC;