# Restaurant Order Analysis

*This project analyzes customer behavior by identifying the most popular menu items, the highest-priced dishes, and the orders with the highest spend.*

## Database Setup

Creating Database:

```sql
CREATE SCHEMA restaurant_db;
USE restaurant_db;

--
-- Table structure for table `order_details`
--

CREATE TABLE order_details (
  order_details_id SMALLINT NOT NULL,
  order_id SMALLINT NOT NULL,
  order_date DATE,
  order_time TIME,
  item_id SMALLINT,
  PRIMARY KEY (order_details_id)
);

--
-- Table structure for table `menu_items`
--

CREATE TABLE menu_items (
  menu_item_id SMALLINT NOT NULL,
  item_name VARCHAR(45),
  category VARCHAR(45),
  price DECIMAL(5,2),
  PRIMARY KEY (menu_item_id)
);
```

## Exploring Items Table

### Viewing the menu_items table

```sql
select * from menu_items;
```

**Output**:

| menu_item_id | item_name               | category | price  |
|--------------|-------------------------|----------|--------|
| 101          | Hamburger               | American | 12.95  |
| 102          | Cheeseburger            | American | 13.95  |
| 103          | Hot Dog                 | American | 9.00   |
| 104          | Veggie Burger           | American | 10.50  |
| 105          | Mac & Cheese            | American | 7.00   |
| 106          | French Fries            | American | 7.00   |
| 107          | Orange Chicken          | Asian    | 16.50  |
| 108          | Tofu Pad Thai           | Asian    | 14.50  |
| 109          | Korean Beef Bowl        | Asian    | 17.95  |
| 110          | Pork Ramen              | Asian    | 17.95  |
| 111          | California Roll         | Asian    | 11.95  |
| 112          | Salmon Roll             | Asian    | 14.95  |
| 113          | Edamame                 | Asian    | 5.00   |
| 114          | Potstickers             | Asian    | 9.00   |
| 115          | Chicken Tacos           | Mexican  | 11.95  |
| 116          | Steak Tacos             | Mexican  | 13.95  |
| 117          | Chicken Burrito         | Mexican  | 12.95  |
| 118          | Steak Burrito           | Mexican  | 14.95  |
| 119          | Chicken Torta           | Mexican  | 11.95  |
| 120          | Steak Torta             | Mexican  | 13.95  |
| 121          | Cheese Quesadillas      | Mexican  | 10.50  |
| 122          | Chips & Salsa           | Mexican  | 7.00   |
| 123          | Chips & Guacamole        | Mexican  | 9.00   |
| 124          | Spaghetti               | Italian  | 14.50  |
| 125          | Spaghetti & Meatballs   | Italian  | 17.95  |
| 126          | Fettuccine Alfredo      | Italian  | 14.50  |
| 127          | Meat Lasagna            | Italian  | 17.95  |
| 128          | Cheese Lasagna          | Italian  | 15.50  |
| 129          | Mushroom Ravioli        | Italian  | 15.50  |
| 130          | Shrimp Scampi           | Italian  | 19.95  |
| 131          | Chicken Parmesan        | Italian  | 17.95  |
| 132          | Eggplant Parmesan       | Italian  | 16.95  |

### Total Dish Count

```sql
select count(*) from menu_items;
```

**Output**:

| count(*) |
|----------|
| 32       |

### Cheapest Dish

```sql
select * from menu_items
order by price asc limit 1;
```

**Output**:
| menu_item_id | item_name | category | price |
|--------------|-----------|----------|-------|
| 113          | Edamame   | Asian    | 5.00  |

### Most Expensive Dish

```select * from menu_items
order by price desc limit 1;
```
**Output**:
| menu_item_id | item_name     | category | price  |
|--------------|---------------|----------|--------|
| 130          | Shrimp Scampi | Italian  | 19.95  |


### Italian Dish Count
```sql
SELECT COUNT(category) AS count_of_dishes 
FROM menu_items 
WHERE category = 'Italian';
```

**Output:**
| count_of_dishes |
|-----------------|
| 9               |

### Italian Dishes Ordered by Price (Ascending)
```sql
SELECT * 
FROM menu_items 
WHERE category = 'Italian' 
ORDER BY price ASC;
```

**Output:**
| menu_item_id | item_name               | category | price  |
|--------------|-------------------------|----------|--------|
| 124          | Spaghetti               | Italian  | 14.50  |
| 126          | Fettuccine Alfredo      | Italian  | 14.50  |
| 128          | Cheese Lasagna          | Italian  | 15.50  |
| 129          | Mushroom Ravioli        | Italian  | 15.50  |
| 132          | Eggplant Parmesan       | Italian  | 16.95  |
| 125          | Spaghetti & Meatballs   | Italian  | 17.95  |
| 127          | Meat Lasagna            | Italian  | 17.95  |
| 131          | Chicken Parmesan        | Italian  | 17.95  |
| 130          | Shrimp Scampi           | Italian  | 19.95  |

### Italian Dishes Ordered by Price (Descending)
```sql
SELECT * 
FROM menu_items 
WHERE category = 'Italian' 
ORDER BY price DESC;
```

**Output:**
| menu_item_id | item_name               | category | price  |
|--------------|-------------------------|----------|--------|
| 130          | Shrimp Scampi           | Italian  | 19.95  |
| 125          | Spaghetti & Meatballs   | Italian  | 17.95  |
| 127          | Meat Lasagna            | Italian  | 17.95  |
| 131          | Chicken Parmesan        | Italian  | 17.95  |
| 132          | Eggplant Parmesan       | Italian  | 16.95  |
| 128          | Cheese Lasagna          | Italian  | 15.50  |
| 129          | Mushroom Ravioli        | Italian  | 15.50  |
| 124          | Spaghetti               | Italian  | 14.50  |
| 126          | Fettuccine Alfredo      | Italian  | 14.50  |


### Number of Dishes by Category
```sql
SELECT category, COUNT(item_name) AS number_of_dishes 
FROM menu_items 
GROUP BY category;
```

**Output:**
| category | number_of_dishes |
|----------|------------------|
| American | 6                |
| Asian    | 8                |
| Mexican  | 9                |
| Italian  | 9                |


### Average Dish Price by Category
```sql
SELECT category, AVG(price) AS avg_dish_price 
FROM menu_items 
GROUP BY category;
```

**Output:**
| category | avg_dish_price |
|----------|----------------|
| American | 10.066667      |
| Asian    | 13.475000      |
| Mexican  | 11.800000      |
| Italian  | 16.750000      |

---

## Exploring the Orders Table

### Viewing Order Tables (Top 10)
```sql
SELECT * 
FROM order_details 
LIMIT 10;
```

**Output:**
| order_details_id | order_id | order_date  | order_time | item_id |
|------------------|----------|-------------|------------|---------|
| 1                | 1        | 2023-01-01  | 11:38:36   | 109     |
| 2                | 2        | 2023-01-01  | 11:57:40   | 108     |
| 3                | 2        | 2023-01-01  | 11:57:40   | 124     |
| 4                | 2        | 2023-01-01  | 11:57:40   | 117     |
| 5                | 2        | 2023-01-01  | 11:57:40   | 129     |
| 6                | 2        | 2023-01-01  | 11:57:40   | 106     |
| 7                | 3        | 2023-01-01  | 12:12:28   | 117     |
| 8                | 3        | 2023-01-01  | 12:12:28   | 119     |
| 9                | 4        | 2023-01-01  | 12:16:31   | 117     |
| 10               | 5        | 2023-01-01  | 12:21:30   | 117     |


### Earliest and Latest Order Dates
```sql
SELECT 
    MIN(order_date) AS earliest_date, 
    MAX(order_date) AS latest_date  
FROM order_details;
```

**Output:**
| earliest_date | latest_date |
|---------------|-------------|
| 2023-01-01    | 2023-03-31  |


### Number of Unique Orders
```sql
SELECT COUNT(DISTINCT order_id) AS number_of_orders 
FROM order_details;
```

**Output:**
| number_of_orders |
|------------------|
| 5370             |


### Total Number of Items Ordered
```sql
SELECT COUNT(order_details_id) AS number_of_items 
FROM order_details;
```

**Output:**
| number_of_items |
|-----------------|
| 12234           |


### Top 10 Orders by Number of Items
```sql
SELECT order_id, COUNT(item_id) AS number_of_items 
FROM order_details 
GROUP BY order_id 
ORDER BY number_of_items DESC 
LIMIT 10;
```

**Output:**
| order_id | number_of_items |
|----------|-----------------|
| 2675     | 14              |
| 443      | 14              |
| 1957     | 14              |
| 3473     | 14              |
| 330      | 14              |
| 440      | 14              |
| 4305     | 14              |
| 1274     | 13              |
| 2126     | 13              |
| 1734     | 13              |


### Orders with More Than 12 Items
```sql
SELECT COUNT(*) 
FROM (
    SELECT order_id AS orders, COUNT(item_id) AS number_of_items 
    FROM order_details 
    GROUP BY order_id 
    HAVING number_of_items > 12
) AS number_of_orders;
```

**Output:**
| count(*) |
|----------|
| 20       |

---

## Analyzing Customer Behavior

### Combined Menu Items and Order Details (Top 10)
```sql
SELECT *
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON mi.menu_item_id = od.item_id
LIMIT 10;
```

**Output:**
| order_details_id | order_id | order_date  | order_time | item_id | menu_item_id | item_name           | category | price  |
|------------------|----------|-------------|------------|---------|--------------|---------------------|----------|--------|
| 1                | 1        | 2023-01-01  | 11:38:36   | 109     | 109          | Korean Beef Bowl    | Asian    | 17.95  |
| 2                | 2        | 2023-01-01  | 11:57:40   | 108     | 108          | Tofu Pad Thai       | Asian    | 14.50  |
| 3                | 2        | 2023-01-01  | 11:57:40   | 124     | 124          | Spaghetti           | Italian  | 14.50  |
| 4                | 2        | 2023-01-01  | 11:57:40   | 117     | 117          | Chicken Burrito     | Mexican  | 12.95  |
| 5                | 2        | 2023-01-01  | 11:57:40   | 129     | 129          | Mushroom Ravioli    | Italian  | 15.50  |
| 6                | 2        | 2023-01-01  | 11:57:40   | 106     | 106          | French Fries        | American | 7.00   |
| 7                | 3        | 2023-01-01  | 12:12:28   | 117     | 117          | Chicken Burrito     | Mexican  | 12.95  |
| 8                | 3        | 2023-01-01  | 12:12:28   | 119     | 119          | Chicken Torta       | Mexican  | 11.95  |
| 9                | 4        | 2023-01-01  | 12:16:31   | 117     | 117          | Chicken Burrito     | Mexican  | 12.95  |
| 10               | 5        | 2023-01-01  | 12:21:30   | 117     | 117          | Chicken Burrito     | Mexican  | 12.95  |


### Number of Purchases by Item (Ascending)
```sql
SELECT mi.item_name, mi.category, COUNT(od.order_details_id) AS number_of_purchases
FROM order_details AS od
JOIN menu_items AS mi
ON mi.menu_item_id = od.item_id
GROUP BY mi.item_name, mi.category
ORDER BY number_of_purchases ASC;
```

**Output:**
| item_name                | category | number_of_purchases |
|--------------------------|----------|---------------------|
| Chicken Tacos            | Mexican  | 123                 |
| Potstickers              | Asian    | 205                 |
| Cheese Lasagna           | Italian  | 207                 |
| Steak Tacos              | Mexican  | 214                 |
| Cheese Quesadillas       | Mexican  | 233                 |
| Chips & Guacamole        | Mexican  | 237                 |
| Veggie Burger            | American | 238                 |
| Shrimp Scampi            | Italian  | 239                 |
| Fettuccine Alfredo       | Italian  | 249                 |
| Hot Dog                  | American | 257                 |
| Meat Lasagna             | Italian  | 273                 |
| Salmon Roll              | Asian    | 324                 |
| Steak Burrito            | Mexican  | 354                 |
| California Roll          | Asian    | 355                 |
| Mushroom Ravioli         | Italian  | 359                 |
| Pork Ramen               | Asian    | 360                 |
| Chicken Parmesan         | Italian  | 364                 |
| Spaghetti                | Italian  | 367                 |
| Chicken Torta            | Mexican  | 379                 |
| Eggplant Parmesan        | Italian  | 420                 |
| Chicken Burrito          | Mexican  | 455                 |
| Orange Chicken           | Asian    | 456                 |
| Chips & Salsa            | Mexican  | 461                 |
| Mac & Cheese             | American | 463                 |
| Spaghetti & Meatballs    | Italian  | 470                 |
| Steak Torta              | Mexican  | 489                 |
| Tofu Pad Thai            | Asian    | 562                 |
| French Fries             | American | 571                 |
| Cheeseburger             | American | 583                 |
| Korean Beef Bowl         | Asian    | 588                 |
| Edamame                  | Asian    | 620                 |
| Hamburger                | American | 622                 |


### Number of Purchases by Item (Descending)
```sql
SELECT mi.item_name, mi.category, COUNT(od.order_details_id) AS number_of_purchases
FROM order_details AS od
JOIN menu_items AS mi
ON mi.menu_item_id = od.item_id
GROUP BY mi.item_name, mi.category
ORDER BY number_of_purchases DESC;
```

**Output:**
| item_name                | category | number_of_purchases |
|--------------------------|----------|---------------------|
| Hamburger                | American | 622                 |
| Edamame                  | Asian    | 620                 |
| Korean Beef Bowl         | Asian    | 588                 |
| Cheeseburger             | American | 583                 |
| French Fries             | American | 571                 |
| Tofu Pad Thai            | Asian    | 562                 |
| Steak Torta              | Mexican  | 489                 |
| Spaghetti & Meatballs    | Italian  | 470                 |
| Mac & Cheese             | American | 463                 |
| Chips & Salsa            | Mexican  | 461                 |
| Orange Chicken           | Asian    | 456                 |
| Chicken Burrito          | Mexican  | 455                 |
| Eggplant Parmesan        | Italian  | 420                 |
| Chicken Torta            | Mexican  | 379                 |
| Spaghetti                | Italian  | 367                 |
| Chicken Parmesan         | Italian  | 364                 |
| Pork Ramen               | Asian    | 360                 |
| Mushroom Ravioli         | Italian  | 359                 |
| California Roll          | Asian    | 355                 |
| Steak Burrito            | Mexican  | 354                 |
| Salmon Roll              | Asian    | 324                 |
| Meat Lasagna             | Italian  | 273                 |
| Hot Dog                  | American | 257                 |
| Fettuccine Alfredo       | Italian  | 249                 |
| Shrimp Scampi            | Italian  | 239                 |
| Veggie Burger            | American | 238                 |
| Chips & Guacamole        | Mexican  | 237                 |
| Cheese Quesadillas       | Mexican  | 233                 |
| Steak Tacos              | Mexican  | 214                 |
| Cheese Lasagna           | Italian  | 207                 |
| Potstickers              | Asian    | 205                 |
| Chicken Tacos            | Mexican  | 123                 |


### Top 5 Orders by Total Spend
```sql
SELECT od.order_id, SUM(mi.price) AS total_spend
FROM order_details AS od
JOIN menu_items AS mi
ON mi.menu_item_id = od.item_id
GROUP BY od.order_id
ORDER BY total_spend DESC
LIMIT 5;
```

**Output:**
| order_id | total_spend |
|----------|-------------|
| 440      | 192.15      |
| 2075     | 191.05      |
| 1957     | 190.10      |
| 330      | 189.70      |
| 2675     | 185.10      |


### Item Categories by number of items
```sql
SELECT mi.category, COUNT(od.item_id) AS number_of_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON mi.menu_item_id = od.item_id
WHERE od.order_id = 440
GROUP BY mi.category;
```

**Output:**
| category | number_of_items |
|----------|-----------------|
| Mexican  | 2               |
| American | 2               |
| Italian  | 8               |
| Asian    | 2               |


### Item Categories for Top 5 Orders by Spend
```sql
SELECT od.order_id, mi.category, COUNT(od.item_id) AS number_of_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
ON mi.menu_item_id = od.item_id
WHERE od.order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY od.order_id, mi.category
ORDER BY mi.category, number_of_items DESC;
```

**Output:**
| order_id | category | number_of_items |
|----------|----------|-----------------|
| 1957     | American | 3               |
| 2675     | American | 3               |
| 440      | American | 2               |
| 330      | American | 1               |
| 2075     | American | 1               |
| 330      | Asian    | 6               |
| 1957     | Asian    | 3               |
| 2075     | Asian    | 3               |
| 2675     | Asian    | 3               |
| 440      | Asian    | 2               |
| 440      | Italian  | 8               |
| 2075     | Italian  | 6               |
| 1957     | Italian  | 5               |
| 2675     | Italian  | 4               |
| 330      | Italian  | 3               |
| 330      | Mexican  | 4               |
| 2675     | Mexican  | 4               |
| 1957     | Mexican  | 3               |
| 2075     | Mexican  | 3               |
| 440      | Mexican  | 2               |

---

## Insights

* Hamburger, Edamame, Korean Beef Bowl are the most purchased items

* American and Asian items are sold the most in volume

* Top spending orders mostly came from Italian items


* Italian dishes are higher priced and bring more revenue per order

