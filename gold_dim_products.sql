with product_table as (
    select *
    from {{ref("silver_products")}})

    select
    row_number() over (order by product_id) as product_key, 
    product_id,
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
    from product_table