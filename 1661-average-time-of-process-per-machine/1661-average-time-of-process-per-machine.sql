with x as
(
    select 
    a.machine_id,
    a.process_id,
    a.activity_type,
    a.timestamp as starttime 
    from Activity as a
    where activity_type = 'start'
),
y as 
(
     select 
    a.machine_id,
    a.process_id,
    a.activity_type,
    a.timestamp as endtime 
    from Activity as a
    where activity_type = 'end'
)
select 
x.machine_id,
round(avg(y.endtime - x.starttime),3)as processing_time 
from x 
left join y
on x.machine_id = y.machine_id 
and x.process_id = y.process_id 
group by x.machine_id 