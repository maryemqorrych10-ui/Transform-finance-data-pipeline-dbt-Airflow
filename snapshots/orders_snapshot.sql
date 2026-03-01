{% snapshot orders_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='id',
      strategy='timestamp',
      updated_at='order_date'
    )
}}

select
    id,
    customer_id,
    order_date,
    total_amount,
    status
from {{ source('raw_data', 'orders') }}

{% endsnapshot %}