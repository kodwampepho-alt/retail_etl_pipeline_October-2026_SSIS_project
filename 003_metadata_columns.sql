--- Add metadata columns
ALTER TABLE bronze.product_sales
ADD LoadDate DATETIME2 NOT NULL DEFAULT (GETDATE()),
    RecordID INT IDENTITY(1,1) NOT NULL;

--- Set RecordID as the primary key
ALTER TABLE bronze.product_sales
ADD CONSTRAINT PK_product_sales PRIMARY KEY (RecordID);
