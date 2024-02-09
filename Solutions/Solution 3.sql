/* What was the first item from the menu purchased by each customer? */

WITH firstItem AS (   -- created CTE 
    SELECT
        s.customer_id,
        m.product_name,
        ROW_NUMBER() OVER (PARTITION BY s.customer_id ORDER BY s.order_date) AS row_num  -- assigning rankimg to each row
    FROM
        sales s
    LEFT JOIN
        menu m ON s.product_id = m.product_id
)

-- The final SELECT statement filters for rows where row_num is 1, indicating the first item for each customer 

select customer_id, product_name
from firstItem 
where row_num = 1
order by customer_id ASC;
    