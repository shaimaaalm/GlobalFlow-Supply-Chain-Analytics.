with shipment_table as(
    select *
    from {{ref("silver_shipments")}})

    , order_table as(
        select *
        from {{ref("gold_fact_orders")}})

        , warehouse_table as(
            select *
            from {{ref("gold_dim_warehouse")}})

           , main_table as (
            select
            s.SHIPMENT_ID,
            s.ACTUAL_DELIVERY_DATE,
           s.EXPECTED_DELIVERY_DATE,
            s.ORDER_ID,
            s.SHIP_DATE,
             s.SHIPMENT_STATUS,
                s.SHIPPING_COST,
                    s.WAREHOUSE_ID,
                    o.ORDER_KEY,
                    o.CUSTOMER_ID,
                       o.ORDER_DATE,
                       o.ORDER_STATUS,
                          o.PRIORITY,
                        o.SHIPMENT_METHOD,
                          o.CUURENCY,
                          o.TOTAL_AMOUNT,
                         o.CUSTOMER_KEY,
                           o.NAME,
                           o.COUNTRY,
                            o.CITY,
                                o.SEGMENT,
                              o.STATUS,
                               o.DATE,
                               w.WAREHOUSE_KEy,
                               w.WAREHOUSE_NAME,
                            w.WAREHOUSE_TYPE,
                             w.CAPCITY_UNITS,
                                 w.COUNTRY as country1,
                                 w.STATUS as status1,
                                 w.city as city1
                                 from shipment_table as s
                                 left join order_table as o
                                 on s.order_id = o.order_id
                                 left join warehouse_table as w 
                                 on s.warehouse_id = w.warehouse_id)

            select
            row_number() over (order by shipment_id) as shipment_key,
           SHIPMENT_ID,
            ACTUAL_DELIVERY_DATE,
           EXPECTED_DELIVERY_DATE,
            ORDER_ID,
            SHIP_DATE,
             SHIPMENT_STATUS,
               SHIPPING_COST,
                   WAREHOUSE_ID,
                    ORDER_KEY,
                    CUSTOMER_ID,
                       ORDER_DATE,
                       ORDER_STATUS,
                          PRIORITY,
                       SHIPMENT_METHOD,
                          CUURENCY,
                          TOTAL_AMOUNT,
                        CUSTOMER_KEY,
                          NAME,
                           COUNTRY,
                           CITY,
                        SEGMENT,
                            STATUS,
                               DATE,
                               WAREHOUSE_KEy,
                               WAREHOUSE_NAME,
                           WAREHOUSE_TYPE,
                            CAPCITY_UNITS,
                                country1,
                                 status1,
                                 city1
                                 from  main_table

