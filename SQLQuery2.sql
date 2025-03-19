
----------------------- KPI'S REQUIREMNT ---------------------------------

SELECT  SUM(total_price) AS [Total Revenue]  FROM pizza_sales

select sum(total_price)/count(Distinct(order_id)) as [Avg Sales] from pizza_sales

select SUM(quantity) as [Total Pizza sold] from pizza_sales

select count(DISTINCT(order_id)) AS [Total Order Placed] from pizza_sales


select 
		cast(convert(decimal(10,2), sum((quantity)))/convert(decimal(10,2), COUNT(Distinct(order_id))) AS decimal(10,2) ) 
		as [Average Pizza Per Order] 
		from pizza_sales

----------------------- CHART'S REQUIREMNT ---------------------------------

SELECT DATENAME(DW, order_date) as [Order Day], count(distinct(order_id)) as [Total Order] FROM pizza_sales
group by DATENAME(DW, order_date)


SELECT DATENAME(MONTH, order_date) as [Month Name], count(distinct(order_id)) as [Total Order] FROM pizza_sales
group by DATENAME(MONTH, order_date)
order by [Total Order]  desc

select pizza_category, sum(total_price) as [Total Sales], SUM(total_price) * 100 / (select SUM(total_price) 
from pizza_sales where MONTH(order_date) = 1 ) as [% Total Sales]  from pizza_sales 
where MONTH(order_date) = 1				-- Month of 'January'
group by pizza_category

select pizza_size, Cast(sum(total_price) AS decimal(10, 2)) as [Total Sales] , Cast(SUM(total_price) * 100 / (select SUM(total_price) 
from pizza_sales)  AS decimal(10,  2)) as [% Total Sales]  from pizza_sales 
group by pizza_size
order by [% Total Sales]  desc


select top 5 pizza_name, SUM(total_price) as [Total revenue] from pizza_sales
group by pizza_name
order by  [Total revenue] desc

select top 5 pizza_name, SUM(total_price) as [Total revenue] from pizza_sales
group by pizza_name
order by  [Total revenue] 

select top 5 pizza_name, SUM(quantity) as [Total Quantity] from pizza_sales
group by pizza_name
order by  [Total Quantity] asc

select top 5 pizza_name, COUNT(Distinct(order_id)) as [Total Order] from pizza_sales
group by pizza_name
order by  [Total Order] asc