-- View the order_details table. What is the date range of the table?
select * from order_details;

select 
min(order_date) as earliest_date, 
max(order_date) as latest_date  
from order_details; -- earliest date = 2023-01-01, latest date = 2023-03-31

-- How many orders were made within this date range? How many items were ordered within this date range?
select count(distinct order_id) as number_of_orders from order_details; -- 5370

select count(order_details_id) as number_of_items from order_details; -- 12234

-- Which orders had the most number of items?
select order_id as orders, count(item_id) as number_of_items from order_details
GROUP BY order_id
order by number_of_items desc;

-- How many orders had more than 12 items?
select count(*) from
(select order_id as orders, count(item_id) as number_of_items from order_details
GROUP BY order_id
having number_of_items > 12) as number_of_orders;