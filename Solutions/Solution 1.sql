/* Question 1: What is the total amount each customer spent at the restaurant? */


-- part 1: total Unique Customer

Select 
     distinct customer_id
From 
     sales;

-- part 2 joining the table and getting the total amount

select  
     s.customer_id, sum(m.price) as Total_amt   -- Total_amt = Total Amount spent
from 
     sales s
Left Join 
     menu m on s.product_id = m.product_id
		Group by s.customer_id    -- grouping the customer_id column aggregated with sum function
        order by customer_id ASC;   -- to sort the query in ascending order
        
        


