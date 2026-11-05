with deilvery_table as (
    select *
    from {{ref("silver_delivery")}})

    , shipment_table as (
        select *
        from  {{ref("gold_fact_shipments")}})

        , main_table as (
        select
        d.DELIVERY_ID,
        d.DELIVERY_STATUS,
         d.EXPECTED_DATE,
          d.ACTUAL_DATE,
         d.DELAY_DAYS,
          d.DELIVERY_ATTEMPT,
         d.DELIVERY_COST,
            d.SHIPMENT_ID,
            s.SHIPMENT_KEY,
           s.ACTUAL_DELIVERY_DATE,
       s.EXPECTED_DELIVERY_DATE,
        s.ORDER_ID,
       s.SHIP_DATE,
         s.SHIPMENT_STATUS,
           s.SHIPPING_COST,
              s.WAREHOUSE_ID,
           s.ORDER_KEY,
           s.CUSTOMER_ID,
          s.CUSTOMER_KEY,
           s.NAME,
          s.COUNTRY,
           s.CITY,
           s.SEGMENT,
            s.STATUS,
            s.DATE,
          s.WAREHOUSE_KEY,
         s.WAREHOUSE_NAME,
        s.WAREHOUSE_TYPE,
          s.CAPCITY_UNITS,
         s.COUNTRY1,
         s.STATUS1,
         s.CITY1
         from deilvery_table as d 
        left join shipment_table as s 
        on d.shipment_id = s.shipment_id)

        select
        row_number() over (order by delivery_id) as delivery_key,
         DELIVERY_ID,
        DELIVERY_STATUS,
         EXPECTED_DATE,
          ACTUAL_DATE,
         DELAY_DAYS,
         DELIVERY_ATTEMPT,
        DELIVERY_COST,
            SHIPMENT_ID,
            SHIPMENT_KEY,
         ACTUAL_DELIVERY_DATE,
       EXPECTED_DELIVERY_DATE,
        ORDER_ID,
       SHIP_DATE,
         SHIPMENT_STATUS,
           SHIPPING_COST,
              WAREHOUSE_ID,
           ORDER_KEY,
           CUSTOMER_ID,
          CUSTOMER_KEY,
          NAME,
         COUNTRY,
        CITY,
          SEGMENT,
            STATUS,
            DATE,
          WAREHOUSE_KEY,
       WAREHOUSE_NAME,
        WAREHOUSE_TYPE,
          CAPCITY_UNITS,
         COUNTRY1,
         STATUS1,
         CITY1
         from main_table



