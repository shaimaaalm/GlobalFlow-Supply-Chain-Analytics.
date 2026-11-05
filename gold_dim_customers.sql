with customer_table as (
    select *
    from {{ref("silver_customers")}})

    select
    row_number() over (order by customer_id) as customer_key,
    *
    from customer_table

   