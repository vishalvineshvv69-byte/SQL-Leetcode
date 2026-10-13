with cte as
(
    select 
    e.id,
    e.name as Employee ,
    e.salary,
    e.managerId,
    x.name as manname,
    x.salary as mansal
    from Employee  as e
    left join Employee as x
    on e.managerId = x.id
)
select 
v.Employee
from cte as v
where v.salary > v.mansal