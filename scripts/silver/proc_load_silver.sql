/*
===============================================================================
Stored Procedure: Load Silver Layer (Bronze -> Silver)
===============================================================================
Script Purpose:
This stored procedure performs the ETL (Extract, Transform, Load) process to 
populate the 'silver' schema tables from the 'bronze' schema.
Actions Performed:
- Truncates Silver tables.
- Inserts transformed and cleansed data from Bronze into Silver tables.

Parameters:
None. 
This stored procedure does not accept any parameters or return any values.

Usage Example:
EXEC Silver.load_silver;
===============================================================================
 */

CREATE OR ALTER PROCEDURE silver.load_silver AS
BEGIN
    BEGIN TRY
    DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;
    SET @batch_start_time = GETDATE();
    PRINT '======================================================';
    PRINT 'Loading Silver Layer';
    PRINT '======================================================';

    PRINT '------------------------------------------------------';
    PRINT 'Loading CRM Tables';
    PRINT '------------------------------------------------------';

    -- Loading silver.crm_cust_info
    SET @start_time = GETDATE();
    PRINT '>> Truncating Table: silver.crm_cust_info';
    TRUNCATE TABLE silver.crm_cust_info;

