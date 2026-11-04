project Overview

GlobalFlow is an end-to-end Supply Chain Analytics Engineering project built using Snowflake and dbt.

The project transforms raw supply chain data into reliable, analytics-ready data models using modern data warehouse architecture and best practices.

Technology Stack

Snowflake – Cloud Data Warehouse

dbt Cloud – Data Transformation

SQL – Data Modeling and Analytics

Git & GitHub – Version Control

Data Architecture

The project follows the Medallion Architecture:

Bronze: Raw data ingestion.

Silver: Data cleaning, standardization, and transformation.

Gold: Business-ready fact and dimension models.

Data Modeling

The Gold layer follows the Kimball dimensional modeling approach, including fact and dimension tables.

dbt Features

Sources and staging models

Jinja and reusable macros

Data quality tests

Incremental models

Snapshots and SCD Type 2

Documentation and lineage

Business Scope

The project covers:

Orders and order items

Inventory management

Warehouses

Suppliers and supplier performance

Purchase orders

Shipments and delivery

Returns and transportation

Project Status

Core transformations, dimensional models, data quality tests, incremental processing, snapshots, and dbt documentation have been implemented.
