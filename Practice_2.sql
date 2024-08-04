-- Bài 1
select distinct CITY from STATION
where ID%2=0
-- Bài 2
select count(CITY)-COUNT(distinct CITY)
from STATION
-- Bài 3
select ceil(avg(salary)-avg(replace(salary,0,''))) 
from EMPLOYEES;
-- Bài 4
SELECT ROUND(CAST(SUM(item_count * order_occurrences) AS DECIMAL) / 
SUM(order_occurrences), 1) AS mean
FROM items_per_order;
-- Bài 5
SELECT candidate_id FROM candidates
where skill in ('Python','Tableau', 'PostgreSQL')
group by candidate_id
having count(skill)=3
-- Bài 6
SELECT user_id, date(max(post_date))-date(min(post_date))
as days_between
FROM posts
where post_date>='2021-01-01' and
post_date<'2022-01-01'
group by user_id
having count(post_id)>=2
-- Bài 7
SELECT card_name,
max(issued_amount)- min(issued_amount) as difference
FROM monthly_cards_issued
group by card_name
order by difference desc
-- Bài 8
SELECT manufacturer, 
count(drug) as drug_count, 
abs(sum(cogs-total_sales)) as total_loss
FROM pharmacy_sales
where total_sales<cogs
group by manufacturer
order by total_loss desc
-- Bài 9
select * from Cinema
where ID%2!=0 and description!='boring'
order by rating desc
-- Bài 10
select teacher_id, count(distinct subject_id) as cnt
from Teacher
group by teacher_id
-- Bài 11
select user_id, count( follower_id) as followers_count
from Followers
group by user_id
order by user_id 
--Bài 12
select class from Courses
group by class
having count(student)>=5
