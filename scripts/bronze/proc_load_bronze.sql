/*
===========================================================
Stored Procedure: Load Bronze Layer (External CSVs -> Bronze)
===========================================================

Purpose:
This stored procedure loads raw data into Bronze schema tables using BULK INSERT
from external CSV files exported from CRM and ERP systems.

Main Tasks:
✔ Truncate existing Bronze tables  
✔ Use BULK INSERT to load data from CSV files (CRM & ERP) into Bronze tables

Source Details:
- CRM CSV File: Contains customer-related raw data  
- ERP CSV File: Contains transaction and operations-related raw data

BULK INSERT Method:
Used for high-performance data loading from local or shared paths directly into SQL tables.

Example Usage:
    EXEC Bronze.load_bronze;

Usage Notes:
- Run this procedure after obtaining the latest CSVs from CRM and ERP  
- Ensure file paths, permissions, and formats (delimiter, headers) are properly configured  
- Recommended to validate file contents before running

===========================================================
*/


CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME,@end_time DATETIME,@batch_start_time DATETIME,@batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_end_time=GETDATE();
		PRINT '================================================================='
		PRINT 'Loading Bronze Layer'
		PRINT '================================================================='

		PRINT '-----------------------------------------------------------------'
		PRINT 'Loading CRM Tables'
		PRINT '-----------------------------------------------------------------'

		SET @start_time=GETDATE();
		PRINT '>>Truncating Table: bronze.crm_cust_info'
		TRUNCATE TABLE bronze.crm_cust_info;

		PRINT '>>Inserting Data Into Table:bronze.crm_cust_info'
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\sql\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT '>>Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR)+' seconds';
		PRINT '>>-------------';


		SET @start_time=GETDATE();
		PRINT '>>Truncating Table: bronze.crm_prd_info'
		TRUNCATE TABLE bronze.crm_prd_info;

		PRINT '>>Inserting Data Into Table:bronze.crm_prd_info'
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\sql\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT '>>Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR)+' seconds';
		PRINT '>>-------------';


		SET @start_time=GETDATE();
		PRINT '>>Truncating Table: bronze.crm_sales_details'
		TRUNCATE TABLE bronze.crm_sales_details;

		PRINT '>>Inserting Data Into Table:bronze.crm_sales_details'
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\sql\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT '>>Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR)+' seconds';
		PRINT '>>-------------';


		PRINT '-----------------------------------------------------------------'
		PRINT 'Loading ERP Tables'
		PRINT '-----------------------------------------------------------------'

		SET @start_time=GETDATE();
		PRINT '>>Truncating Table: bronze.erp_loc_a101'
		TRUNCATE TABLE bronze.erp_loc_a101;

		PRINT '>>Inserting Data Into Table:bronze.erp_loc_a101'
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\sql\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
		WITH (
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT '>>Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR)+' seconds';
		PRINT '>>-------------';


		SET @start_time=GETDATE();
		PRINT '>>Truncating Table: bronze.erp_cust_az12'
		TRUNCATE TABLE bronze.erp_cust_az12;

		PRINT '>>Inserting Data Into Table:bronze.erp_cust_az12'
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\sql\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
		WITH (
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT '>>Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR)+' seconds';
		PRINT '>>-------------';


		SET @start_time=GETDATE();
		PRINT '>>Truncating Table: bronze.erp_px_cat_g1v2'
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;

		PRINT '>>Inserting Data Into Table:bronze.erp_px_cat_g1v2'
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\sql\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
		WITH (
		FIRSTROW=2,
		FIELDTERMINATOR=',',
		TABLOCK
		);
		SET @end_time=GETDATE();
		PRINT '>>Load Duration: '+CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR)+' seconds';
		PRINT '>>-------------';

		SET @batch_end_time=GETDATE();
		PRINT '=============================================================='
		PRINT 'Loading Bronze Layer is Completed';
		PRINT '  -Total Load Duration: '+CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS NVARCHAR)+' seconds';
		PRINT '=============================================================='
	END TRY
	BEGIN CATCH
		PRINT '========================================================'
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message'+ ERROR_MESSAGE();
		PRINT 'Error Message'+CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message'+CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '========================================================'
	END CATCH
END
