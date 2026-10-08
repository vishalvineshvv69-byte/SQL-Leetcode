select 
t.tweet_id 
from Tweets as t
where len(content) > 15