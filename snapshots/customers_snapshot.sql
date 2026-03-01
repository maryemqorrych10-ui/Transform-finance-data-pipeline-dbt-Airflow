{% snapshot customers_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='id',
      strategy='check',
      check_cols=['name', 'email', 'country']
    )
}}

select * from {{ source('raw_data', 'customers') }}

{% endsnapshot %}