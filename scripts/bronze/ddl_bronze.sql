/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

-- Check whether the table already exists.
-- If it exists, delete it before creating a new one.
IF OBJECT_ID('bronze.crm_cust_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_cust_info;
GO

-- Create table to store raw customer information
-- imported from the CRM system.
CREATE TABLE bronze.crm_cust_info (

    -- Unique customer identifier
    cst_id INT,

    -- Business/customer key
    cst_key NVARCHAR(50),

    -- Customer first name
    cst_firstname NVARCHAR(50),

    -- Customer last name
    cst_lastname NVARCHAR(50),

    -- Marital status
    cst_marital_status NVARCHAR(50),

    -- Customer gender
    cst_gndr NVARCHAR(50),

    -- Record creation date
    cst_create_date DATE
);
GO


/*===========================================================
  CRM PRODUCT INFORMATION TABLE
===========================================================*/

-- Drop existing product table if available.
IF OBJECT_ID('bronze.crm_prd_info', 'U') IS NOT NULL
    DROP TABLE bronze.crm_prd_info;
GO

-- Stores raw product information received
-- from the CRM source system.
CREATE TABLE bronze.crm_prd_info (

    -- Product ID
    prd_id INT,

    -- Product key
    prd_key NVARCHAR(50),

    -- Product name
    prd_nm NVARCHAR(50),

    -- Product cost
    prd_cost INT,

    -- Product line/category
    prd_line NVARCHAR(50),

    -- Product availability start date
    prd_start_dt DATETIME,

    -- Product availability end date
    prd_end_dt DATETIME
);
GO


/*===========================================================
  CRM SALES DETAILS TABLE
===========================================================*/

-- Remove existing sales table.
IF OBJECT_ID('bronze.crm_sales_details', 'U') IS NOT NULL
    DROP TABLE bronze.crm_sales_details;
GO

-- Stores raw sales transactions from CRM.
CREATE TABLE bronze.crm_sales_details (

    -- Sales order number
    sls_ord_num NVARCHAR(50),

    -- Product key
    sls_prd_key NVARCHAR(50),

    -- Customer ID
    sls_cust_id INT,

    -- Order date (stored as integer in source)
    sls_order_dt INT,

    -- Shipping date
    sls_ship_dt INT,

    -- Due date
    sls_due_dt INT,

    -- Total sales amount
    sls_sales INT,

    -- Quantity sold
    sls_quantity INT,

    -- Price per product
    sls_price INT
);
GO


/*===========================================================
  ERP CUSTOMER LOCATION TABLE
===========================================================*/

-- Delete existing location table.
IF OBJECT_ID('bronze.erp_loc_a101', 'U') IS NOT NULL
    DROP TABLE bronze.erp_loc_a101;
GO

-- Stores customer location information
-- imported from the ERP system.
CREATE TABLE bronze.erp_loc_a101 (

    -- Customer ID
    cid NVARCHAR(50),

    -- Customer country
    cntry NVARCHAR(50)
);
GO


/*===========================================================
  ERP CUSTOMER DETAILS TABLE
===========================================================*/

-- Drop customer details table if present.
IF OBJECT_ID('bronze.erp_cust_az12', 'U') IS NOT NULL
    DROP TABLE bronze.erp_cust_az12;
GO

-- Stores additional customer information
-- such as birth date and gender.
CREATE TABLE bronze.erp_cust_az12 (

    -- Customer ID
    cid NVARCHAR(50),

    -- Birth date
    bdate DATE,

    -- Gender
    gen NVARCHAR(50)
);
GO


/*===========================================================
  ERP PRODUCT CATEGORY TABLE
===========================================================*/

-- Remove existing product category table.
IF OBJECT_ID('bronze.erp_px_cat_g1v2', 'U') IS NOT NULL
    DROP TABLE bronze.erp_px_cat_g1v2;
GO

-- Stores product category information
-- from the ERP system.
CREATE TABLE bronze.erp_px_cat_g1v2 (

    -- Product ID
    id NVARCHAR(50),

    -- Main category
    cat NVARCHAR(50),

    -- Product subcategory
    subcat NVARCHAR(50),

    -- Maintenance information
    maintenance NVARCHAR(50)
);
GO
