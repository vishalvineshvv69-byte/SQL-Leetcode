with cte as
(
    select 
    e.*,
    d.name as Department ,
    dense_rank() over (partition by e.departmentId order by e.salary desc ) as rank
    from Employee as e
    left join Department as d 
    on e.departmentId = d.id
)
select 
x.Department ,
x.name as Employee ,
x.salary
from cte as x
where x.rank = 1

