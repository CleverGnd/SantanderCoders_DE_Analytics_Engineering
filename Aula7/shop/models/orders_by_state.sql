{{ config(materialized='view') }}

SELECT 
    customers.customer_state, 
    COUNT(orders.order_id) AS total
FROM 
    `dbt_shop.orders` AS orders 
    INNER JOIN `dbt_shop.customers` AS customers 
        ON customers.customer_id = orders.customer_id
GROUP BY 
    customers.customer_state