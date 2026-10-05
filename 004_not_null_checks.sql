--- debug (category name landed in the product_name column)
UPDATE bronze.product_sales
SET product_name = NULL;

--- perform not NULL checks
SELECT
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END)      AS null_category,
    SUM(CASE WHEN units_sold IS NULL THEN 1 ELSE 0 END)    AS null_units_sold,
    SUM(CASE WHEN unit_price IS NULL THEN 1 ELSE 0 END)    AS null_unit_price,
    SUM(CASE WHEN total_revenue IS NULL THEN 1 ELSE 0 END) AS null_total_revenue,
    SUM(CASE WHEN [timestamp] IS NULL THEN 1 ELSE 0 END)   AS null_timestamp,
    SUM(CASE WHEN LoadDate IS NULL THEN 1 ELSE 0 END)      AS null_loaddate,
    SUM(CASE WHEN RecordID IS NULL THEN 1 ELSE 0 END)      AS null_recordid
FROM bronze.product_sales;
