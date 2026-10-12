with cte as 
(
    select
    c.class,
    count(student) as TotalStudent
    from Courses as c
    group by c.class    
)
select 
x.class
from cte as x
where x.TotalStudent >=5