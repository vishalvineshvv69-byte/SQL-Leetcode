select
t.id,
case
when p_id is null then 'Root'
when exists (select 1 from tree as c where c.p_id = t.id) then 'Inner'
else 'Leaf'
end as type
from Tree as t