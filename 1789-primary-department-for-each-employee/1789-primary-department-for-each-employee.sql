with cte as 
(
    select
    e.employee_id ,
    e.department_id,
    e.primary_flag,
    case
    when  e.primary_flag  = 'Y'  or         (
                    SELECT COUNT(*)
                    FROM Employee AS x
                    WHERE x.employee_id = e.employee_id
                 ) = 1 then 1
    else 0
    end isprimary
    from Employee as e
),
cte2 as 
(
    select
    c.employee_id,
    c.department_id
    from cte as c
    where isprimary = 1
)
select
employee_id ,
department_id
from cte2 

