/* If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have? */

SELECT
    s.customer_id,
    SUM(CASE WHEN m.product_name = 'sushi' THEN 2 * m.price * 10 ELSE m.price * 10 END) AS total_points
FROM
    sales s
INNER JOIN
    menu m ON s.product_id = m.product_id
GROUP BY
    s.customer_id
ORDER BY
    s.customer_id;

