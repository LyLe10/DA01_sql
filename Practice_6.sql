-- Bài 1
with gr_listings as(
select company_id, title, description, count(join_id) as count_id
from job_listings
group by company_id, title, description
)
select count(distinct(company_id) as duplicate_companies
from gr_listings
where count>1
-- Bài 2
with cte as(
select category, product, sum(spend) as total_spend from product_spend
where extract(year from transaction_date)=2022
group by category, product),

  cte2 as(
select *,row_number() over(partition by category
order by total_spend desc) ass rnk
from cte)

select category, product, total_spend
from cte2
where rnk<=2
-- Bài 3
  select count(*) as menber_count
  from (
  select policy_holder_id, count(case_id) as no_calls
  from CALLERS 
  GROUP BY policy_holder_id
  having count(case_id)>=3)
  as T
-- Bài 4
  select p.page_id from pages P
  where p.page_id not in (select page_id from page_likes)
  order by p.page_id
-- Bài 5
  with cte as
  (select distinct user_id from user_actions
  where extract(month from event_date)=7
  and extract (year from event_date)=2022
  intersect
  select distinct user_id
  from user_actions
  where extract(month from event_date)=6
  and extract(year from event_date)=2022)

  select '7' as month, count(user_id) as monthly_active_users
  from cte;
-- Bài 6
SELECT LEFT(trans_date, 7) AS month,
country, 
COUNT(id) AS trans_count,
SUM(state = 'approved') AS approved_count,
SUM(amount) AS trans_total_amount,
SUM((state = 'approved') * amount) AS approved_total_amount
FROM Transactions
GROUP BY month, country;
-- Bài 7
select product_id , year as first_year,quantity, price from sales 
where (product_id,year )in
(
select product_id,min(year) as year from sales group by product_id
)
-- Bài 8
with table as
(
   select distinct customer_id,product_key from Customer
) 
select customer_id from table2 group by customer_id
having count(*) in (select count(*) from product )
-- Bài 9
SELECT e.employee_id 
FROM Employees e 
WHERE e.salary < 30000 
AND e.manager_id NOT IN (
SELECT m.employee_id FROM Employees m)
GROUP BY e.employee_id 
ORDER BY e.employee_id
-- Bài 10
with gr_listings as(
select company_id, title, description, count(job_id) as count_id
from job_listings
group by company_id, title, description
)
select count(distinct(company_id)) as duplicate_companies
from gr_listings
where count_id>1
-- Bài 11
with cte as 
    (select u.name as results from users u join movierating m on u.user_id = m.user_id
    group by u.name
    order by count(m.movie_id) desc, u.name asc
    limit 1),
cte2 as
    (select m.title as results from movies m join movierating mr on m.movie_id = mr.movie_id
    where mr.created_at >= "2020-02-01" and mr.created_at <= "2020-02-29"
    group by m.title
    order by avg(mr.rating) desc, m.title asc
    limit 1
    )
select results from cte
union all
select results from cte2
-- Bài 12
with new as (
(select accepter_id as id, count(*) as num from RequestAccepted
group by 1)
union all
(select requester_id as id, count(*) as num from RequestAccepted
group by 1)
)
select id, sum(num) as num from new
group by id
order by 2 desc limit 1
