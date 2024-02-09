/* Which item was the most popular for each customer? */

-- joining  the sales and menu table
select  
     * 
from 
     sales s
Inner Join 
     menu m on s.product_id = m.product_id;
 
 /* The WITH clause creates a common table expression (CTE) named RankedMenu. This CTE includes the customer_id, 
 product_name, total_purchased, and assigns a row number to each product for each customer based on the purchase count */
 
 -- main query
With popularItem AS (
Select s.customer_id, m.product_name, count(m.product_name) as total_purchased,
Row_number() Over (partition by s.customer_id order by count(m.product_name) Desc) as row_num
from sales s
Left Join 
     menu m on s.product_id = m.product_id
	 Group by s.customer_id, m.product_name
)

Select customer_id, product_name 
from popularItem
where row_num = 1
Order by customer_id;