with inventory_table as (
    select *
    from {{ref("silver_inventory")}})

    , warehouse_table as (
        select *
        from {{ref("gold_dim_warehouse")}})

        , product_table as (
            select *
            from {{ref("gold_dim_products")}})
             
             , main_table as (
            select
            i.iNVENTORY_ID,
            i.CLOSING_STOCK,
             i.DAMAGED_QTY,
             i.OPENING_STOCK,
             i.PRODUCT_ID,
             i.RECEIVED_QTY,
             i.SNAPSHOT_DATE,
           i.SOLD_QTY,
          i.WAREHOUSE_ID,
           i.STOCKOUT_FLAG,
           w.WAREHOUSE_KEY,
            w.WAREHOUSE_NAME,
            w.WAREHOUSE_TYPE,
            w.CAPCITY_UNITS,
                 w.CITY,
                 w.COUNTRY,
                    w.STATUS,
                p.product_key, 
                 p.P_NAME,
                p.CATEGORY,
                p.CREATED_AT,
                 p.IS_ACTIVE,
                 p.REC_LEVEL,
               p.SELLING_PRICE,
                 p.UNIT_COST,
                p.BRAND1,
              p.SUBCATEGORY1,
                  p.WEIGHT_KG1

           from inventory_table as i 
           left join warehouse_table as w 
           on i.warehouse_id = w.warehouse_id 
           left join product_table as p 
           on i.product_id = p.product_id)

           select 
           row_number() over (order by inventory_id) as inventory_key,
              iNVENTORY_ID,
            CLOSING_STOCK,
             DAMAGED_QTY,
             OPENING_STOCK,
             PRODUCT_ID,
             RECEIVED_QTY,
             SNAPSHOT_DATE,
           SOLD_QTY,
          WAREHOUSE_ID,
           STOCKOUT_FLAG,
          WAREHOUSE_KEY,
            WAREHOUSE_NAME,
           WAREHOUSE_TYPE,
           CAPCITY_UNITS,
            CITY,
            COUNTRY,
            STATUS,
               product_key, 
                 P_NAME,
                CATEGORY,
                CREATED_AT,
                 IS_ACTIVE,
                 REC_LEVEL,
               SELLING_PRICE,
                UNIT_COST,
               BRAND1,
              SUBCATEGORY1,
            WEIGHT_KG1
            from main_table
           

