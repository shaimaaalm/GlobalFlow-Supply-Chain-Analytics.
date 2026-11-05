with order_items as (
    select *
    from {{ref("silver_order_items")}})

    , order_table as (
        select *
        from {{ref("gold_fact_orders")}})
    
    , product_table as (
        select *
        from {{ref("gold_dim_products")}})
        , main_table as (
        select
        oi.order_id,
        oi.order_item_id,
        oi.product_id,
        oi.quantity,
        oi.unit_price,
        oi.amount,
        oi.discount1,
        o.order_key,
        o.customer_id,
        o.order_Date,
        o.order_status,
        o.priority,
        o.shipment_method,
        o.cuurency,
        o.total_amount,
        o.name,
        o.country,
        o.city,
        o.segment,
        o.status,
        o.date,
        p.product_key,
        p.p_name,
        p.brand1,
        p.category,
        p.SUBCATEGORY1,
         p.created_at,
            p.is_active,
          p.rec_level,
           p.selling_price,
          p.unit_cost,
            p.weight_kg1
       
        from order_items as oi
        left join order_table as o 
        on oi.order_id = o.order_id
        left join product_table as p 
        on oi.product_id = p.product_id )

        select
        row_number() over (order by order_id ) as order_item_key,
        order_id,
      order_item_id,
       product_id,
        quantity,
        unit_price,
        amount,
        discount1,
       order_key,
        customer_id,
        order_Date,
        order_status,
        priority,
        shipment_method,
       cuurency,
       total_amount,
        name,
        country,
        city,
       segment,
        status,
        date,
        product_key,
        p_name,
        brand1,
        category,
        SUBCATEGORY1,
         created_at,
            is_active,
          rec_level,
           selling_price,
          unit_cost,
           weight_kg1
           from main_table