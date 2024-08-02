-- Bài 1
select  NAME FROM CITY 
where POPULATION >120000 AND COUNTRYCODE='USA'
-- Bài 2
select * from  CITY
where COUNTRYCODE='JPN'
-- Bài 3
select CITY, STATE FROM STATION 
--  Bài 4
select distinct CITY FROM STATION 
WHERE CITY like 'a%' or CITY like 'e%' or CITY like 'i%' or CITY like 'o%' or CITY like 'u%'
-- Bài 5
select distinct CITY FROM STATION 
WHERE CITY like '%a' or CITY like '%e' or CITY like '%i' or CITY like '%o' or CITY like '%u'
-- Bài 6
 select distinct CITY FROM STATION 
WHERE CITY not like 'A%' and CITY not like 'E%' and CITY not like 'I%' and CITY not like 'O%' and CITY not like 'U%'
-- Bài 7
select name from Employee 
order by name
-- Bài 8
select name from Employee
where salary >2000 and months<10
order by employee_id
-- Bài 9
select product_id from Products
where low_fats ='Y' and recyclable='Y'
-- Bài 10
select name from Customer
where referee_id!=2 or referee_id is null
-- Bài 11
select name, population, area from World
where area>=3000000 or population>=25000000
-- Bài 12
select distinct author_id as id from Views
where author_id=viewer_id
order by author_id 
-- Bài 13
SELECT part, assembly_step
FROM parts_assembly
WHERE finish_date IS NULL;
-- Bài 14
select * from lyft_drivers
where yearly_salary<=30000 or yearly_salary>=70000
-- Bài 15
select advertising_channel from uber_advertising
where money_spent>100000 and year=2019


