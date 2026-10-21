with cte as 
(
    select
    e.employee_id ,
    e.department_id,
    e.primary_flag,
    count(e.department_id) over(partition by e.employee_id) as Wcount
    from Employee as e
),
cte2 as 
(
    select
    c.employee_id,
    c.department_id
    from cte as c
    where primary_flag = 'Y' or  Wcount = 1 
)
select
employee_id ,
department_id
from cte2 

