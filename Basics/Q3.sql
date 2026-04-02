LinkedIn is a professional social networking app. They want to give top voice badge to their best creators to encourage them to create more quality content. A creator qualifies for the badge if he/she satisfies following criteria.

 

1- Creator should have more than 50k followers.
2- Creator should have more than 100k impressions on the posts that they published in the month of Dec-2023.
3- Creator should have published atleast 3 posts in Dec-2023.

 

Write a SQL to get the list of top voice creators name along with no of posts and impressions by them in the month of Dec-2023.

 

Table: creators(primary key : creator_id)
+--------------+-------------+
| COLUMN_NAME  | DATA_TYPE   |
+--------------+-------------+
| creator_id   | int         |
| creator_name | varchar(20) |
| followers    | int         |
+--------------+-------------+
Table: posts(primary key : post_id)
+--------------+------------+
| COLUMN_NAME  | DATA_TYPE  |
+--------------+------------+
| creator_id   | int        |
| post_id      | varchar(3) |
| publish_date | date       |
| impressions  | int        |
+--------------+------------+



with cte_1 as (select * from creators inner join posts using(creator_id)
 where 1 =1 
 and followers >50000
-- and impressions >100000
and publish_date between '2023-12-01' and '2023-12-31')

-- Select * from cte_1

Select creator_name, 
count(creator_id) as no_of_posts,
sum(impressions) as total_impressions
from cte_1
group by 1
having sum(impressions) >100000
and count(creator_id)>=3
order by 3 desc