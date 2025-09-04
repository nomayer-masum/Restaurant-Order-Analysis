-- Combine the menu_items and order_details tables into a single table
select *
from order_details as od
left JOIN menu_items as mi
on mi.menu_item_id = od.item_id;

-- What were the least and most ordered items? What categories were they in?
select mi.item_name, mi.category, count(order_details_id) as number_of_purchases
from order_details as od
JOIN menu_items as mi
on mi.menu_item_id = od.item_id
group by mi.item_name, mi.category
order by number_of_purchases asc;

select mi.item_name, mi.category, count(order_details_id) as number_of_purchases
from order_details as od
JOIN menu_items as mi
on mi.menu_item_id = od.item_id
group by mi.item_name, mi.category
order by number_of_purchases desc;

-- What were the top 5 orders that spent the most money?
select od.order_id, sum(mi.price) as total_spend
from order_details as od
JOIN menu_items as mi
on mi.menu_item_id = od.item_id
group by od.order_id
order by total_spend desc
limit 5; 

-- View the details of the highest spend order. Which specific items were purchased?
select mi.category, count(od.item_id) as number_of_items
from order_details as od
left JOIN menu_items as mi
on mi.menu_item_id = od.item_id
where od.order_id = 440
GROUP BY mi.category;

-- BONUS: View the details of the top 5 highest spend orders
select od.order_id, mi.category, count(od.item_id) as number_of_items
from order_details as od
left JOIN menu_items as mi
on mi.menu_item_id = od.item_id
where od.order_id In (440, 2075, 1957,330,2675)
GROUP BY od.order_id, mi.category
order by mi.category, number_of_items desc;
