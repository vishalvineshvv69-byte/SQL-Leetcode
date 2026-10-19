select 
t.x,
t.y,
t.z,
case 
when abs(t.x) + abs(t.y) > abs(t.z)  and abs(t.y) + abs(t.z) > abs(t.x)  and abs(t.x) + abs(t.z) > abs(t.y)then 'Yes'  
else 'No'
end triangle
from Triangle as t