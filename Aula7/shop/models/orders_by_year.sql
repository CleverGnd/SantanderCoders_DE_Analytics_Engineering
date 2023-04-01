{{ config(materialized='table') }}

SELECT 
   EXTRACT(YEAR FROM DATE(order_approved_at)) AS `YEAR`,
   COUNT(order_id) AS `TOTAL ORDERS`
FROM 
   `dbt_shop.orders`
GROUP BY 
   1