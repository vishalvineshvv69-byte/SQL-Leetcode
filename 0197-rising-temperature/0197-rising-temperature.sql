select 
x.Id
from (
        select 
        w.id,
        w.recordDate,
        w.temperature,
        lag(w.temperature) over (order by recordDate) as pt,
        lag(w.recordDate) over (order by recordDate)  as pd
        from Weather as w 
     ) as x
where x.temperature > x.pt
and datediff(day,x.pd,x.recordDate) = 1