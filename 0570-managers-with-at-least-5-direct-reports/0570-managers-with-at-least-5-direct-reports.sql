with cte as
(
    select 
    e.managerId,
    x.name,
    count(e.managerId ) as s
    from Employee as e
    inner join Employee as x
    on e.managerId  = x.id
    group by e.managerId,x.name
)
select
f.name
from cte as f
where f.s>= 5