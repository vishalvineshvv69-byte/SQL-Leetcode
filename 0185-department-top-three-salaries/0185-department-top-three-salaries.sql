with c as 
(
select 
d.name as Department,
e.name as Employee,
e.Salary ,
dense_rank() over (partition by d.name order by  e.Salary desc) as rank
from Employee as e
left join Department as d
on e.departmentId = d.id
)
select 
c.Department ,
c.Employee ,
c.Salary 
from c 
where c.rank <=3