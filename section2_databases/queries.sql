
-- List of customers and their spending
select customer_name, sum(price) as total_spends
from transactions
group by customer_name
order by total_spends desc

-- Top 3 car manufacturers by sales (quantity) and the sales number for the current month
select manufacturers.name as manufacturer, count(*) as quantity_sold, sum(price) as total_sales
from transactions
inner join cars on transactions.car_id = cars.id
inner join manufacturers on cars.manufacturer_id = manufacturer.id
where extract(MONTH from transactions.datetime) = extract(month from CURRENT_DATE)
group by manufacturers.name
order by manufacturers.name 
