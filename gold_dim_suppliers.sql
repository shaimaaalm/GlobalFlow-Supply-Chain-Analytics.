with supplier_table as(
    select *
    from {{ref("silver_suppliers")}})

    select
    row_number() over (order by supplier_id) as supplier_key,
    *
    from supplier_table
    