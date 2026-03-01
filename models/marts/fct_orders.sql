{{ config(materialized='table') }}

select
    o.order_id,
    o.customer_id,
    o.order_date,

    sum(oi.quantity) as total_quantity,

    sum(oi.quantity * oi.unit_price) as total_amount,

    count(distinct oi.product_id) as number_of_products

from {{ ref('stg_orders') }} o

left join {{ ref('stg_order_items') }} oi
    on o.order_id = oi.order_id

group by
    o.order_id,
    o.customer_id,
    o.order_date