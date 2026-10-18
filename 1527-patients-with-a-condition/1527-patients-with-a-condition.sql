
select 
p.patient_id,
p.patient_name ,
p.conditions 
from Patients as p
where conditions  like 'DIAB1%'
or conditions  like '% DIAB1%'