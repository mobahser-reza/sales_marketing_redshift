{% macro extract_year_month(timestamp_column) %}
    EXTRACT(YEAR FROM {{ timestamp_column }}) AS year,
    EXTRACT(MONTH FROM {{ timestamp_column }}) AS month
{% endmacro %}
