-- Bài 1
with cte1 as
(select extract(year from transaction_date) as year,
product_id, sum(spend) as curr_year_spend
from user_transactions
group by extract(year from transaction_date), product_id),

cte2 as
(select *, lag(curr_year_spend) over(partition by product_id order by year) as prev_year_spend from cte1)

select *, round((curr_year_spend/prev_year_spend-1)*100.0,2) as yoy_rate
from cte2;
-- Bài 2
with cte AS
(select *, rank() over(partition by card_name 
order by issue_year, issue_month) as rnk
from monthly_cards_issued)

select card_name,issued_amount
from cte 
where rnk=1
order by issued_amount desc;
-- Bài 3
with cte as 
(select *, row_number() over(partition by user_id ORDER BY
transaction_date) as tran_num from transactions)

select user_id, spend, transaction_date
from cte 
where tran_num=3
-- Bài 4
with cte AS
(select *, rank() over(partition by user_id ORDER BY
transaction_date desc) as rnk 
from user_transactions)

select transaction_date, user_id, count(distinct product_id) as purchase_count
from cte 
where rnk=1 
group by transaction_date, user_id
-- Bài 5

-- Bài 6
-- Bài 7
-- Bài 8
