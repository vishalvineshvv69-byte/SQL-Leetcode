with cte as
(
    select 
    e.id,
    e.salary,
    dense_rank() over(order by e.salary desc) as  rank
    from Employee as e
)
select 
 MAX(CASE WHEN x.rank = 2 THEN salary END) AS SecondHighestSalary
from cte as x