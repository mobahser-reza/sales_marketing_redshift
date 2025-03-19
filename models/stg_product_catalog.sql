SELECT
    product_id,
    product_name,
    category
FROM
    {{ ref('product_catalog') }}
