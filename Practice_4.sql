-- Bài 1
select 
sum (CASE when device_type ='laptop' then 1
else 0 end) as laptop_views,
sum (CASE when device_type ='tablet' then 1
else 0 end) as mobile_views 
from viewership
-- Bài 2
SELECT *,
CASE WHEN x+y>z and x+z>y and y+z>x then "Yes" else "No" END
AS triangle From Triangle;
-- Bài 3
SELECT
round(100*(cast(sum(case when call_category
is null or call_category='n/a' then 1 else 0 end) as decimal)/count(*)),1)
as uncategorised_call_pct 
from callers
--  Bài 4
select name from Customer
where referee_id!=2 or referee_id is null
-- Bài 5
select survived, 
sum(case when pclass = 1 then 1 else 0 end) as first_class,
sum(case when pclass = 2 then 1 else 0 end) as second_class,
sum(case when pclass = 2 then 1 else 0 end) as third_class
from titanic 
group by survived;  
