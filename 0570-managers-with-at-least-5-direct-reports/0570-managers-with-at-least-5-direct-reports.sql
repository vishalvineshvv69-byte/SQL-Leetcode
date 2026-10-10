with cte as 
(
    select 
    e.managerId,
    x.name,
    count(e.id) as NumberOfEmplaoy
    from Employee as e
     join  Employee as x
    on e.managerId = x.id
    where e.managerId is not null
    group by e.managerId , x.name
)
select 
 x.name
from cte as x
where NumberOfEmplaoy > = 5