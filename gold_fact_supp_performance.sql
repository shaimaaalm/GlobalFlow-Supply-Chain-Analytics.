with supp_performance_table as (
    select *
    from {{ref("silver_supp_performance")}})

    , supplier_table as (
        select *
        from {{ref("gold_dim_suppliers")}})

    , purchase_table as (
        select *
        from {{ref("gold_fact_purchase_order")}})
 
        , main_table as (
        select
        sp.SUPPLIER_PERFORMANCE_ID,
         sp.SUPPLIER_ID,
          sp.RECEIVED_QUANTITY,
            sp.QUALITY_SCORE1,
           sp.PURCHASE_ORDER_ID,
        sp.PROMISED_DATE,
        sp.OVERALL_SCORE1,
       sp.ORDERED_QUANTITY,
         sp.EVALUATION_DATE,
         sp.DELIVERY_SCORE1,
          sp.DEFECTIVE_QUANTITY,
          sp.ACTUAL_DATE,
          s.SUPPLIER_KEY,
         s.SUPPLIER_NAME,
         s.COUNTRY,
        s.CITY,
         s.SUPPLIER_TYPE,
         s.CREATED_AT as created_at2,
           s.LEAD_TIME_DAYS,
           s.STATUS,
        s.PAYMENT_TERM,
       s.SUPPLIER_RATING1,
      p.PURCHASE_ORDER_key,
         p.PURCHASE_STATUS,
          p.ORDER_DATE,
         p.ORDERED_QUANTITY as ordered_quantity2,
          p.PROMISED_DATE as promised_date2,
           p.RECEIVED_DATE,
           p.RECEIVED_QUANTITY1,
             p.UNIT_COST,
            p.WAREHOUSE_ID,
             p.PRODUCT_ID,
            p.product_key, 
             p.P_NAME,
             p.CATEGORY,
            p.CREATED_AT,
           p.IS_ACTIVE,
            p.REC_LEVEL,
           p.SELLING_PRICE,
           p.unit_cost2,
           p.BRAND1,
           p.SUBCATEGORY1,
            p.WEIGHT_KG1
            from supp_performance_table as sp 
            left join supplier_table as s 
            on sp.supplier_id = s.supplier_id
            left join purchase_table as p 
            on sp.PURCHASE_ORDER_ID = p.PURCHASE_ORDER_ID)

            select 
            row_number() over (order by SUPPLIER_PERFORMANCE_ID) as SUPPLIER_PERFORMANCE_key,
            SUPPLIER_PERFORMANCE_ID,
         SUPPLIER_ID,
          RECEIVED_QUANTITY,
           QUALITY_SCORE1,
          PURCHASE_ORDER_ID,
        PROMISED_DATE,
        OVERALL_SCORE1,
       ORDERED_QUANTITY,
         EVALUATION_DATE,
         DELIVERY_SCORE1,
          DEFECTIVE_QUANTITY,
          ACTUAL_DATE,
         SUPPLIER_KEY,
        SUPPLIER_NAME,
        COUNTRY,
        CITY,
         SUPPLIER_TYPE,
         CREATED_AT as created_at2,
          LEAD_TIME_DAYS,
          STATUS,
        PAYMENT_TERM,
       SUPPLIER_RATING1,
      PURCHASE_ORDER_key,
         PURCHASE_STATUS,
          ORDER_DATE,
         ORDERED_QUANTITY as ordered_quantity2,
         PROMISED_DATE as promised_date2,
           RECEIVED_DATE,
          RECEIVED_QUANTITY1,
           UNIT_COST,
          PRODUCT_ID,
           product_key, 
            P_NAME,
            CATEGORY,
           CREATED_AT,
          IS_ACTIVE,
            REC_LEVEL,
           SELLING_PRICE,
           unit_cost2,
           BRAND1,
           SUBCATEGORY1,
            WEIGHT_KG1
            from main_table