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
select user_id, tweet_date, round(avg(tweet_count) over(partition by user_id
order by tweet_date rows between 2 preceding and current row ),2) as rolling_avg_3d
from tweets;
-- Bài 6
with cte AS
(select *, lag(transaction_timestamp) over(PARTITION BY
merchant_id, credit_card_id, amount order by transaction_timestamp) as prev_transaction_time 
from transactions)

select count(transaction_id) as payment_count
from cte 
where extract(EPOCH from transaction_timestamp-prev_transaction_time)/60<=100;
-- Bài 7
with cte as(
select category, product, sum(spend) as total_spend from product_spend
where extract(year from transaction_date)=2022
group by category, product),

  cte2 as(
select *,row_number() over(partition by category
order by total_spend desc) as rnk
from cte)

select category, product, total_spend
from cte2
where rnk<=2

-- Bài 8
with cte AS
(select a.artist_name, count(*) as num_of_times
from global_song_rank g left join songs s 
on g.song_id=s.song_id
left join artists a on s.artist_id=a.artist_id
where g.rank<=10
group by a.artist_name),

cte1 as 
(select *, dense_rank() over(order by num_of_times desc) as artist_rank
from cte)

select artist_name, artist_rank
from cte1
where artist_rank<=5
order by artist_name, artist_rank;
