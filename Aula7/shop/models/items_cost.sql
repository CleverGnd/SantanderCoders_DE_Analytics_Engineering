SELECT  
    order_items.product_id AS produto,
    SUM(order_items.price) AS soma_produtos
FROM 
    `dbt_shop.order_items` AS order_items 
GROUP BY 
    order_items.product_id;