--Bài 1
select country.continent, 
floor(avg(city.population)) from country inner join city 
on city.countrycode = country.code 
group by country.continent;
--Bài 2
SELECT round(1.0*sum(case when t.signup_action='Confirmed' then 1 else 0 end)/count(distinct e.user_id),2) 
as confirm_rate
from  emails e
left join texts t
on e.email_id=t.email_id
--Bài 3
with ct as 
(select b.age_bucket, sum(case when activity_type='open' then time_spent else 0 end) as t_o, 
sum (case when activity_type='send' then time_spent else 0 end) as t_s from activities a
left join age_breakdown b on a.user_id=b.user_id
group by b.age_bucket)

select age_bucket, round(t_s/(t_s+t_o)*100.0,2) as
send_perc, round(t_o/(t_s+t_o)*100,2) as open_perc
from ct;
--Bài 4
with ct AS(
select c.*, p.product_category
from customer_contracts c
left join products p
on c.product_id=p.product_id)

select customer_id
from ct
group by customer_id
having count(distinct product_category)=
(select count(distinct product_category) from products)
--Bài 5
select m.employee_id, m.name, count(e.employee_id) as reports_count, round(avg(e.age)) as average_age
from employees e join employees m on e.reports_to = m.employee_id
group by employee_id
order by employee_id;
--Bài 6
select product_name, sum(unit) as unit from products
join orders using(product_id)
where extract(year from order_date)=2020 and extract(month from order_date)=2
group by 1
having sum(unit)>99
--Bài 7
select p.page_id
from pages p
left join page_likes p1
on p.page_id=p1.page_id
where p1.page_id is NULl
order by p.page_id
