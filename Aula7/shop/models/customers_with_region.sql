{{ config(materialized = 'table') }}

SELECT  customers.customer_id,
        customers.customer_unique_id,
        customers.customer_zip_code_prefix,
        customers.customer_city,
        customers.customer_state,
        
CASE 
    WHEN customers.customer_state IN ('MT', 'MS', 'GO', 'DF') THEN 'Centro-Oeste'
    WHEN customers.customer_state IN ('SP', 'RJ', 'MG', 'ES') THEN 'Sudeste'
    WHEN customers.customer_state IN ('RS', 'ES', 'PR') THEN 'Sul'
    WHEN customers.customer_state IN ('CE', 'PI', 'MA', 'BA', 'AL', 'PE', 'PB', 'RN') THEN 'Nordeste'
    WHEN customers.customer_state IN ('RR', 'AP', 'PA', 'AM', 'AC', 'RO', 'TO') THEN 'Norte'
    ELSE NULL
END AS region

FROM
    dbt_shop.customers;