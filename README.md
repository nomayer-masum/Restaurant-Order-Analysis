# Restaurant Order Analysis

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

**Output**:
| menu_item_id | item_name     | category | price  |
|--------------|---------------|----------|--------|
| 130          | Shrimp Scampi | Italian  | 19.95  |

---
