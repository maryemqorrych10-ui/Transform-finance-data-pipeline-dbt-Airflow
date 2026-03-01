{{ config(materialized='table') }}

select
    product_id,
    product_name,
    product_category,
    product_price
from {{ ref('stg_products') }}