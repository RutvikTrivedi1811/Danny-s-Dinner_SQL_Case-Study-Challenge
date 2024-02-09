/* Which item was purchased first by the customer after they became a member? */

-- joining the three tables
Select * From 
	    sales s
Inner join 
        menu m on s.product_id = m.product_id
Inner join 
		members mb on s.customer_id = mb.customer_id;

-- first purchased item after becoming member

WITH FirstPurchaseAfterJoin AS (
    SELECT
        s.customer_id,
        m.product_name,
        s.order_date,
        RANK() OVER (PARTITION BY s.customer_id ORDER BY s.order_date) AS purchase_rank
    FROM
        sales s
    INNER JOIN
        menu m ON s.product_id = m.product_id
    INNER JOIN
        members mb ON s.customer_id = mb.customer_id
    WHERE
        s.order_date > mb.join_date
)

SELECT
    customer_id,
    product_name,
    order_date
FROM
    FirstPurchaseAfterJoin
WHERE
    purchase_rank = 1
ORDER BY
    customer_id, order_date;
