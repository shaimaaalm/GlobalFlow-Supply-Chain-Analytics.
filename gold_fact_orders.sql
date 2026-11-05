
with orders_table as (
    {{config (matrialized = 'incremental', unique_key = 'order_id', incremental_strategy = 'merge')}}
    select *
    from {{ref("silver_orders")}})
{% if is_incremental() %}
where order_Date > (select max(order_Date)) from {{this}}
         {% endif %}

    , customers_table as (
        select *
        from {{ref("gold_dim_customers")}})
        , main_table as (
        select
        o.order_id,
        o.customer_id,
        o.order_Date,
        o.order_status,
        o.priority,
        o.shipment_method,
        o.cuurency,
        o.total_amount,
        c.customer_key,
        c.name,
        c.country,
        c.city,
        c.segment,
        c.status,
        c.date
        from orders_table as o
        left join customers_table as c  
        on o.customer_id = c.customer_id)

        select
        row_number() over (order by order_id) as order_key,
          order_id,
        customer_id,
        order_Date,
        order_status,
        priority,
        shipment_method,
        cuurency,
        total_amount,
        customer_key,
        name,
        country,
        city,
        segment,
        status,
        date
        from main_table

