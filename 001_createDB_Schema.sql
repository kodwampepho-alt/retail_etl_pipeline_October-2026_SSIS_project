-- 1. Create the database if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'retail_sales_stg')
BEGIN
    CREATE DATABASE retail_sales_stg;
END
GO

--- 2. Create the bronze schema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'bronze')
BEGIN
    EXEC('CREATE SCHEMA bronze');
END
GO

-- 3. Create the datawarehouse if it doesn't exist
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'retail_sales_dwh')
BEGIN
    CREATE DATABASE retail_sales_dwh;
END
GO

--- 4. Create the silver schema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'silver')
BEGIN
    EXEC('CREATE SCHEMA silver');
END
GO

--- 5. Create the gold schema
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
BEGIN
    EXEC('CREATE SCHEMA gold');
END
GO