with warehouse_table as (
    select *
    from {{ref("silver_warehouse")}})

    select
    row_number() over (order by warehouse_id) as warehouse_key,
    *
    from warehouse_table