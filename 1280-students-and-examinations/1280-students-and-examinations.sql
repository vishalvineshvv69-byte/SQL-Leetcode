with cte as 
(
   select 
   e.student_id,
   e.subject_name,
   count(e.student_id ) as attended_exams 
   from Examinations as e
   group by e.student_id ,e.subject_name 
 
)
select 
s.student_id ,
s.student_name ,
x.subject_name ,
case
    when attended_exams is null then 0
    else attended_exams
end as attended_exams
from Students as s
cross join Subjects as x
left join cte as c
on s.student_id= c.student_id
and x.subject_name = c.subject_name
order by s.student_id ,x.subject_name 
