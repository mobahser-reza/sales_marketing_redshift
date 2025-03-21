WITH sales_data AS (
    SELECT
        transaction_year,
        transaction_month,
        category,
        unique_customers,
        total_revenue,
        total_cost
    FROM
        {{ ref('stg_sales_transactions') }}
),

marketing_data AS (
    SELECT
        event_year AS transaction_year,
        event_month AS transaction_month,
        campaign,
        total_marketing_events,
        total_marketing_cost
    FROM
        {{ ref('stg_marketing_events') }}
),

final AS (
    SELECT
        s.transaction_year,
        s.transaction_month,
        s.category,
        s.unique_customers,
        s.total_revenue,
        s.total_cost,
        COALESCE(m.total_marketing_cost, 0) AS total_marketing_cost,
        COALESCE(m.total_marketing_events, 0) AS total_marketing_events,
        -- Using the macro to calculate revenue-to-cost ratio
        {{ calculate_revenue_to_cost_ratio('s.total_revenue', 's.total_cost') }} AS revenue_to_cost_ratio
    FROM
        sales_data s
    LEFT JOIN
        marketing_data m
        ON s.transaction_year = m.transaction_year
        AND s.transaction_month = m.transaction_month
)

SELECT * FROM final
WHERE total_revenue > 0
ORDER BY transaction_year, transaction_month, category