--source:crm
/*
===========================================================
DDL Script: Create Bronze Tables
===========================================================

Purpose:
This script defines the base-level DDL structure for tables in the Bronze schema.
It drops existing Bronze tables (if present) and recreates them from scratch.

When to use:
✔ When setting up the initial Bronze layer  
✔ During redefinition of raw data capture structure  
✔ To align raw table structures before ETL processing

Actions Performed:
✔ DROP TABLE if it already exists  
✔ CREATE TABLE under the Bronze schema with required raw data fields

Usage Notes:
- Run this before ingesting raw data into Bronze tables
- These tables typically store unprocessed or minimally processed data

===========================================================
*/

IF OBJECT_ID('bronze.crm_cust_info','U') IS NOT NULL
DROP TABLE bronze.crm_cust_info;

CREATE TABLE bronze.crm_cust_info(
cst_id INT,
cst_key NVARCHAR(50),
cst_firstname NVARCHAR(50),
cst_lastname NVARCHAR(50),
cst_marital_status NVARCHAR(50),
cst_gndr NVARCHAR(50),
cst_create_date DATE
);


IF OBJECT_ID('bronze.crm_prd_info','U') IS NOT NULL
DROP TABLE bronze.crm_prd_info;

CREATE TABLE bronze.crm_prd_info(
prd_id INT,
prd_key NVARCHAR(50),
prd_nm NVARCHAR(50),
prd_cost INT,
prd_line NVARCHAR(50),
prd_start_dt DATETIME,
prd_end_dt DATETIME
);


IF OBJECT_ID('bronze.crm_sales_details','U') IS NOT NULL
DROP TABLE bronze.crm_sales_details;

CREATE TABLE bronze.crm_sales_details(
sls_ord_num NVARCHAR(50),
sls_prd_key NVARCHAR(50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);


--source:erp

IF OBJECT_ID('bronze.erp_loc_a101','U') IS NOT NULL
DROP TABLE bronze.erp_loc_a101;

CREATE TABLE bronze.erp_loc_a101(
cid NVARCHAR(50),
cntry NVARCHAR(50)
);


IF OBJECT_ID('bronze.erp_cust_az12','U') IS NOT NULL
DROP TABLE bronze.erp_cust_az12;

CREATE TABLE bronze.erp_cust_az12(
cid NVARCHAR(50),
bdate DATE,
gen NVARCHAR(50)
);


IF OBJECT_ID('bronze.erp_px_cat_g1v2','U') IS NOT NULL
DROP TABLE bronze.erp_px_cat_g1v2;

CREATE TABLE bronze.erp_px_cat_g1v2(
id NVARCHAR(50),
cat NVARCHAR(50),
subcat NVARCHAR(50),
maintenance NVARCHAR(50)
); 

--can't use create or replace in SQL Server so, manually check each IF its NOT NULL
