WITH sales_data AS (
    SELECT
        EXTRACT(YEAR FROM s.transaction_timestamp) AS transaction_year,
        EXTRACT(MONTH FROM s.transaction_timestamp) AS transaction_month,
        p_cat.category,
        COUNT(DISTINCT s.user_id) AS unique_customers,
        SUM(s.revenue) AS total_revenue,
        SUM(s.cost) AS total_cost
    FROM
        {{ ref('sales_transactions') }} s  
    LEFT JOIN
        {{ ref('product_catalog') }} p_cat  
        ON s.product_id = p_cat.product_id
    GROUP BY
        transaction_year, transaction_month, p_cat.category
)
SELECT * FROM sales_data
