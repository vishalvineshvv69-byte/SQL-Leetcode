select 
e.reports_to as employee_id ,
x.name,
count(e.employee_id) as reports_count,
cast(round(avg(cast(e.age as float)),0) as int) as average_age
from Employees as e
join Employees as x
on e.reports_to = x.employee_id 
group by e.reports_to,x.name
order by e.reports_to
