--- 1. Create a bronze table

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'retail_sales_bronze' AND schema_id = SCHEMA_ID('bronze'))
BEGIN
    CREATE TABLE bronze.retail_sales_bronze (
        product_id     NVARCHAR(50),
        product_name   NVARCHAR(255),
        category       NVARCHAR(100),
        units_sold     INT,
        unit_price     DECIMAL(10,2),
        total_revenue  DECIMAL(12,2),
        [timestamp]    DATETIME2
    );
END
GO

--- 4. Load records with data type mapping
INSERT INTO bronze.retail_sales_bronze
    (product_id, product_name, category, units_sold, unit_price, total_revenue, [timestamp])
SELECT
    customer_id,        -- example mapping: adjust to your real columns
    product_category,   -- csv column goes here
    product_category,
    TRY_CAST(quantity AS INT),          -- minimal transformation
    TRY_CAST(price_per_unit AS DECIMAL(10,2)),
    TRY_CAST(total_amount AS DECIMAL(12,2)),
    TRY_CAST([date] AS DATETIME2)
FROM dbo.retail_sales_dataset;

USE retail_sales_stg;
GO

EXEC sp_rename 'bronze.retail_sales_bronze', 'product_sales';
GO

select top 10 *
from bronze.product_sales 
