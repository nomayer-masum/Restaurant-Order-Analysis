-- View the menu_items table and write a query to find the number of items on the menu
select * from menu_items;
select count(*) from menu_items;

-- What are the least and most expensive items on the menu?
select * from menu_items
order by price asc limit 1;

select * from menu_items
order by price desc limit 1;

-- How many Italian dishes are on the menu? What are the least and most expensive Italian dishes on the menu?
select count(category) from menu_items
where category = "Italian";

select * from menu_items
where category = "Italian"
order by price asc;

select * from menu_items
where category = "Italian"
order by price desc;

-- How many dishes are in each category? What is the average dish price within each category?
select category, count(item_name) as number_of_dishes from menu_items
GROUP BY category;

select category, avg(price) as avg_dish_price from menu_items
GROUP BY category;