/* What is the most purchased item on the menu and how many times was it purchased by all customers? */


-- joining  the sales and menu table
select  
     * 
from 
     sales s
Left Join 
     menu m on s.product_id = m.product_id;

-- main query
-- most purchased item and number of times it was purchased
select m.product_name, Count(product_name) as item_purchased
from sales s
Left Join 
     menu m on s.product_id = m.product_id
Group by m.product_name
Order by item_purchased Desc
Limit 1;   



      