select 
x.unique_id,
e.name
from Employees as e
left join EmployeeUNI as x
on e.id = x.id