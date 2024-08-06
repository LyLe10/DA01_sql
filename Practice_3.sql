-- Bài 1
select name 
from STUDENTS
where Marks>75
order by right(name,3), ID
-- Bài 2
select user_id,
concat(upper(left(name,1)) , lower(right(name, length(name)-1))) as name
from Users
order by user_id
-- Bài 3
select manufacturer,
'$' || round(SUM(total_sales)/1000000,0) || ' '|| 'million'
from pharmacy_sales
group by manufacturer
order by sum(total_sales) desc, manufacturer
-- Bài 4
SELECT extract(month from submit_date) as mth,
product_id,
round(avg(stars),2) as avg_stars
FROM reviews
group by  extract(month from submit_date), product_id
order by mth, product_id
-- Bài 5
SELECT sender_id,
count(message_id) as message_count
FROM messages
where extract(month from sent_date)=8 and extract(year from sent_date)=2022
group by sender_id
order by count(message_id) desc
limit 2
-- Bài 6
select tweet_id from Tweets
where length(content)>15
-- Bài 7
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE (activity_date > "2019-06-27" AND activity_date <= "2019-07-27")
GROUP BY activity_date;
-- Bài 8
select 
count(employee_id) as number_employer
from employees
where extract(month from joining_date) between 1 and 7 and 
extraxt(year from joining_date)=2022

-- Bài 9
select  position('a' in  first_name) as position_a
from worker
where first_name=''Amitah'
-- Bài 10
select substring(title, length(winery)+2,4) 
from winemag_p2
where country='Macedonia'
