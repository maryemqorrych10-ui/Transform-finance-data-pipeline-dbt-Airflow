{% snapshot products_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='id',
      strategy='check',
      check_cols=['name', 'category', 'price']
    )
}}

select
    id,
    name,
    category,
    price
from {{ source('raw_data', 'products') }}

{% endsnapshot %}