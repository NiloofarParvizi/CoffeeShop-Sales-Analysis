-- ---------------------
-- Coffee sales analysis
-- ----------------------

USE CoffeeSales;
GO

SELECT TOP 10 *
FROM dbo.coffeesales;

 -- Total revenue
 select round(sum(money),2) total_revenu
 from dbo.Coffeesales

 -- Avrage order value
 select round(avg(money),2) avrage_order_value
  from dbo.Coffeesales

 --Revenue by coffee
 select 
	coffee_name,
	count(*) transactions,
	round(sum(money), 2) revenue
from dbo.Coffeesales
group by coffee_name
order by revenue desc
  
-- coffee ranking
select coffee_name,
	   round(sum(money), 2) revenue,
	   rank() over(order by sum(money) desc) revenue_rank
from dbo.Coffeesales
group by coffee_name
order by revenue_rank

-- Revenue by payment method
select cash_type,
     count(*) transactions,
	 round(sum(money), 2) revenue
from dbo.Coffeesales
group by cash_type
order by revenue desc

-- Monthly revenue
select 
year(date) as year,
month(date)as month,
round(sum(money), 2) revenue
from dbo.Coffeesales
group by year(date), month(date) 
order by year, month desc

-- hourly revenue 
select
datepart(HOUR, datetime) hour,
count(*) transaction_count,
round(sum(money), 2) revenue
from dbo.Coffeesales
group by datepart(HOUR, datetime)
order by revenue desc 

-- revenue share by coffee
select 
	coffee_name,
	round(sum(money), 2) revenue,
	round( SUM(money) * 100.0 / SUM(SUM(money)) OVER (), 2) revenue_share

from dbo.Coffeesales
group by coffee_name
order by revenue desc 	



























