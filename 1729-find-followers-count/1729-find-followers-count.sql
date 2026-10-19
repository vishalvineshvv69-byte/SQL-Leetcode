select
f.user_id,
count(follower_id) as followers_count
from Followers as f
group by f.user_id 