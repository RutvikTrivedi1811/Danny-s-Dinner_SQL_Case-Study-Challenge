/* How many days has each customer visited the restaurant? */

SELECT * FROM `danny's_dinner`.sales;

Select 
     customer_id, count(order_date) as Total_vist   -- Total_visit = No. of days visted by each customer
From 
     sales
Group by 
     customer_id;