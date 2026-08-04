/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/
-- Create or update the stored procedure
CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN

    /*=========================================================
      Variable Declarations
    =========================================================*/

    -- Tracks execution time for each table load
    DECLARE
        @start_time DATETIME,
        @end_time DATETIME,

        -- Tracks total batch execution time
        @batch_start_time DATETIME,
        @batch_end_time DATETIME;

    BEGIN TRY

        -- Record batch start time
        SET @batch_start_time = GETDATE();

        PRINT '================================================';
        PRINT 'Loading Bronze Layer';
        PRINT '================================================';

        /*=====================================================
                    LOAD CRM TABLES
        =====================================================*/

        PRINT '------------------------------------------------';
        PRINT 'Loading CRM Tables';
        PRINT '------------------------------------------------';


        /*-----------------------------------------------------
          CRM CUSTOMER TABLE
        -----------------------------------------------------*/

        SET @start_time = GETDATE();

        -- Remove old data before loading new data
        PRINT '>> Truncating Table: bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;

        -- Import CSV file into Bronze table
        PRINT '>> Inserting Data Into: bronze.crm_cust_info';

        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\elvis\OneDrive\Desktop\SQLTABLE-DW\source_crm\cust_info.csv'
        WITH
        (
            -- Skip CSV header
            FIRSTROW = 2,

            -- Comma-separated values
            FIELDTERMINATOR = ',',

            -- Use table lock for faster loading
            TABLOCK
        );

        -- Record load completion time
        SET @end_time = GETDATE();

        -- Display load duration
        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR)
            + ' seconds';

        PRINT '>> -------------';



        /*-----------------------------------------------------
          CRM PRODUCT TABLE
        -----------------------------------------------------*/

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;

        PRINT '>> Inserting Data Into: bronze.crm_prd_info';

        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\elvis\OneDrive\Desktop\SQLTABLE-DW\source_crm\prd_info.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR)
            + ' seconds';

        PRINT '>> -------------';



        /*-----------------------------------------------------
          CRM SALES TABLE
        -----------------------------------------------------*/

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;

        PRINT '>> Inserting Data Into: bronze.crm_sales_details';

        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\elvis\OneDrive\Desktop\SQLTABLE-DW\source_crm\sales_details.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR)
            + ' seconds';

        PRINT '>> -------------';


        /*=====================================================
                    LOAD ERP TABLES
        =====================================================*/

        PRINT '------------------------------------------------';
        PRINT 'Loading ERP Tables';
        PRINT '------------------------------------------------';


        /*-----------------------------------------------------
          ERP CUSTOMER LOCATION TABLE
        -----------------------------------------------------*/

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.erp_loc_a101';
        TRUNCATE TABLE bronze.erp_loc_a101;

        PRINT '>> Inserting Data Into: bronze.erp_loc_a101';

        BULK INSERT bronze.erp_loc_a101
        FROM 'C:\Users\elvis\OneDrive\Desktop\SQLTABLE-DW\source_crm\loc_a101.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR)
            + ' seconds';

        PRINT '>> -------------';



        /*-----------------------------------------------------
          ERP CUSTOMER DETAILS TABLE
        -----------------------------------------------------*/

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;

        PRINT '>> Inserting Data Into: bronze.erp_cust_az12';

        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\elvis\OneDrive\Desktop\SQLTABLE-DW\source_crm\cust_az12.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR)
            + ' seconds';

        PRINT '>> -------------';



        /*-----------------------------------------------------
          ERP PRODUCT CATEGORY TABLE
        -----------------------------------------------------*/

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table: bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;

        PRINT '>> Inserting Data Into: bronze.erp_px_cat_g1v2';

        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\elvis\OneDrive\Desktop\SQLTABLE-DW\source_crm\px_cat_g1v2.csv'
        WITH
        (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        SET @end_time = GETDATE();

        PRINT '>> Load Duration: '
            + CAST(DATEDIFF(SECOND,@start_time,@end_time) AS NVARCHAR)
            + ' seconds';

        PRINT '>> -------------';


        /*=====================================================
                BATCH COMPLETION MESSAGE
        =====================================================*/

        -- Record batch completion time
        SET @batch_end_time = GETDATE();

        PRINT '==========================================';
        PRINT 'Loading Bronze Layer Completed Successfully';

        -- Display total execution time
        PRINT 'Total Load Duration: '
            + CAST(DATEDIFF(SECOND,@batch_start_time,@batch_end_time) AS NVARCHAR)
            + ' seconds';

        PRINT '==========================================';


    END TRY


    /*=========================================================
      ERROR HANDLING
    =========================================================*/

    BEGIN CATCH

        -- Display error information if loading fails
        PRINT '==========================================';
        PRINT 'ERROR OCCURRED DURING BRONZE LOAD';
        PRINT 'Error Message : ' + ERROR_MESSAGE();
        PRINT 'Error Number  : ' + CAST(ERROR_NUMBER() AS NVARCHAR);
        PRINT 'Error State   : ' + CAST(ERROR_STATE() AS NVARCHAR);
        PRINT '==========================================';

    END CATCH

END
