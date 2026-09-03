
-- E-commerce Delivery Reliability Analysis
-- These queries use the processed table created by
-- notebooks/01_data_inventory.ipynb.

-- 1. Overall delivery reliability baseline

WITH delivery_orders AS (
    SELECT *
    FROM read_csv_auto(
        'data/processed/delivery_orders_analysis.csv'
    )
)

SELECT
    COUNT(*) AS delivered_order_count,

    SUM(
        CASE
            WHEN late_delivery THEN 1
            ELSE 0
        END
    ) AS late_delivery_count,

    ROUND(
        100.0 * AVG(
            CASE
                WHEN late_delivery THEN 1.0
                ELSE 0.0
            END
        ),
        2
    ) AS late_delivery_rate_pct,

    ROUND(
        MEDIAN(delivery_days),
        2
    ) AS median_delivery_days

FROM delivery_orders;


-- 2. Monthly delivery reliability
-- Months with fewer than 1,000 orders are excluded.

WITH delivery_orders AS (
    SELECT *
    FROM read_csv_auto(
        'data/processed/delivery_orders_analysis.csv'
    )
)

SELECT
    purchase_month,

    COUNT(*) AS order_count,

    SUM(
        CASE
            WHEN late_delivery THEN 1
            ELSE 0
        END
    ) AS late_delivery_count,

    ROUND(
        100.0 * AVG(
            CASE
                WHEN late_delivery THEN 1.0
                ELSE 0.0
            END
        ),
        2
    ) AS late_delivery_rate_pct,

    ROUND(
        MEDIAN(delivery_days),
        2
    ) AS median_delivery_days

FROM delivery_orders

GROUP BY purchase_month

HAVING COUNT(*) >= 1000

ORDER BY purchase_month;


-- 3. State ranking using a window function

WITH delivery_orders AS (
    SELECT *
    FROM read_csv_auto(
        'data/processed/delivery_orders_analysis.csv'
    )
),

state_metrics AS (
    SELECT
        customer_state,

        COUNT(*) AS delivered_order_count,

        SUM(
            CASE
                WHEN late_delivery THEN 1
                ELSE 0
            END
        ) AS late_delivery_count,

        ROUND(
            100.0 * AVG(
                CASE
                    WHEN late_delivery THEN 1.0
                    ELSE 0.0
                END
            ),
            2
        ) AS late_delivery_rate_pct,

        ROUND(
            MEDIAN(delivery_days),
            2
        ) AS median_delivery_days

    FROM delivery_orders

    GROUP BY customer_state

    HAVING COUNT(*) >= 1000
)

SELECT
    customer_state,
    delivered_order_count,
    late_delivery_count,
    late_delivery_rate_pct,
    median_delivery_days,

    DENSE_RANK() OVER (
        ORDER BY late_delivery_rate_pct DESC
    ) AS late_delivery_risk_rank

FROM state_metrics

ORDER BY late_delivery_risk_rank;
