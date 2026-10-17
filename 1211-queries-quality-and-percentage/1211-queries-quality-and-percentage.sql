select 
q.query_name,
round(sum(cast(q.rating as decimal(10,2))/q.position)/count(*),2) as quality ,
round((cast(count(case when q.rating < 3 then 0 end )as float)/ count(*) )*100,2) as poor_query_percentage 
from Queries as q
group by q.query_name






