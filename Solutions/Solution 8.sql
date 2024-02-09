/* What is the total items and amount spent for each member before they became a member? */

SELECT
        s.customer_id,
        COUNT(*) AS total_items_before_membership,
        SUM(m.price) AS total_amount_spent_before_membership
    FROM
        sales s
    INNER JOIN
        menu m ON s.product_id = m.product_id
    LEFT JOIN
        members mb ON s.customer_id = mb.customer_id
    WHERE
        s.order_date < mb.join_date OR mb.join_date IS NULL
    GROUP BY
        s.customer_id;


