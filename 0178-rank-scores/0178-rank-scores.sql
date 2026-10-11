select
s.score,
dense_rank() over (order by s.score desc) as Rank
from Scores as s