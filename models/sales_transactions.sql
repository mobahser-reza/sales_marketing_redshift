{{ config(materialized='table') }}

SELECT
    transaction_id,
    product_id,
    user_id,
    transaction_timestamp,
    revenue,
    cost
FROM
    {{ source('public', 'sales_transactions') }}