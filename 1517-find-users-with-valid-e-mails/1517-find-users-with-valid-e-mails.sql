select 
*
from Users 
WHERE mail COLLATE Latin1_General_100_BIN2
LIKE '[a-zA-Z]%@leetcode.com'
AND LEFT(mail, LEN(mail) - LEN('@leetcode.com'))
COLLATE Latin1_General_100_BIN2
NOT LIKE '%[^a-zA-Z0-9_.-]%'