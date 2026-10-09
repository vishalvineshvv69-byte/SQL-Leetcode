/* Write your T-SQL query statement below */
select
e.name,
b.bonus 
from Employee as e
left join Bonus as b
on e.empId = b.empId
where b.empId is null 
or b.bonus < 1000
order by e.empId