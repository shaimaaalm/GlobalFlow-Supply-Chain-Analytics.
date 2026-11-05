with purchase_table as (
    select *
    from {{ref("silver_purchase_orders")}})
     
     , product_table as (
        select *
        from {{ref("gold_dim_products")}})

        , warehouse_table as (
            select *
            from {{ref("gold_dim_warehouse")}})

            , supplier_table as (
                select *
                from {{ref("gold_dim_suppliers")}})
       
       , main_table as (
          select
          po.PURCHASE_ORDER_ID,
         po.PURCHASE_STATUS,
          po.ORDER_DATE,
         po.ORDERED_QUANTITY,
          po.PROMISED_DATE,
           po.RECEIVED_DATE,
           po.RECEIVED_QUANTITY1,
            po.SUPPLIER_ID,
             po.UNIT_COST,
            po.WAREHOUSE_ID,
             po.PRODUCT_ID,
            p.product_key, 
             p.P_NAME,
             p.CATEGORY,
            p.CREATED_AT,
           p.IS_ACTIVE,
            p.REC_LEVEL,
           p.SELLING_PRICE,
           p.UNIT_COST as unit_cost2,
           p.BRAND1,
           p.SUBCATEGORY1,
            p.WEIGHT_KG1,
            w.WAREHOUSE_KEY,
         w.WAREHOUSE_NAME,
        w.WAREHOUSE_TYPE,
       w.CAPCITY_UNITS,
        w.CITY,
          w.COUNTRY,
          w.STATUS,
          s.SUPPLIER_KEY,
         s.SUPPLIER_NAME,
           s.COUNTRY as country2,
           s.CITY as city2,
         s.SUPPLIER_TYPE,
         s.CREATED_AT as created_at2,
          s.LEAD_TIME_DAYS,
          s.STATUS as status2,
         s.PAYMENT_TERM,
         s.SUPPLIER_RATING1
             from purchase_table as po 
             left join product_table as p 
             on po.product_id = p.product_id
             left join warehouse_table as w 
             on po.warehouse_id = w.warehouse_id
             left join supplier_table as s 
             on po.supplier_id = s.supplier_id)

             select 
             row_number() over (order by PURCHASE_ORDER_ID) as purchase_order_key,
              PURCHASE_ORDER_ID,
         PURCHASE_STATUS,
          ORDER_DATE,
         ORDERED_QUANTITY,
          PROMISED_DATE,
        RECEIVED_DATE,
           RECEIVED_QUANTITY1,
            SUPPLIER_ID,
             UNIT_COST,
            WAREHOUSE_ID,
             PRODUCT_ID,
            product_key, 
             P_NAME,
             CATEGORY,
            CREATED_AT,
           IS_ACTIVE,
            REC_LEVEL,
           SELLING_PRICE,
           UNIT_COST as unit_cost2,
           BRAND1,
           SUBCATEGORY1,
            WEIGHT_KG1,
            WAREHOUSE_KEY,
         WAREHOUSE_NAME,
        WAREHOUSE_TYPE,
    CAPCITY_UNITS,
        CITY,
          COUNTRY,
          STATUS,
          SUPPLIER_KEY,
        SUPPLIER_NAME,
           COUNTRY as country2,
           CITY as city2,
         SUPPLIER_TYPE,
         CREATED_AT as created_at2,
          LEAD_TIME_DAYS,
          STATUS as status2,
         PAYMENT_TERM,
         SUPPLIER_RATING1
         from main_table