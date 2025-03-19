{{ config(materialized='table') }}

SELECT
    product_id,
    product_name,
    category
FROM
    {{ source('public', 'product_catalog') }}