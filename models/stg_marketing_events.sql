WITH marketing_data AS (
    SELECT
        EXTRACT(YEAR FROM me.event_timestamp) AS event_year,
        EXTRACT(MONTH FROM me.event_timestamp) AS event_month,
        me.campaign,
        COUNT(me.event_id) AS total_marketing_events,
        SUM(me.cost) AS total_marketing_cost
    FROM
        {{ ref('marketing_events') }} me
    GROUP BY
        event_year, event_month, me.campaign
)
SELECT * FROM marketing_data
